/*
 * Copyright (C) 2026 Ardour custom fork
 *
 * Pro-Tools-style playlist lane implementation.
 *
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; either version 2 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License along
 * with this program; if not, write to the Free Software Foundation, Inc.,
 * 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
 */

#include <list>

#include "pbd/i18n.h"
#include "pbd/unwind.h"
#include "pbd/stateful_diff_command.h"

#include "gtkmm2ext/utils.h"
#include "gtkmm2ext/widget_state.h"

#include "widgets/tooltips.h"

#include "ardour/audioplaylist.h"
#include "ardour/audio_track.h"
#include "ardour/profile.h"
#include "ardour/region.h"
#include "ardour/region_factory.h"
#include "ardour/session.h"

#include "editor-view/audio_streamview.h"
#include "editor-view/public_editor.h"
#include "editor-view/region_view.h"
#include "editor-view/region_selection.h"
#include "editor-view/selection.h"
#include "editor-view/playlist_lane_time_axis.h"

using namespace ARDOUR;
using namespace ArdourWidgets;
using namespace PBD;
using namespace Gtk;
using namespace Editing;

namespace {

void
pl_lane_collect_region (RegionView* rv, std::list<std::shared_ptr<Region> >* l)
{
	if (rv && rv->region ()) {
		l->push_back (rv->region ());
	}
}

} /* anonymous namespace */

PlaylistLaneTimeAxisView::PlaylistLaneTimeAxisView (PublicEditor& ed, Session* sess, ArdourCanvas::Canvas& canvas,
                                                    RouteTimeAxisView& parent,
                                                    std::shared_ptr<AudioPlaylist> pl)
	: SessionHandlePtr (sess)
	, AudioTimeAxisView (ed, sess, canvas)
	, _parent (parent)
	, _lane_playlist (pl)
	, _audition_button (ArdourButton::Element (ArdourButton::Edge | ArdourButton::Body | ArdourButton::VectorIcon), true)
	, _promote_button (ArdourButton::default_elements)
	, _audition_active (false)
	, _lane_controls_built (false)
	, _in_set_height (false)
{
}

PlaylistLaneTimeAxisView::~PlaylistLaneTimeAxisView ()
{
	/* never leave the disk reader pointed at this (about to vanish) lane */
	if (_audition_active) {
		set_audition_active (false);
	}

	/* remove our OWN gui-object-state node (keyed by our overridden state_id);
	 * the base RouteTimeAxisView destructor skips its cleanup for lanes so it
	 * doesn't touch the parent track's shared "rtav <route>" node.
	 */
	cleanup_gui_properties ();
}

void
PlaylistLaneTimeAxisView::set_route (std::shared_ptr<Route> rt)
{
	/* this view shares the parent track's Route; make sure ~RouteUI does NOT
	 * tear down route-wide GUI state (color picker, comment editor, the
	 * "route <id>" gui-object-state node) that the parent track still owns.
	 */
	_skip_route_state_cleanup = true;

	AudioTimeAxisView::set_route (rt);

	/* Bind the stream view to our alternate playlist NOW, rather than relying
	 * on first_idle(): lanes are child views and the editor only calls
	 * first_idle() on top-level track_views, so on session load a restored
	 * lane would otherwise never display its regions (it would look empty even
	 * though the audio still plays).
	 */
	if (_view) {
		_view->set_displayed_playlist (_lane_playlist);
	}

	/* the automation children created by AudioTimeAxisView::set_route do not
	 * belong on a lane: keep them hidden.
	 */
	for (Children::iterator i = children.begin (); i != children.end (); ++i) {
		(*i)->set_marked_for_display (false);
	}

	build_lane_controls ();
}

std::shared_ptr<Playlist>
PlaylistLaneTimeAxisView::playlist () const
{
	return _lane_playlist;
}

std::string
PlaylistLaneTimeAxisView::state_id () const
{
	std::string id ("playlist-lane ");
	if (_route) {
		id += _route->id ().to_s ();
	}
	id += " ";
	if (_lane_playlist) {
		id += _lane_playlist->id ().to_s ();
	}
	return id;
}

bool
PlaylistLaneTimeAxisView::marked_for_display () const
{
	/* use AxisView's per-state-id gui property, NOT the route's hidden flag */
	return AxisView::marked_for_display ();
}

bool
PlaylistLaneTimeAxisView::set_marked_for_display (bool yn)
{
	return AxisView::set_marked_for_display (yn);
}

void
PlaylistLaneTimeAxisView::first_idle ()
{
	/* Instead of the usual attach() (which would display and then follow the
	 * track's active playlist), pin the stream view directly to our assigned
	 * alternate playlist.
	 */
	_view->set_displayed_playlist (_lane_playlist);
	post_construct ();
}

void
PlaylistLaneTimeAxisView::hide_route_controls ()
{
	if (mute_button)       { mute_button->set_no_show_all (true);       mute_button->hide (); }
	if (solo_button)       { solo_button->set_no_show_all (true);       solo_button->hide (); }
	if (rec_enable_button) { rec_enable_button->set_no_show_all (true); rec_enable_button->hide (); }

	route_group_button.set_no_show_all (true);    route_group_button.hide ();
	playlist_button.set_no_show_all (true);       playlist_button.hide ();
	automation_button.set_no_show_all (true);     automation_button.hide ();
	elastic_audio_button.set_no_show_all (true);  elastic_audio_button.hide ();
	playlist_lanes_button.set_no_show_all (true); playlist_lanes_button.hide ();
	number_label.set_no_show_all (true);          number_label.hide ();

	gm.get_level_meter ().set_no_show_all (true); gm.get_level_meter ().hide ();
	gm.get_gain_slider ().set_no_show_all (true); gm.get_gain_slider ().hide ();
}

void
PlaylistLaneTimeAxisView::build_lane_controls ()
{
	hide_route_controls ();

	_audition_button.set_name ("route button");
	_audition_button.set_icon (ArdourIcon::ToolAudition);
	_audition_button.set_tweaks (ArdourButton::TrackHeader);
	set_tooltip (_audition_button, _("Listen to this playlist lane instead of the main playlist"));
	_audition_button.signal_button_press_event ().connect (sigc::mem_fun (*this, &PlaylistLaneTimeAxisView::audition_button_press), false);

	_promote_button.set_name ("route button");
	_promote_button.set_text ("↑");
	_promote_button.set_tweaks (ArdourButton::TrackHeader);
	set_tooltip (_promote_button, _("Copy the selection in this lane to the main playlist"));
	_promote_button.signal_button_press_event ().connect (sigc::mem_fun (*this, &PlaylistLaneTimeAxisView::promote_button_press), false);

	/* place over the (now hidden) record/mute cells of the standard header */
	if (ARDOUR::Profile->get_mixbus ()) {
		controls_table.attach (_audition_button, 0, 1, 0, 1, Gtk::SHRINK, Gtk::SHRINK);
		controls_table.attach (_promote_button,  1, 2, 0, 1, Gtk::SHRINK, Gtk::SHRINK);
	} else {
		controls_table.attach (_audition_button, 2, 3, 0, 1, Gtk::SHRINK, Gtk::SHRINK);
		controls_table.attach (_promote_button,  3, 4, 0, 1, Gtk::SHRINK, Gtk::SHRINK);
	}

	_audition_button.show ();
	_promote_button.show ();

	_lane_controls_built = true;

	/* keep the promote button in step with the selection */
	_editor.get_selection ().RegionsChanged.connect (sigc::mem_fun (*this, &PlaylistLaneTimeAxisView::update_promote_sensitivity));

	label_view ();
	update_promote_sensitivity ();
}

void
PlaylistLaneTimeAxisView::label_view ()
{
	std::string n = _lane_playlist ? _lane_playlist->name () : std::string ();
	if (n != name_label.get_text ()) {
		name_label.set_text (n);
		set_tooltip (name_label, n);
	}
	number_label.set_text ("");
}

void
PlaylistLaneTimeAxisView::set_height (uint32_t h, TrackHeightMode m, bool from_idle)
{
	/* deliberately skip RouteTimeAxisView::set_height, which shows/hides the
	 * standard track-header buttons based on height. Use the generic path and
	 * resize our stream view ourselves.
	 */
	TimeAxisView::set_height (h, m, from_idle);

	if (_view) {
		_view->set_height ((double) current_height ());
	}

	if (_lane_controls_built) {
		/* the generic path may re-show widgets; keep the lane header tidy */
		hide_route_controls ();
		_audition_button.show ();
		_promote_button.show ();
	}

	/* a user drag of this lane's edge becomes the shared height for all lanes */
	if (_lane_controls_built && m == OnlySelf && !_in_set_height) {
		LaneResized (current_height ()); /* EMIT SIGNAL */
	}
}

void
PlaylistLaneTimeAxisView::apply_shared_height (uint32_t h)
{
	PBD::Unwinder<bool> uw (_in_set_height, true);
	set_height (h, OnlySelf);
}

bool
PlaylistLaneTimeAxisView::audition_button_press (GdkEventButton* ev)
{
	if (ev->button != 1) {
		return false;
	}

	/* let the parent enforce "only one lane auditioned per track" */
	AuditionToggled (this, !_audition_active); /* EMIT SIGNAL */
	return true;
}

void
PlaylistLaneTimeAxisView::set_audition_active (bool yn)
{
	if (_audition_active == yn) {
		return;
	}

	_audition_active = yn;
	_audition_button.set_active_state (yn ? Gtkmm2ext::ExplicitActive : Gtkmm2ext::Off);

	std::shared_ptr<Track> tr = track ();
	if (!tr) {
		return;
	}

	if (yn) {
		tr->set_audition_playlist (_lane_playlist);
	} else if (tr->audition_playlist () == _lane_playlist) {
		tr->clear_audition_playlist ();
	}
}

bool
PlaylistLaneTimeAxisView::promote_button_press (GdkEventButton* ev)
{
	if (ev->button != 1) {
		return false;
	}
	copy_selection_to_main ();
	return true;
}

void
PlaylistLaneTimeAxisView::update_promote_sensitivity ()
{
	if (!_lane_controls_built) {
		return;
	}
	bool any = _view && _view->num_selected_regionviews () > 0;
	_promote_button.set_sensitive (any);
}

void
PlaylistLaneTimeAxisView::copy_selection_to_main ()
{
	if (!_view) {
		return;
	}

	std::shared_ptr<Track> tr = track ();
	if (!tr) {
		return;
	}

	std::shared_ptr<Playlist> main_pl = tr->playlist (); /* the active/main playlist */
	if (!main_pl || main_pl == _lane_playlist) {
		return;
	}

	std::list<std::shared_ptr<Region> > to_copy;
	_view->foreach_selected_regionview (sigc::bind (sigc::ptr_fun (&pl_lane_collect_region), &to_copy));

	if (to_copy.empty ()) {
		return;
	}

	_editor.begin_reversible_command (_("copy selection to main playlist"));
	main_pl->clear_changes ();

	for (std::list<std::shared_ptr<Region> >::const_iterator i = to_copy.begin (); i != to_copy.end (); ++i) {
		std::shared_ptr<Region> copy = RegionFactory::create (*i, true);
		main_pl->add_region (copy, (*i)->position ());
	}

	_session->add_command (new StatefulDiffCommand (main_pl));
	_editor.commit_reversible_command ();
}

void
PlaylistLaneTimeAxisView::cut_copy_clear (Selection& selection, Editing::CutCopyOp op)
{
	/* operate on this lane's playlist, not the track's active one */
	std::shared_ptr<Playlist> pl = _lane_playlist;
	if (!pl) {
		return;
	}

	std::shared_ptr<Playlist> what_we_got;
	TimeSelection time (selection.time);

	pl->clear_changes ();
	pl->clear_owned_changes ();

	switch (op) {
	case Delete:
		if (pl->cut (time) != 0) {
			if (_editor.should_ripple ()) {
				pl->ripple (time.start_time (), -time.length (), NULL);
			}
			pl->rdiff_and_add_command (_session);
		}
		break;
	case Cut:
		if ((what_we_got = pl->cut (time)) != 0) {
			_editor.get_cut_buffer ().add (what_we_got);
			if (_editor.should_ripple ()) {
				pl->ripple (time.start_time (), -time.length (), NULL);
			}
			pl->rdiff_and_add_command (_session);
		}
		break;
	case Copy:
		if ((what_we_got = pl->copy (time)) != 0) {
			_editor.get_cut_buffer ().add (what_we_got);
		}
		break;
	case Clear:
		if ((what_we_got = pl->cut (time)) != 0) {
			if (_editor.should_ripple ()) {
				pl->ripple (time.start_time (), -time.length (), NULL);
			}
			pl->rdiff_and_add_command (_session);
		}
		break;
	}
}

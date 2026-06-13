/*
 * Copyright (C) 2006-2014 David Robillard <d@drobilla.net>
 * Copyright (C) 2007-2012 Carl Hetherington <carl@carlh.net>
 * Copyright (C) 2007-2017 Paul Davis <paul@linuxaudiosystems.com>
 * Copyright (C) 2007 Doug McLain <doug@nostar.net>
 * Copyright (C) 2008-2009 Hans Baier <hansfbaier@googlemail.com>
 * Copyright (C) 2012-2019 Robin Gareus <robin@gareus.org>
 * Copyright (C) 2013-2014 Colin Fletcher <colin.m.fletcher@googlemail.com>
 * Copyright (C) 2014-2017 Ben Loftis <ben@harrisonconsoles.com>
 * Copyright (C) 2015-2016 Nick Mainsbridge <mainsbridge@gmail.com>
 * Copyright (C) 2015-2016 Tim Mayberry <mojofunk@gmail.com>
 * Copyright (C) 2016 Julien "_FrnchFrgg_" RIVAUD <frnchfrgg@free.fr>
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

#include <cstdlib>
#include <cassert>
#include <cmath>

#include <algorithm>
#include <string>
#include <vector>
#include <map>
#include <utility>

#include <sigc++/bind.h>

#include <ytkmm/menu.h>
#include <ytkmm/menuitem.h>
#include <ytkmm/stock.h>

#include "pbd/error.h"
#include "pbd/whitespace.h"
#include "pbd/enumwriter.h"
#include "pbd/memento_command.h"
#include "pbd/stateful_diff_command.h"

#include "evoral/Parameter.h"

#include "ardour/amp.h"
#include "ardour/audioregion.h"
#include "ardour/meter.h"
#include "ardour/midi_track.h"
#include "ardour/playlist.h"
#include "ardour/audioplaylist.h"
#include "ardour/session_playlists.h"
#include "ardour/pan_controllable.h"
#include "ardour/pannable.h"
#include "ardour/panner.h"
#include "ardour/plugin_insert.h"
#include "ardour/processor.h"
#include "ardour/profile.h"
#include "ardour/route_group.h"
#include "ardour/session.h"
#include "ardour/surround_send.h"
#include "ardour/track.h"

#include "canvas/debug.h"

#include "gtkmm2ext/colors.h"
#include "gtkmm2ext/gtk_ui.h"
#include "gtkmm2ext/utils.h"

#include "widgets/ardour_button.h"
#include "widgets/prompter.h"
#include "widgets/tooltips.h"

#include "app-core/ardour_message.h"
#include "app-core/ardour_ui.h"
#include "editor-view/audio_streamview.h"
#include "platform-support/debug.h"
#include "app-core/enums_convert.h"
#include "editor-view/audio_region_view.h"
#include "editor-view/route_time_axis.h"
#include "editor-view/playlist_lane_time_axis.h"
#include "automation/automation_time_axis.h"
#include "app-core/enums.h"
#include "app-core/gui_thread.h"
#include "app-core/item_counts.h"
#include "app-core/keyboard.h"
#include "app-core/paste_context.h"
#include "midi-pianoroll/patch_change_widget.h"
#include "editor-view/point_selection.h"
#include "editor-view/public_editor.h"
#include "editor-view/region_view.h"
#include "editor-view/selection.h"
#include "session-config-dialogs/scale_dialog.h"
#include "editor-view/streamview.h"
#include "session-config-dialogs/ui_config.h"
#include "app-core/utils.h"
#include "editor-view/route_group_menu.h"

#include "pbd/i18n.h"

using namespace ARDOUR;
using namespace ArdourWidgets;
using namespace PBD;
using namespace Gtkmm2ext;
using namespace Gtk;
using namespace Editing;
using namespace std;
using std::list;

sigc::signal<void, bool> RouteTimeAxisView::signal_ctrl_touched;

namespace {

int
route_axis_px_scale (int px)
{
	return std::max (px, (int) rint (px * UIConfiguration::instance().get_ui_scale()));
}

Gdk::Color
mix_gdk_color (Gdk::Color const& base, Gdk::Color const& tint, double tint_amount)
{
	const double a = std::max (0.0, std::min (1.0, tint_amount));
	const double b = 1.0 - a;
	Gdk::Color mixed;

	mixed.set_rgb_p ((base.get_red_p () * b) + (tint.get_red_p () * a),
	                 (base.get_green_p () * b) + (tint.get_green_p () * a),
	                 (base.get_blue_p () * b) + (tint.get_blue_p () * a));

	return mixed;
}

void
modify_bg_all_states (Gtk::Widget& widget, Gdk::Color const& color)
{
	widget.modify_bg (Gtk::STATE_NORMAL, color);
	widget.modify_bg (Gtk::STATE_ACTIVE, color);
	widget.modify_bg (Gtk::STATE_PRELIGHT, color);
	widget.modify_bg (Gtk::STATE_SELECTED, color);
	widget.modify_bg (Gtk::STATE_INSENSITIVE, color);
}

void
modify_fg_all_states (Gtk::Widget& widget, Gdk::Color const& color)
{
	widget.modify_fg (Gtk::STATE_NORMAL, color);
	widget.modify_fg (Gtk::STATE_ACTIVE, color);
	widget.modify_fg (Gtk::STATE_PRELIGHT, color);
	widget.modify_fg (Gtk::STATE_SELECTED, color);
	widget.modify_fg (Gtk::STATE_INSENSITIVE, color);
}

void
refresh_elastic_audio_region_view (RegionView* rv, bool detect_transients)
{
	AudioRegionView* arv = dynamic_cast<AudioRegionView*> (rv);
	if (arv) {
		arv->redisplay_transient_features (detect_transients);
	}
}

} /* namespace */

RouteTimeAxisView::RouteTimeAxisView (PublicEditor& ed, Session* sess, ArdourCanvas::Canvas& canvas)
	: RouteUI(sess)
	, StripableTimeAxisView(ed, sess, canvas)
	, _view (0)
	, button_table (3, 3)
	, route_group_button (S_("RTAV|G"))
	, playlist_button (S_("RTAV|P"))
	, automation_button (S_("RTAV|A"))
	, elastic_audio_button (S_("Elastic|E"), ArdourButton::default_elements, true)
	, playlist_lanes_button (ArdourButton::Element (ArdourButton::Edge | ArdourButton::Body | ArdourButton::VectorIcon), true)
	, elastic_audio_menu (0)
	, automation_action_menu (0)
	, plugins_submenu_item (0)
	, route_group_menu (0)
	, overlaid_menu_item (0)
	, stacked_menu_item (0)
	, gm (sess, true, 75, 14)
	, _ignore_set_layer_display (false)
	, _elastic_audio_mode (ARDOUR::ElasticAudioDisabled)
	, _playlist_lanes_shown (false)
	, _playlist_lanes_rebuild_queued (false)
	, _playlist_lane_height (preset_height (HeightNormal))
	, pan_automation_item(NULL)
{
	subplugin_menu.set_name ("ArdourContextMenu");
	number_label.set_name("tracknumber label");
	number_label.set_elements((ArdourButton::Element)(ArdourButton::Edge|ArdourButton::Body|ArdourButton::Text|ArdourButton::Inactive));
	number_label.set_alignment(.5, .5);
	number_label.set_fallthrough_to_parent (true);

	sess->config.ParameterChanged.connect (*this, invalidator (*this), std::bind (&RouteTimeAxisView::parameter_changed, this, _1), gui_context());
	UIConfiguration::instance().ParameterChanged.connect (sigc::mem_fun (*this, &RouteTimeAxisView::parameter_changed));

	Controllable::ControlTouched.connect (
			ctrl_touched_connection, invalidator (*this), std::bind (&RouteTimeAxisView::show_touched_automation, this, _1), gui_context ()
    );

	route_color_side_bar.set_visible_window (true);
	route_color_side_bar.set_size_request (route_axis_px_scale (5), -1);
	route_color_side_bar.set_name (X_("EditorRouteColorBar"));
	route_color_side_bar.add_events (Gdk::BUTTON_PRESS_MASK);
	route_color_side_bar.signal_button_press_event().connect (sigc::mem_fun (*this, &RouteTimeAxisView::controls_ebox_button_press));
	time_axis_hbox.pack_start (route_color_side_bar, false, false, 0);
	time_axis_hbox.reorder_child (route_color_side_bar, 0);
	route_color_side_bar.show ();

	parameter_changed ("editor-stereo-only-meters");
}

void
RouteTimeAxisView::route_property_changed (const PBD::PropertyChange& what_changed)
{
	if (what_changed.contains (ARDOUR::Properties::name)) {
		label_view ();
	}
}

void
RouteTimeAxisView::set_route (std::shared_ptr<Route> rt)
{
	RouteUI::set_route (rt);
	StripableTimeAxisView::set_stripable (rt);

	CANVAS_DEBUG_NAME (_canvas_display, string_compose ("main for %1", rt->name()));
	CANVAS_DEBUG_NAME (selection_group, string_compose ("selections for %1", rt->name()));
	CANVAS_DEBUG_NAME (_ghost_group, string_compose ("ghosts for %1", rt->name()));

	int meter_width = 3;
	if (_route && _route->shared_peak_meter()->input_streams().n_total() == 1) {
		meter_width = 6;
	}
	gm.set_controls (_route, _route->shared_peak_meter(), _route->amp(), _route->gain_control());
	gm.get_level_meter().set_no_show_all();
	gm.get_level_meter().setup_meters(50, meter_width);
	gm.update_gain_sensitive ();

	uint32_t height;
	if (get_gui_property ("height", height)) {
		set_height (height);
	} else {
		set_height (preset_height (HeightNormal));
	}

	timestretch_rect = 0;
	no_redraw = false;

	route_group_button.set_name ("route button");
	playlist_button.set_name ("route button");
	automation_button.set_name ("route button");
	elastic_audio_button.set_name ("route button");
	playlist_lanes_button.set_name ("route button");

	route_group_button.signal_button_press_event().connect (sigc::mem_fun(*this, &RouteTimeAxisView::route_group_click), false);
	playlist_button.signal_button_press_event().connect (sigc::mem_fun(*this, &RouteTimeAxisView::playlist_click), false);
	automation_button.signal_button_press_event().connect (sigc::mem_fun(*this, &RouteTimeAxisView::automation_click), false);
	elastic_audio_button.signal_button_press_event().connect (sigc::mem_fun(*this, &RouteTimeAxisView::elastic_audio_edit_button_press), false);
	playlist_lanes_button.signal_button_press_event().connect (sigc::mem_fun(*this, &RouteTimeAxisView::playlist_lanes_click), false);

	if (is_track()) {

		if (ARDOUR::Profile->get_mixbus()) {
			controls_table.attach (*rec_enable_button, 0, 1, 0, 1, Gtk::SHRINK, Gtk::SHRINK, 0, 0);
		} else {
			controls_table.attach (*rec_enable_button, 2, 3, 0, 1, Gtk::SHRINK, Gtk::SHRINK, 0, 0);
		}

		if (is_midi_track()) {
			set_tooltip(*rec_enable_button, _("Record (Right-click for Step Edit)"));
			gm.set_fader_name ("MidiTrackFader");
		} else {
			set_tooltip(*rec_enable_button, _("Record"));
			gm.set_fader_name ("AudioTrackFader");
		}

		/* set playlist button tip to the current playlist, and make it update when it changes */
		update_playlist_tip ();
		track()->PlaylistChanged.connect (*this, invalidator (*this), ui_bind(&RouteTimeAxisView::update_playlist_tip, this), gui_context());

		/* keep the Pro-Tools-style lanes in sync when playlists are added or
		 * the active playlist is switched. Lanes themselves must NOT do this
		 * (they share the route) or they would recurse.
		 */
		if (!is_playlist_lane ()) {
			track()->PlaylistChanged.connect (*this, invalidator (*this), std::bind (&RouteTimeAxisView::playlists_maybe_changed, this), gui_context());
			track()->PlaylistAdded.connect (*this, invalidator (*this), std::bind (&RouteTimeAxisView::playlists_maybe_changed, this), gui_context());
		}

	} else {
		gm.set_fader_name ("AudioBusFader");
		Gtk::Fixed *blank = manage(new Gtk::Fixed());
		controls_button_size_group->add_widget(*blank);
		if (ARDOUR::Profile->get_mixbus() ) {
			controls_table.attach (*blank, 0, 1, 0, 1, Gtk::SHRINK, Gtk::SHRINK, 0, 0);
		} else {
			controls_table.attach (*blank, 2, 3, 0, 1, Gtk::SHRINK, Gtk::SHRINK, 0, 0);
		}
		blank->show();
	}

	top_hbox.pack_end(gm.get_level_meter(), false, false, 2);

	if (!ARDOUR::Profile->get_mixbus()) {
		controls_meters_size_group->add_widget (gm.get_level_meter());
	}

	if (_route->is_master()) {
		route_group_button.set_sensitive(false);
	}

	_route->meter_change.connect (*this, invalidator (*this), bind (&RouteTimeAxisView::meter_changed, this), gui_context());
	_route->input()->changed.connect (*this, invalidator (*this), std::bind (&RouteTimeAxisView::io_changed, this, _1), gui_context());
	_route->output()->changed.connect (*this, invalidator (*this), std::bind (&RouteTimeAxisView::io_changed, this, _1), gui_context());
	_route->track_number_changed.connect (*this, invalidator (*this), std::bind (&RouteTimeAxisView::label_view, this), gui_context());

	if (ARDOUR::Profile->get_mixbus()) {
		controls_table.attach (*mute_button, 1, 2, 0, 1, Gtk::SHRINK, Gtk::SHRINK, 0, 0);
	} else {
		controls_table.attach (*mute_button, 3, 4, 0, 1, Gtk::SHRINK, Gtk::SHRINK, 0, 0);
	}
	// mute button is always present, it is used to
	// force the 'blank' placeholders to the proper size
	controls_button_size_group->add_widget(*mute_button);

	if (!_route->is_master()) {
		if (ARDOUR::Profile->get_mixbus()) {
			controls_table.attach (*solo_button, 2, 3, 0, 1, Gtk::SHRINK, Gtk::SHRINK, 0, 0);
		} else {
			controls_table.attach (*solo_button, 4, 5, 0, 1, Gtk::SHRINK, Gtk::SHRINK, 0, 0);
		}
	} else {
		Gtk::Fixed *blank = manage(new Gtk::Fixed());
		controls_button_size_group->add_widget(*blank);
		if (ARDOUR::Profile->get_mixbus()) {
			controls_table.attach (*blank, 2, 3, 0, 1, Gtk::SHRINK, Gtk::SHRINK, 0, 0);
		} else {
			controls_table.attach (*blank, 4, 5, 0, 1, Gtk::SHRINK, Gtk::SHRINK, 0, 0);
		}
		blank->show();
	}

	if (ARDOUR::Profile->get_mixbus()) {
		controls_table.attach (route_group_button, 2, 3, 2, 3, Gtk::SHRINK, Gtk::SHRINK, 0, 0);
		controls_table.attach (gm.get_gain_slider(), 3, 5, 2, 3, Gtk::FILL|Gtk::EXPAND, Gtk::FILL|Gtk::EXPAND, 1, 0);
	} else {
		controls_table.attach (route_group_button, 4, 5, 2, 3, Gtk::SHRINK, Gtk::SHRINK, 0, 0);
		controls_table.attach (gm.get_gain_slider(), 0, 2, 2, 3, Gtk::FILL|Gtk::EXPAND, Gtk::FILL|Gtk::EXPAND, 1, 0);
	}
	gm.get_gain_slider().set_no_show_all ();
	gm.get_gain_slider().hide ();

	set_tooltip(*solo_button,_("Solo"));
	set_tooltip(*mute_button,_("Mute"));
	set_tooltip(route_group_button, _("Group"));

	mute_button->set_tweaks(ArdourButton::TrackHeader);
	solo_button->set_tweaks(ArdourButton::TrackHeader);
	rec_enable_button->set_tweaks(ArdourButton::TrackHeader);
	playlist_button.set_tweaks(ArdourButton::TrackHeader);
	automation_button.set_tweaks(ArdourButton::TrackHeader);
	elastic_audio_button.set_tweaks(ArdourButton::TrackHeader);
	playlist_lanes_button.set_tweaks(ArdourButton::TrackHeader);
	route_group_button.set_tweaks(ArdourButton::TrackHeader);

	if (is_midi_track()) {
		set_tooltip(automation_button, _("MIDI Controllers and Automation"));
	} else {
		set_tooltip(automation_button, _("Automation"));
	}
	set_tooltip (elastic_audio_button, _("Elastic Audio: click to choose a stretch mode. When enabled, double-click transient lines or the waveform to create stretch anchors, drag active anchors, Alt-click active anchors to remove them."));

	playlist_lanes_button.set_icon (ArdourIcon::TrackWaveform);
	set_tooltip (playlist_lanes_button, _("Playlists: show every other playlist of this track as an editable lane (Pro-Tools style)"));

	/* restore the elastic audio mode from the regions themselves: their
	 * mode is serialized in the session (region <ElasticAudio> nodes) and
	 * is the source of truth. The track GUI property is only a fallback
	 * for tracks that have no regions yet.
	 */
	ARDOUR::ElasticAudioMode elastic_mode = ARDOUR::ElasticAudioDisabled;
	{
		std::vector<std::shared_ptr<ARDOUR::AudioRegion> > regions = track_audio_regions ();
		for (std::vector<std::shared_ptr<ARDOUR::AudioRegion> >::const_iterator i = regions.begin (); i != regions.end (); ++i) {
			if ((*i)->elastic_audio_mode () != ARDOUR::ElasticAudioDisabled) {
				elastic_mode = (*i)->elastic_audio_mode ();
				break;
			}
		}
	}

	if (elastic_mode == ARDOUR::ElasticAudioDisabled) {
		int elastic_mode_int = 0;
		if (get_gui_property (X_("elastic-audio-mode"), elastic_mode_int)) {
			elastic_mode = (ARDOUR::ElasticAudioMode) elastic_mode_int;
		}
	}

	/* don't touch region state on load: regions carry their own mode */
	set_elastic_audio_mode (elastic_mode, false);

	update_track_number_visibility();
	route_active_changed();
	label_view ();

	if (ARDOUR::Profile->get_mixbus()) {
		controls_table.attach (automation_button, 1, 2, 2, 3, Gtk::SHRINK, Gtk::SHRINK);
	} else {
		controls_table.attach (automation_button, 3, 4, 2, 3, Gtk::SHRINK, Gtk::SHRINK);
	}

	if (is_track() && track()->mode() == ARDOUR::Normal) {
		if (ARDOUR::Profile->get_mixbus()) {
			controls_table.attach (playlist_button, 0, 1, 2, 3, Gtk::SHRINK, Gtk::SHRINK);
		} else {
			controls_table.attach (playlist_button, 2, 3, 2, 3, Gtk::SHRINK, Gtk::SHRINK);
		}
	}

	if (is_audio_track()) {
		if (ARDOUR::Profile->get_mixbus()) {
			controls_table.attach (elastic_audio_button, 0, 1, 1, 2, Gtk::SHRINK, Gtk::SHRINK);
			controls_table.attach (playlist_lanes_button, 1, 2, 1, 2, Gtk::SHRINK, Gtk::SHRINK);
		} else {
			controls_table.attach (elastic_audio_button, 2, 3, 1, 2, Gtk::SHRINK, Gtk::SHRINK);
			controls_table.attach (playlist_lanes_button, 3, 4, 1, 2, Gtk::SHRINK, Gtk::SHRINK);
		}
	}

	/* restore playlist-lanes view state from the session's gui state */
	if (is_audio_track ()) {
		uint32_t lh = 0;
		if (get_gui_property (X_("playlist-lane-height"), lh) && lh > 0) {
			_playlist_lane_height = lh;
		}
		bool show_lanes = false;
		if (get_gui_property (X_("show-playlist-lanes"), show_lanes) && show_lanes) {
			/* defer until first idle so the track view is fully built */
			_playlist_lanes_shown = true;
		}
	}

	_y_position = -1;

	_route->processors_changed.connect (*this, invalidator (*this), std::bind (&RouteTimeAxisView::processors_changed, this, _1), gui_context());

	if (is_track()) {

		LayerDisplay layer_display;
		if (get_gui_property ("layer-display", layer_display)) {
			set_layer_display (layer_display);
		}

		track()->FreezeChange.connect (*this, invalidator (*this), std::bind (&RouteTimeAxisView::map_frozen, this), gui_context());
		track()->SpeedChanged.connect (*this, invalidator (*this), std::bind (&RouteTimeAxisView::speed_changed, this), gui_context());

		track()->ChanCountChanged.connect (*this, invalidator (*this), std::bind (&RouteTimeAxisView::chan_count_changed, this), gui_context());

		/* pick up the correct freeze state */
		map_frozen ();

	}

	UIConfiguration::instance().ColorsChanged.connect (sigc::mem_fun (*this, &RouteTimeAxisView::color_handler));

	PropertyList* plist = new PropertyList();

	plist->add (ARDOUR::Properties::group_mute, true);
	plist->add (ARDOUR::Properties::group_solo, true);

	delete route_group_menu;
	route_group_menu = new RouteGroupMenu (_session, plist);

	gm.get_level_meter().signal_scroll_event().connect (sigc::mem_fun (*this, &RouteTimeAxisView::controls_ebox_scroll), false);
}

RouteTimeAxisView::~RouteTimeAxisView ()
{
	/* Cancel any pending idle rebuild before anything else — if the callback
	 * fires after 'this' is partially destroyed it will crash (0xC0000005).
	 */
	_playlist_lanes_idle_connection.disconnect ();
	destroy_playlist_lanes ();

	/* For a secondary view that shares another view's Route (a playlist lane),
	 * state_id() now resolves to RouteTimeAxisView::state_id() ("rtav <route>")
	 * because the derived part is already destroyed — that is the PARENT track's
	 * gui-object-state node. Skip it so we don't wipe the parent's state. The
	 * lane removes its own (correctly-keyed) node in its destructor.
	 */
	if (!_skip_route_state_cleanup) {
		cleanup_gui_properties ();
	}

	for (list<ProcessorAutomationInfo*>::iterator i = processor_automation.begin(); i != processor_automation.end(); ++i) {
		delete *i;
	}

	delete automation_action_menu;
	delete elastic_audio_menu;

	_automation_tracks.clear ();

	delete route_group_menu;
	CatchDeletion (this);
}

string
RouteTimeAxisView::name() const
{
	if (_route) {
		return _route->name();
	}
	return string();
}

void
RouteTimeAxisView::post_construct ()
{
	/* map current state of the route */

	update_diskstream_display ();
	setup_processor_menu_and_curves ();
	reset_processor_automation_curves ();

	/* restore Pro-Tools-style playlist lanes if they were shown when the
	 * session was saved (deferred to here so the track view is fully built).
	 */
	if (is_audio_track () && _playlist_lanes_shown && _playlist_lanes.empty ()) {
		_playlist_lanes_shown = false; /* let show_playlist_lanes() do the work */
		show_playlist_lanes (true);
	}
}

/** Set up the processor menu for the current set of processors, and
 *  display automation curves for any parameters which have data.
 */
void
RouteTimeAxisView::setup_processor_menu_and_curves ()
{
	_subplugin_menu_map.clear ();
	subplugin_menu.items().clear ();
	ctrl_item_map.clear ();
	_route->foreach_processor (sigc::mem_fun (*this, &RouteTimeAxisView::add_processor_to_subplugin_menu));
	_route->foreach_processor (sigc::mem_fun (*this, &RouteTimeAxisView::add_existing_processor_automation_curves));

	/* update controllable LUT */
	for (list<ProcessorAutomationInfo*>::iterator i = processor_automation.begin(); i != processor_automation.end(); ++i) {
		if (!(*i)->valid) {
			continue;
		}
		for (vector<ProcessorAutomationNode*>::iterator ii = (*i)->lines.begin(); ii != (*i)->lines.end(); ++ii) {
			std::shared_ptr<PBD::Controllable> c = std::dynamic_pointer_cast <PBD::Controllable>((*i)->processor->control((*ii)->what));
			ctrl_item_map[c] = (*ii)->menu_item;
		}
	}
}

bool
RouteTimeAxisView::route_group_click (GdkEventButton *ev)
{
	if (Keyboard::modifier_state_equals (ev->state, Keyboard::PrimaryModifier)) {
		if (_route->route_group()) {
			_route->route_group()->remove (_route);
		}
		return false;
	}

	WeakRouteList r;
	r.push_back (route ());

	route_group_menu->detach ();
	route_group_menu->build (r);
	if (ev->button == 1) {
		Gtkmm2ext::anchored_menu_popup(route_group_menu->menu(),
		                               &route_group_button,
		                               "", 1, ev->time);
	} else {
		route_group_menu->menu()->popup (ev->button, ev->time);
	}

	return true;
}

void
RouteTimeAxisView::playlist_changed ()
{
	label_view ();
}

void
RouteTimeAxisView::label_view ()
{
	string x = _route->name ();
	if (x != name_label.get_text ()) {
		name_label.set_text (x);
		ArdourWidgets::set_tooltip (name_label, string_compose (_("%1 (double click to edit)"), x));
	}

	inactive_label.set_text (string_compose("(%1)", x));
	inactive_label.show ();
	ArdourWidgets::set_tooltip (inactive_label, string_compose (_("%1 (Inactive, right click to activate)"), x));

	const int64_t track_number = _route->track_number ();
	if (track_number == 0) {
		number_label.set_text ("");
	} else {
		number_label.set_text (PBD::to_string (abs(_route->track_number ())));
	}
}

void
RouteTimeAxisView::update_track_number_visibility ()
{
	DisplaySuspender ds;
	bool show_label = _session->config.get_track_name_number();

	if (_route && _route->is_master()) {
		show_label = false;
	}

	if (number_label.get_parent()) {
		number_label.get_parent()->remove (number_label);
	}
	if (show_label) {
		if (!_route->active()) {
			inactive_table.attach (number_label, 0, 1, 0, 1, Gtk::SHRINK, Gtk::EXPAND|Gtk::FILL, 1, 0);
		} else if (ARDOUR::Profile->get_mixbus()) {
			controls_table.attach (number_label, 3, 4, 0, 1, Gtk::SHRINK, Gtk::EXPAND|Gtk::FILL, 1, 0);
		} else {
			controls_table.attach (number_label, 0, 1, 0, 1, Gtk::SHRINK, Gtk::EXPAND|Gtk::FILL, 1, 0);
		}
		// see ArdourButton::on_size_request(), we should probably use a global size-group here instead.
		// except the width of the number label is subtracted from the name-hbox, so we
		// need to explicitly calculate it anyway until the name-label & entry become ArdourWidgets.
		int tnw = (2 + std::max(2u, _session->track_number_decimals())) * number_label.char_pixel_width();
		if (tnw & 1) --tnw;
		number_label.set_size_request(tnw, -1);
		number_label.show ();
	} else {
		number_label.hide ();
	}
}

void
RouteTimeAxisView::route_active_changed ()
{
	RouteUI::route_active_changed ();
	update_track_number_visibility ();
	update_track_header_color ();
}

void
RouteTimeAxisView::parameter_changed (string const & p)
{
	if (p == "track-name-number") {
		update_track_number_visibility();
	} else if (p == "editor-stereo-only-meters") {
		if (UIConfiguration::instance().get_editor_stereo_only_meters()) {
			gm.get_level_meter().set_max_audio_meter_count (2);
		} else {
			gm.get_level_meter().set_max_audio_meter_count (0);
		}
	} else if (p == "use-route-color-widely") {
		route_color_changed ();
	}
}

void
RouteTimeAxisView::take_name_changed (void *src)
{
	if (src != this) {
		label_view ();
	}
}

bool
RouteTimeAxisView::playlist_click (GdkEventButton *ev)
{
	if (ev->button != 1) {
		return true;
	}

	build_playlist_menu ();
	conditionally_add_to_selection ();
	Gtkmm2ext::anchored_menu_popup(playlist_action_menu, &playlist_button,
	                               "", 1, ev->time);
	return true;
}

bool
RouteTimeAxisView::playlist_lanes_click (GdkEventButton* ev)
{
	if (ev->button != 1) {
		return true;
	}
	toggle_playlist_lanes ();
	return true;
}

void
RouteTimeAxisView::toggle_playlist_lanes ()
{
	show_playlist_lanes (!_playlist_lanes_shown);
}

void
RouteTimeAxisView::show_playlist_lanes (bool yn)
{
	if (!is_audio_track ()) {
		return;
	}

	_playlist_lanes_shown = yn;
	set_gui_property (X_("show-playlist-lanes"), yn);
	playlist_lanes_button.set_active_state (yn ? Gtkmm2ext::ExplicitActive : Gtkmm2ext::Off);

	if (yn) {
		rebuild_playlist_lanes ();
	} else {
		destroy_playlist_lanes ();
	}

	request_redraw ();
}

void
RouteTimeAxisView::destroy_playlist_lanes ()
{
	for (std::vector<std::shared_ptr<PlaylistLaneTimeAxisView> >::iterator i = _playlist_lanes.begin (); i != _playlist_lanes.end (); ++i) {
		(*i)->set_audition_active (false);
		(*i)->set_marked_for_display (false);
		(*i)->hide ();
		remove_child (*i);
	}
	_playlist_lanes.clear ();
}

void
RouteTimeAxisView::rebuild_playlist_lanes ()
{
	destroy_playlist_lanes ();

	if (!is_audio_track () || !_playlist_lanes_shown) {
		return;
	}

	std::shared_ptr<Track> tr = track ();
	if (!tr) {
		return;
	}

	std::shared_ptr<Playlist> active = tr->playlist ();

	std::vector<std::shared_ptr<Playlist> > pls = _session->playlists ()->playlists_for_track (tr);

	/* stable, predictable lane order */
	std::sort (pls.begin (), pls.end (),
	           [](std::shared_ptr<Playlist> a, std::shared_ptr<Playlist> b) {
	               return a->name () < b->name ();
	           });

	for (std::vector<std::shared_ptr<Playlist> >::const_iterator i = pls.begin (); i != pls.end (); ++i) {
		if (*i == active) {
			continue; /* the active playlist is the main row, not a lane */
		}
		std::shared_ptr<AudioPlaylist> apl = std::dynamic_pointer_cast<AudioPlaylist> (*i);
		if (!apl) {
			continue;
		}

		std::shared_ptr<PlaylistLaneTimeAxisView> lane (
			new PlaylistLaneTimeAxisView (_editor, _session, parent_canvas, *this, apl));
		lane->set_route (_route);
		lane->set_marked_for_display (true);
		lane->apply_shared_height (_playlist_lane_height);
		lane->AuditionToggled.connect (sigc::mem_fun (*this, &RouteTimeAxisView::lane_audition_toggled));
		lane->LaneResized.connect (sigc::mem_fun (*this, &RouteTimeAxisView::lane_resized));

		add_child (lane);
		_playlist_lanes.push_back (lane);
	}
}

void
RouteTimeAxisView::lane_audition_toggled (PlaylistLaneTimeAxisView* which, bool want)
{
	/* enforce "only one lane auditioned per track": the rest go off */
	for (std::vector<std::shared_ptr<PlaylistLaneTimeAxisView> >::iterator i = _playlist_lanes.begin (); i != _playlist_lanes.end (); ++i) {
		(*i)->set_audition_active ((i->get () == which) ? want : false);
	}
}

void
RouteTimeAxisView::lane_resized (uint32_t h)
{
	_playlist_lane_height = h;
	set_gui_property (X_("playlist-lane-height"), h);

	for (std::vector<std::shared_ptr<PlaylistLaneTimeAxisView> >::iterator i = _playlist_lanes.begin (); i != _playlist_lanes.end (); ++i) {
		(*i)->apply_shared_height (h);
	}
}

void
RouteTimeAxisView::playlists_maybe_changed ()
{
	if (!_playlist_lanes_shown || is_playlist_lane ()) {
		return;
	}
	if (_playlist_lanes_rebuild_queued) {
		return;
	}
	/* Defer to idle: this fires from inside playlist signal emission (incl.
	 * undo/redo). Destroying and recreating lane views synchronously here
	 * would mutate objects/connections mid-emission and can crash. By idle
	 * time the playlist set is settled.
	 */
	_playlist_lanes_rebuild_queued = true;
	/* store the connection so we can disconnect in the destructor — if the
	 * view is destroyed before the idle fires, the sigc::mem_fun would call
	 * into a dangling 'this' and crash with an access violation (0xC0000005).
	 */
	_playlist_lanes_idle_connection = Glib::signal_idle().connect (
	        sigc::mem_fun (*this, &RouteTimeAxisView::idle_rebuild_playlist_lanes));
}

bool
RouteTimeAxisView::idle_rebuild_playlist_lanes ()
{
	_playlist_lanes_rebuild_queued = false;
	if (_playlist_lanes_shown && !is_playlist_lane ()) {
		rebuild_playlist_lanes ();
		request_redraw ();
	}
	return false; /* one-shot */
}

bool
RouteTimeAxisView::automation_click (GdkEventButton *ev)
{
	if (ev->button != 1) {
		return true;
	}

	conditionally_add_to_selection ();
	build_automation_action_menu (false);
	Gtkmm2ext::anchored_menu_popup(automation_action_menu, &automation_button,
	                               "", 1, ev->time);
	return true;
}

void
RouteTimeAxisView::build_automation_action_menu (bool for_selection)
{
	using namespace Menu_Helpers;

	/* detach subplugin_menu from automation_action_menu before we delete automation_action_menu,
	   otherwise bad things happen (see comment for similar case in MidiTimeAxisView::build_automation_action_menu)
	*/

	detach_menu (subplugin_menu);

	_main_automation_menu_map.clear ();
	delete automation_action_menu;
	automation_action_menu = new Menu;

	MenuList& items = automation_action_menu->items();

	automation_action_menu->set_name ("ArdourContextMenu");

	items.push_back (MenuElem (_("Show All Automation"),
	                           sigc::bind (sigc::mem_fun (*this, &RouteTimeAxisView::show_all_automation), for_selection)));

	items.push_back (MenuElem (_("Show Existing Automation"),
	                           sigc::bind (sigc::mem_fun (*this, &RouteTimeAxisView::show_existing_automation), for_selection)));

	items.push_back (MenuElem (_("Hide All Automation"),
	                           sigc::bind (sigc::mem_fun (*this, &RouteTimeAxisView::hide_all_automation), for_selection)));

	/* Attach the plugin submenu. It may have previously been used elsewhere,
	   so it was detached above
	*/

	bool single_track_selected = (!for_selection || _editor.get_selection().tracks.size() == 1);

	if (!subplugin_menu.items().empty()) {
		items.push_back (SeparatorElem ());
		items.push_back (MenuElem (_("Processor automation"), subplugin_menu));
		items.back().set_sensitive (single_track_selected);
	}

	/* Add any route automation */

	if (gain_track) {
		items.push_back (CheckMenuElem (_("Fader"), sigc::mem_fun (*this, &RouteTimeAxisView::update_gain_track_visibility)));
		gain_automation_item = dynamic_cast<Gtk::CheckMenuItem*> (&items.back ());
		gain_automation_item->set_active (single_track_selected &&
		                                  string_to<bool>(gain_track->gui_property ("visible")));

		_main_automation_menu_map[Evoral::Parameter(GainAutomation)] = gain_automation_item;
	}

	if (trim_track) {
		items.push_back (CheckMenuElem (S_("Gain|Trim"), sigc::mem_fun (*this, &RouteTimeAxisView::update_trim_track_visibility)));
		trim_automation_item = dynamic_cast<Gtk::CheckMenuItem*> (&items.back ());
		trim_automation_item->set_active (single_track_selected &&
		                                  string_to<bool>(trim_track->gui_property ("visible")));

		_main_automation_menu_map[Evoral::Parameter(TrimAutomation)] = trim_automation_item;
	}

	if (mute_track) {
		items.push_back (CheckMenuElem (_("Mute"), sigc::mem_fun (*this, &RouteTimeAxisView::update_mute_track_visibility)));
		mute_automation_item = dynamic_cast<Gtk::CheckMenuItem*> (&items.back ());
		mute_automation_item->set_active (single_track_selected &&
		                                  string_to<bool>(mute_track->gui_property ("visible")));

		_main_automation_menu_map[Evoral::Parameter(MuteAutomation)] = mute_automation_item;
	}

	if (!pan_tracks.empty() && !ARDOUR::Profile->get_mixbus()) {
		items.push_back (CheckMenuElem (_("Pan"), sigc::mem_fun (*this, &RouteTimeAxisView::update_pan_track_visibility)));
		pan_automation_item = dynamic_cast<Gtk::CheckMenuItem*> (&items.back ());
		pan_automation_item->set_active (single_track_selected &&
		                                 string_to<bool>(pan_tracks.front()->gui_property ("visible")));

		set<Evoral::Parameter> const & params = _route->pannable()->what_can_be_automated ();
		for (set<Evoral::Parameter>::const_iterator p = params.begin(); p != params.end(); ++p) {
			_main_automation_menu_map[*p] = pan_automation_item;
		}
	}
}

void
RouteTimeAxisView::edit_scale ()
{
	if (!_route || !_route->key()) {
		return;
	}

	ScaleDialog sd;
	sd.set (*_route->key());

	sd.present ();

	int response = sd.run ();

	switch (response) {
		break;
	}
}

void
RouteTimeAxisView::build_display_menu ()
{
	using namespace Menu_Helpers;

	/* prepare it */

	if (automation_action_menu) {
		detach_menu (*automation_action_menu);
	}

	if (route_group_menu) {
		route_group_menu->detach ();
	}

	TimeAxisView::build_display_menu ();

	bool active = _route->active ();

	MenuList& items = display_menu->items();

	// Awaiting expanded/complete scale support
	// items.push_back (MenuElem (_("Scale..."), sigc::mem_fun (*this, &RouteTimeAxisView::edit_scale)));

	/* now fill it with our stuff */
	if (active) {
		items.push_back (MenuElem (_("Color..."), sigc::bind (sigc::mem_fun (*this, &RouteUI::choose_color), PublicEditor::instance ().current_toplevel())));

		items.push_back (MenuElem (_("Comments..."), sigc::mem_fun (*this, &RouteUI::open_comment_editor)));

		items.push_back (MenuElem (_("Inputs..."), sigc::mem_fun (*this, &RouteUI::edit_input_configuration)));

		items.push_back (MenuElem (_("Outputs..."), sigc::mem_fun (*this, &RouteUI::edit_output_configuration)));

		items.push_back (SeparatorElem());

		build_size_menu ();
		items.push_back (MenuElem (_("Height"), *_size_menu));
		items.push_back (SeparatorElem());

		/* Hook for derived classes to add type specific stuff */
		append_extra_display_menu_items ();
	}

	if (active && is_track()) {

		Menu* layers_menu = manage (new Menu);
		MenuList &layers_items = layers_menu->items();
		layers_menu->set_name("ArdourContextMenu");

		RadioMenuItem::Group layers_group;

		/* We're not connecting to signal_toggled() here; in the case where these two items are
		   set to be in the `inconsistent' state, it seems that one or other will end up active
		   as well as inconsistent (presumably due to the RadioMenuItem::Group).  Then when you
		   select the active one, no toggled signal is emitted so nothing happens.
		*/

		_ignore_set_layer_display = true;

		layers_items.push_back (RadioMenuElem (layers_group, _("Overlaid")));
		RadioMenuItem* i = dynamic_cast<RadioMenuItem*> (&layers_items.back ());
		i->set_active (layer_display() == Overlaid);
		i->signal_toggled().connect (sigc::bind (sigc::mem_fun (*this, &RouteTimeAxisView::layer_display_menu_change), i));
		overlaid_menu_item = i;

		layers_items.push_back (RadioMenuElem (layers_group, _("Stacked")));
		i = dynamic_cast<RadioMenuItem*> (&layers_items.back ());
		i->set_active (layer_display() == Stacked);
		i->signal_toggled().connect (sigc::bind (sigc::mem_fun (*this, &RouteTimeAxisView::layer_display_menu_change), i));
		stacked_menu_item = i;

		_ignore_set_layer_display = false;

		items.push_back (MenuElem (_("Layers"), *layers_menu));

		Menu* alignment_menu = manage (new Menu);
		MenuList& alignment_items = alignment_menu->items();
		alignment_menu->set_name ("ArdourContextMenu");

		RadioMenuItem::Group align_group;

		int existing = 0;
		int capture = 0;
		int automatic = 0;
		int styles = 0;
		std::shared_ptr<Track> first_track;
		TrackSelection const & s = _editor.get_selection().tracks;

		for (TrackSelection::const_iterator t = s.begin(); t != s.end(); ++t) {
			RouteTimeAxisView* r = dynamic_cast<RouteTimeAxisView*> (*t);
			if (!r || !r->is_track ()) {
				continue;
			}

			if (!first_track) {
				first_track = r->track();
			}

			switch (r->track()->alignment_choice()) {
			case Automatic:
				++automatic;
				styles |= 0x1;
				switch (r->track()->alignment_style()) {
				case ExistingMaterial:
					++existing;
					break;
				case CaptureTime:
					++capture;
					break;
				}
				break;
			case UseExistingMaterial:
				++existing;
				styles |= 0x2;
				break;
			case UseCaptureTime:
				++capture;
				styles |= 0x4;
				break;
			}
		}

		bool inconsistent;
		switch (styles) {
		case 1:
		case 2:
		case 4:
			inconsistent = false;
			break;
		default:
			inconsistent = true;
			break;
		}

		if (!inconsistent && first_track) {

			alignment_items.push_back (RadioMenuElem (align_group, _("Automatic (based on I/O connections)")));
			i = dynamic_cast<RadioMenuItem*> (&alignment_items.back());
			i->set_active (automatic != 0 && existing == 0 && capture == 0);
			i->signal_activate().connect (sigc::bind (sigc::mem_fun(*this, &RouteTimeAxisView::set_align_choice), i, Automatic, true));

			switch (first_track->alignment_choice()) {
			case Automatic:
				switch (first_track->alignment_style()) {
				case ExistingMaterial:
					alignment_items.push_back (MenuElem (_("(Currently: Existing Material)")));
					break;
				case CaptureTime:
					alignment_items.push_back (MenuElem (_("(Currently: Capture Time)")));
					break;
				}
				break;
			default:
				break;
			}

			alignment_items.push_back (RadioMenuElem (align_group, _("Align With Existing Material")));
			i = dynamic_cast<RadioMenuItem*> (&alignment_items.back());
			i->set_active (existing != 0 && capture == 0 && automatic == 0);
			i->signal_activate().connect (sigc::bind (sigc::mem_fun(*this, &RouteTimeAxisView::set_align_choice), i, UseExistingMaterial, true));

			alignment_items.push_back (RadioMenuElem (align_group, _("Align With Capture Time")));
			i = dynamic_cast<RadioMenuItem*> (&alignment_items.back());
			i->set_active (existing == 0 && capture != 0 && automatic == 0);
			i->signal_activate().connect (sigc::bind (sigc::mem_fun(*this, &RouteTimeAxisView::set_align_choice), i, UseCaptureTime, true));

			items.push_back (MenuElem (_("Alignment"), *alignment_menu));

		} else {
			/* show nothing */
			delete alignment_menu;
		}

		items.push_back (SeparatorElem());

		build_playlist_menu ();
		items.push_back (MenuElem (_("Playlist"), *playlist_action_menu));
		items.back().set_sensitive (_editor.get_selection().tracks.size() <= 1);
	}

	{
		std::shared_ptr<MidiTrack> mt (std::dynamic_pointer_cast<MidiTrack> (_route));
		if (mt) {
			items.push_back (CheckMenuElem (_("Chase MIDI notes")));
			Gtk::CheckMenuItem* c = dynamic_cast<Gtk::CheckMenuItem*> (&items.back());
			c->set_active (mt->chase_notes());
			c->signal_activate().connect ([mt]() { mt->set_chase_notes (!mt->chase_notes()); });
			items.push_back (SeparatorElem());
		}
	}

	if (!is_midi_track () && _route->the_instrument ()) {
		/* MIDI Bus */
		items.push_back (MenuElem (_("Patch Selector..."),
					sigc::mem_fun(*this, &RouteUI::select_midi_patch)));
		items.push_back (SeparatorElem());
	}


	if (active) {
		WeakRouteList r;
		for (TrackSelection::iterator i = _editor.get_selection().tracks.begin(); i != _editor.get_selection().tracks.end(); ++i) {
			RouteTimeAxisView* rtv = dynamic_cast<RouteTimeAxisView*> (*i);
			if (rtv) {
				r.push_back (rtv->route ());
			}
		}

		if (r.empty ()) {
			r.push_back (route ());
		}

		if (!_route->is_singleton ()) {
			route_group_menu->build (r);
			items.push_back (MenuElem (_("Group"), *route_group_menu->menu ()));
		}

		build_automation_action_menu (true);
		items.push_back (MenuElem (_("Automation"), *automation_action_menu));
		items.push_back (SeparatorElem());
	}


	int n_active = 0;
	int n_inactive = 0;
	bool always_active = false;
	TrackSelection const & s = _editor.get_selection().tracks;
	for (TrackSelection::const_iterator i = s.begin(); i != s.end(); ++i) {
		RouteTimeAxisView* r = dynamic_cast<RouteTimeAxisView*> (*i);
		if (!r) {
			continue;
		}
		always_active |= r->route()->is_singleton ();
#ifdef MIXBUS
		always_active |= r->route()->mixbus() != 0;
#endif
		if (r->route()->active()) {
			++n_active;
		} else {
			++n_inactive;
		}
	}

	Gtk::CheckMenuItem* i;

#if 0
	/* Can't have these options until we have audio-timed MIDI and elastic audio */
	Menu* time_domain_menu = manage (new Menu);
	MenuList& time_domain_items = time_domain_menu->items();
	time_domain_menu->set_name ("ArdourContextMenu");
	time_domain_items.push_back (CheckMenuElem (_("Audio (wallclock) time")));
	i = dynamic_cast<Gtk::CheckMenuItem *> (&time_domain_items.back());
	if (_route->has_own_time_domain() && _route->time_domain() == Temporal::AudioTime) {
		i->set_active (true);
	} else {
		i->set_active (false);
	}
	i->signal_activate().connect (sigc::bind (sigc::mem_fun (*this, &RouteUI::set_time_domain), Temporal::AudioTime, true));
	time_domain_items.push_back (CheckMenuElem (_("Musical (beat) time")));
	i = dynamic_cast<Gtk::CheckMenuItem *> (&time_domain_items.back());
	if (_route->has_own_time_domain() && _route->time_domain() == Temporal::BeatTime) {
		i->set_active (true);
	} else {
		i->set_active (false);
	}
	i->signal_activate().connect (sigc::bind (sigc::mem_fun (*this, &RouteUI::set_time_domain), Temporal::BeatTime, true));
	time_domain_items.push_back (CheckMenuElem (_("Follow Session time domain")));
	i = dynamic_cast<Gtk::CheckMenuItem *> (&time_domain_items.back());
	if (!_route->has_own_time_domain()) {
		i->set_active (true);
	} else {
		i->set_active (false);
	}
	i->signal_activate().connect (sigc::bind (sigc::mem_fun (*this, &RouteUI::clear_time_domain), true));
	items.push_back (MenuElem (_("Time Domain"), *time_domain_menu));
#endif

	items.push_back (CheckMenuElem (_("Active")));
	i = dynamic_cast<Gtk::CheckMenuItem *> (&items.back());
	bool click_sets_active = true;
	if (n_active > 0 && n_inactive == 0) {
		i->set_active (true);
		click_sets_active = false;
	} else if (n_active > 0 && n_inactive > 0) {
		i->set_inconsistent (true);
	}
	i->set_sensitive(! _session->transport_rolling() && ! always_active);
	i->signal_activate().connect (sigc::bind (sigc::mem_fun (*this, &RouteUI::set_route_active), click_sets_active, !_editor.get_selection().tracks.empty ()));

	items.push_back (SeparatorElem());
	items.push_back (MenuElem (_("Hide"), sigc::bind (sigc::mem_fun(_editor, &PublicEditor::hide_track_in_display), this, !_editor.get_selection().tracks.empty ())));

	if (!_route || _route->is_singleton ()) {
		return;
	}

	if (active) {
		items.push_back (SeparatorElem());
		items.push_back (MenuElem (_("Duplicate..."), std::bind (&ARDOUR_UI::start_duplicate_routes, ARDOUR_UI::instance())));
	}
	items.push_back (SeparatorElem());
	items.push_back (MenuElem (_("Remove"), sigc::mem_fun(_editor, &PublicEditor::remove_tracks)));
}

void
RouteTimeAxisView::layer_display_menu_change (Gtk::MenuItem* item)
{
	/* change only if the item is now active, since this will be called for
	   both buttons as one becomes active and the other inactive.
	*/

	if (dynamic_cast<RadioMenuItem*>(item)->get_active()) {
		if (item == stacked_menu_item) {
			set_layer_display (Stacked);
		} else {
			set_layer_display (Overlaid);
		}
	}
}

void
RouteTimeAxisView::show_timestretch (timepos_t const & start, timepos_t const & end, int layers, int layer)
{
	TimeAxisView::show_timestretch (start, end, layers, layer);

	hide_timestretch ();

#if 0
	if (ts.empty()) {
		return;
	}


	/* check that the time selection was made in our route, or our route group.
	   remember that route_group() == 0 implies the route is *not* in a edit group.
	*/

	if (!(ts.track == this || (ts.group != 0 && ts.group == _route->route_group()))) {
		/* this doesn't apply to us */
		return;
	}

	/* ignore it if our edit group is not active */

	if ((ts.track != this) && _route->route_group() && !_route->route_group()->is_active()) {
		return;
	}
#endif

	if (timestretch_rect == 0) {
		timestretch_rect = new ArdourCanvas::Rectangle (canvas_display ());
		timestretch_rect->set_fill_color (Gtkmm2ext::HSV (UIConfiguration::instance().color ("time stretch fill")).mod (UIConfiguration::instance().modifier ("time stretch fill")).color());
		timestretch_rect->set_outline_color (UIConfiguration::instance().color ("time stretch outline"));
	}

	timestretch_rect->show ();
	timestretch_rect->raise_to_top ();

	/* we use samples here since that is the canonical GUI<=>timeline
	 * mapping (samples/pixels). This is just a dragging rect, it doesn't
	 * by itself determine the parameters for the stretch.
	 */

	double const x1 = start.samples() / _editor.get_current_zoom();
	double const x2 = (end.samples() - 1) / _editor.get_current_zoom();

	timestretch_rect->set (ArdourCanvas::Rect (x1, current_height() * (layers - layer - 1) / layers,
						   x2, current_height() * (layers - layer) / layers));
}

void
RouteTimeAxisView::hide_timestretch ()
{
	TimeAxisView::hide_timestretch ();

	if (timestretch_rect) {
		timestretch_rect->hide ();
	}
}

/** @return all audio regions on all of this track's playlists */
std::vector<std::shared_ptr<ARDOUR::AudioRegion> >
RouteTimeAxisView::track_audio_regions () const
{
	std::vector<std::shared_ptr<ARDOUR::AudioRegion> > regions;

	std::shared_ptr<ARDOUR::Track> trk = track ();
	if (!trk || !_session) {
		return regions;
	}

	std::vector<std::shared_ptr<ARDOUR::Playlist> > pls = _session->playlists()->playlists_for_track (trk);

	for (std::vector<std::shared_ptr<ARDOUR::Playlist> >::const_iterator p = pls.begin (); p != pls.end (); ++p) {
		(*p)->foreach_region ([&regions] (std::shared_ptr<ARDOUR::Region> r) {
			std::shared_ptr<ARDOUR::AudioRegion> ar = std::dynamic_pointer_cast<ARDOUR::AudioRegion> (r);
			if (ar) {
				regions.push_back (ar);
			}
		});
	}

	return regions;
}

/** remove all elastic audio anchors from the track (all playlists), asking
 * for confirmation when warped audio would be reverted.
 * @param also_disable_mode when true, also set every region's mode to Disabled.
 * @return false if the user cancelled.
 */
bool
RouteTimeAxisView::remove_track_elastic_audio (bool also_disable_mode)
{
	using namespace ARDOUR;

	std::vector<std::shared_ptr<AudioRegion> > regions = track_audio_regions ();

	std::vector<std::shared_ptr<AudioRegion> > affected;
	bool any_warp = false;

	for (std::vector<std::shared_ptr<AudioRegion> >::const_iterator i = regions.begin (); i != regions.end (); ++i) {
		std::vector<AudioRegion::ElasticAudioAnchor> anchors;
		(*i)->get_elastic_audio_anchors (anchors);

		const bool has_mode = (*i)->elastic_audio_mode () != ElasticAudioDisabled;

		if ((*i)->elastic_audio_active ()) {
			any_warp = true;
		}

		if (!anchors.empty () || (also_disable_mode && has_mode)) {
			affected.push_back (*i);
		}
	}

	if (any_warp) {
		ArdourMessageDialog msg (_("This clip contains elastic audio modifications. Are you sure you want to remove them?"),
		                         false, Gtk::MESSAGE_QUESTION, Gtk::BUTTONS_OK_CANCEL, true);
		msg.set_title (_("Elastic Audio"));
		if (msg.run () != Gtk::RESPONSE_OK) {
			return false;
		}
	}

	if (affected.empty ()) {
		return true;
	}

	_editor.begin_reversible_command (_("remove elastic audio"));

	for (std::vector<std::shared_ptr<AudioRegion> >::const_iterator i = affected.begin (); i != affected.end (); ++i) {
		XMLNode& before = (*i)->get_state ();
		(*i)->clear_elastic_audio_anchors ();
		if (also_disable_mode) {
			(*i)->set_elastic_audio_mode (ElasticAudioDisabled);
		}
		XMLNode& after = (*i)->get_state ();
		_session->add_command (new MementoCommand<AudioRegion> (*(*i).get (), &before, &after));
	}

	_editor.commit_reversible_command ();
	_session->set_dirty ();

	return true;
}

void
RouteTimeAxisView::set_elastic_audio_mode (ARDOUR::ElasticAudioMode mode, bool apply_to_regions)
{
	const bool was_editing = elastic_audio_editing ();

	if (apply_to_regions && mode == ARDOUR::ElasticAudioDisabled && is_audio_track ()) {
		/* disabling removes all anchors (after confirmation) */
		if (!remove_track_elastic_audio (true)) {
			return; /* user cancelled; keep current mode */
		}
	}

	_elastic_audio_mode = mode;
	set_gui_property (X_("elastic-audio-mode"), (int) mode);

	elastic_audio_button.set_active_state (mode != ARDOUR::ElasticAudioDisabled ? Gtkmm2ext::ExplicitActive : Gtkmm2ext::Off);

	switch (mode) {
	case ARDOUR::ElasticAudioVarispeed:
		elastic_audio_button.set_text (S_("ElasticVarispeed|V"));
		break;
	case ARDOUR::ElasticAudioPolyphonic:
		elastic_audio_button.set_text (S_("ElasticPolyphonic|P"));
		break;
	default:
		elastic_audio_button.set_text (S_("Elastic|E"));
		break;
	}

	if (apply_to_regions && mode != ARDOUR::ElasticAudioDisabled) {
		std::vector<std::shared_ptr<ARDOUR::AudioRegion> > regions = track_audio_regions ();
		for (std::vector<std::shared_ptr<ARDOUR::AudioRegion> >::const_iterator i = regions.begin (); i != regions.end (); ++i) {
			(*i)->set_elastic_audio_mode (mode);
		}
	}

	if (!_view) {
		return;
	}

	if (mode != ARDOUR::ElasticAudioDisabled) {
		/* always (re)run transient detection on enable; regions whose
		 * analysis is already cached (or restored from the session
		 * file) skip the actual analysis pass.
		 */
		_view->foreach_regionview (sigc::bind (sigc::ptr_fun (&refresh_elastic_audio_region_view), true));
	} else if (was_editing) {
		_view->foreach_regionview (sigc::bind (sigc::ptr_fun (&refresh_elastic_audio_region_view), false));
	}
}

void
RouteTimeAxisView::elastic_audio_mode_menu_toggled (Gtk::RadioMenuItem* item, ARDOUR::ElasticAudioMode mode)
{
	if (item->get_active () && _elastic_audio_mode != mode) {
		set_elastic_audio_mode (mode);
	}
}

void
RouteTimeAxisView::clear_elastic_audio_anchors ()
{
	if (!remove_track_elastic_audio (false)) {
		return;
	}

	if (_view) {
		_view->foreach_regionview (sigc::bind (sigc::ptr_fun (&refresh_elastic_audio_region_view), elastic_audio_editing ()));
	}
}

void
RouteTimeAxisView::build_elastic_audio_menu ()
{
	using namespace Gtk::Menu_Helpers;

	delete elastic_audio_menu;
	elastic_audio_menu = new Gtk::Menu;
	elastic_audio_menu->set_name ("ArdourContextMenu");

	MenuList& items = elastic_audio_menu->items ();

	Gtk::RadioMenuItem::Group mode_group;

	struct {
		const char* label;
		ARDOUR::ElasticAudioMode mode;
	} const modes[] = {
		{ _("Disabled"),   ARDOUR::ElasticAudioDisabled   },
		{ _("Varispeed"),  ARDOUR::ElasticAudioVarispeed  },
		{ _("Polyphonic"), ARDOUR::ElasticAudioPolyphonic },
	};

	for (size_t n = 0; n < sizeof (modes) / sizeof (modes[0]); ++n) {
		items.push_back (RadioMenuElem (mode_group, modes[n].label));
		Gtk::RadioMenuItem* item = static_cast<Gtk::RadioMenuItem*> (&items.back ());
		if (_elastic_audio_mode == modes[n].mode) {
			item->set_active (true);
		}
		item->signal_toggled ().connect (sigc::bind (sigc::mem_fun (*this, &RouteTimeAxisView::elastic_audio_mode_menu_toggled), item, modes[n].mode));
	}

	items.push_back (SeparatorElem ());
	items.push_back (MenuElem (_("Clear Stretch Anchors"), sigc::mem_fun (*this, &RouteTimeAxisView::clear_elastic_audio_anchors)));
}

bool
RouteTimeAxisView::elastic_audio_edit_button_press (GdkEventButton* ev)
{
	if (ev->button != 1 || ev->type != GDK_BUTTON_PRESS || !is_audio_track ()) {
		return false;
	}

	build_elastic_audio_menu ();
	elastic_audio_menu->popup (ev->button, ev->time);
	return true;
}

void
RouteTimeAxisView::show_selection (TimeSelection& ts)
{

#if 0
	/* ignore it if our edit group is not active or if the selection was started
	   in some other track or route group (remember that route_group() == 0 means
	   that the track is not in an route group).
	*/

	if (((ts.track != this && !is_child (ts.track)) && _route->route_group() && !_route->route_group()->is_active()) ||
	    (!(ts.track == this || is_child (ts.track) || (ts.group != 0 && ts.group == _route->route_group())))) {
		hide_selection ();
		return;
	}
#endif

	TimeAxisView::show_selection (ts);
}

void
RouteTimeAxisView::set_height (uint32_t h, TrackHeightMode m, bool from_idle)
{
	int gmlen = h - 9;
	bool height_changed = (height == 0) || (h != height);

	int meter_width = 3;
	if (_route && _route->shared_peak_meter()->input_streams().n_total() == 1) {
		meter_width = 6;
	}
	gm.get_level_meter().setup_meters (gmlen, meter_width);

	TimeAxisView::set_height (h, m, from_idle);

	if (_view) {
		_view->set_height ((double) current_height());
	}

	if (height >= preset_height (HeightNormal)) {

		reset_meter();

		gm.get_gain_slider().hide();
		mute_button->show();
		if (!_route || _route->is_monitor()) {
			solo_button->hide();
		} else {
			solo_button->show();
		}
		if (rec_enable_button)
			rec_enable_button->show();

		route_group_button.show();
		automation_button.show();

		if (is_track() && track()->mode() == ARDOUR::Normal) {
			playlist_button.show();
		}
		if (is_audio_track()) {
			elastic_audio_button.show ();
			playlist_lanes_button.show ();
		}

	} else {

		reset_meter();

		gm.get_gain_slider().hide();
		mute_button->show();
		if (!_route || _route->is_monitor()) {
			solo_button->hide();
		} else {
			solo_button->show();
		}
		if (rec_enable_button)
			rec_enable_button->show();

		route_group_button.hide ();
		automation_button.hide ();

		if (is_track() && track()->mode() == ARDOUR::Normal) {
			playlist_button.hide ();
		}
		elastic_audio_button.hide ();
		playlist_lanes_button.hide ();

	}

	if (height_changed && !no_redraw) {
		/* only emit the signal if the height really changed */
		request_redraw ();
	}
}

void
RouteTimeAxisView::route_color_changed ()
{
	using namespace ARDOUR_UI_UTILS;
	if (_view) {
		_view->apply_color (color(), StreamView::RegionColor);
	}
	number_label.set_fixed_colors (gdk_color_to_rgba (color()), gdk_color_to_rgba (color()));

	if (!is_master() && UIConfiguration::instance().get_use_route_color_widely()) {
		gm.set_fader_fg (gdk_color_to_rgba (route_color_tint ()));
	} else {
		gm.unset_fader_fg ();
	}

	update_track_header_color ();
}

void
RouteTimeAxisView::selection_display_changed ()
{
	update_track_header_color ();
}

void
RouteTimeAxisView::update_track_header_color ()
{
	if (!_route) {
		return;
	}

	Gdk::Color route_color = color ();
	Gdk::Color base_color;
	bool failed = false;

	if (is_midi_track()) {
		Gtkmm2ext::set_color_from_rgba (base_color, UIConfiguration::instance().color (X_("gtk_midi_track"), &failed));
	} else if (is_audio_track()) {
		Gtkmm2ext::set_color_from_rgba (base_color, UIConfiguration::instance().color (X_("gtk_audio_track"), &failed));
	} else {
		Gtkmm2ext::set_color_from_rgba (base_color, UIConfiguration::instance().color (X_("gtk_audio_bus"), &failed));
	}

	if (failed) {
		Glib::RefPtr<Gtk::Style> style = controls_ebox.get_style ();
		base_color = style ? style->get_bg (Gtk::STATE_NORMAL) : route_color;
	}

	double tint_amount;
	if (selected ()) {
		tint_amount = _route->active () ? 0.48 : 0.28;
	} else {
		tint_amount = _route->active () ? 0.22 : 0.12;
	}

	Gdk::Color header_tint = mix_gdk_color (base_color, route_color, tint_amount);
	Gdk::Color label_fg;
	label_fg.set_rgb_p (.93, .93, .93);

	modify_bg_all_states (route_color_side_bar, route_color);
	modify_bg_all_states (controls_ebox, header_tint);
	modify_bg_all_states (time_axis_frame, header_tint);
	modify_bg_all_states (time_axis_hbox, header_tint);
	modify_bg_all_states (time_axis_vbox, header_tint);
	modify_bg_all_states (top_hbox, header_tint);
	modify_bg_all_states (controls_vbox, header_tint);
	modify_bg_all_states (controls_table, header_tint);
	modify_bg_all_states (inactive_table, header_tint);
	modify_fg_all_states (name_label, label_fg);
	modify_fg_all_states (inactive_label, label_fg);

	route_color_side_bar.queue_draw ();
	controls_ebox.queue_draw ();
	time_axis_frame.queue_draw ();
	time_axis_hbox.queue_draw ();
	time_axis_vbox.queue_draw ();
	top_hbox.queue_draw ();
	controls_vbox.queue_draw ();
	controls_table.queue_draw ();
	inactive_table.queue_draw ();
}

void
RouteTimeAxisView::set_samples_per_pixel (double fpp)
{
	if (_view) {
		_view->set_samples_per_pixel (fpp);
	}

	StripableTimeAxisView::set_samples_per_pixel (fpp);
}

void
RouteTimeAxisView::set_align_choice (RadioMenuItem* mitem, AlignChoice choice, bool apply_to_selection)
{
	if (!mitem->get_active()) {
		/* this is one of the two calls made when these radio menu items change status. this one
			 is for the item that became inactive, and we want to ignore it.
			 */
		return;
	}

	if (apply_to_selection) {
		_editor.get_selection().tracks.foreach_route_time_axis (std::bind (&RouteTimeAxisView::set_align_choice, _1, mitem, choice, false));
	} else {
		if (track ()) {
			track()->set_align_choice (choice);
		}
	}
}

void
RouteTimeAxisView::speed_changed ()
{
	Gtkmm2ext::UI::instance()->call_slot (invalidator (*this), std::bind (&RouteTimeAxisView::reset_samples_per_pixel, this));
}

void
RouteTimeAxisView::update_diskstream_display ()
{
	if (!track()) {
		return;
	}

	map_frozen ();
}

void
RouteTimeAxisView::selection_click (GdkEventButton* ev)
{
	if (Keyboard::modifier_state_equals (ev->state, (Keyboard::TertiaryModifier|Keyboard::PrimaryModifier))) {

		/* special case: select/deselect all tracks */

		_editor.begin_reversible_selection_op (X_("Selection Click"));

		if (_editor.get_selection().selected (this)) {
			_editor.get_selection().clear_tracks ();
		} else {
			_editor.select_all_visible_lanes ();
		}

		_editor.commit_reversible_selection_op ();

		return;
	}

	switch (ArdourKeyboard::selection_type (ev->state)) {
	case SelectionToggle:
		_editor.begin_reversible_selection_op (X_("Selection toggle"));
		_editor.get_selection().toggle (this);
		break;

	case SelectionSet:
		_editor.begin_reversible_selection_op (X_("Selection set"));
		_editor.get_selection().set (this);
		break;

	case SelectionExtend:
		_editor.begin_reversible_selection_op (X_("Selection extend"));
		_editor.extend_selection_to_track (*this);
		break;

	case SelectionAdd:
		_editor.begin_reversible_selection_op (X_("Selection add"));
		_editor.get_selection().add (this);
		break;

	default:
		/* remove not done here */
		break;
	}

	_editor.commit_reversible_selection_op ();

	_editor.set_selected_mixer_strip (*this);
}

void
RouteTimeAxisView::set_selected_points (PointSelection& points)
{
	StripableTimeAxisView::set_selected_points (points);
	AudioStreamView* asv = dynamic_cast<AudioStreamView*>(_view);
	if (asv) {
		asv->set_selected_points (points);
	}
}

void
RouteTimeAxisView::set_selected_regionviews (RegionSelection& regions)
{
	if (_view) {
		_view->set_selected_regionviews (regions);
	}

	for (auto & child : children) {
		child->set_selected_regionviews (regions);
	}
}

/** Add the selectable things that we have to a list.
 * @param results List to add things to.
 */
void
RouteTimeAxisView::_get_selectables (timepos_t const & start, timepos_t const & end, double top, double bot, list<Selectable*>& results, bool within)
{
	if ((_view && ((top < 0.0 && bot < 0.0))) || touched (top, bot)) {
		_view->get_selectables (start, end, top, bot, results, within);
	}

	/* pick up visible automation tracks */
	for (Children::iterator i = children.begin(); i != children.end(); ++i) {
		if (!(*i)->hidden()) {
			(*i)->get_selectables (start, end, top, bot, results, within);
		}
	}
}

void
RouteTimeAxisView::get_inverted_selectables (Selection& sel, list<Selectable*>& results)
{
	if (_view) {
		_view->get_inverted_selectables (sel, results);
	}
	StripableTimeAxisView::get_inverted_selectables (sel, results);
}

void
RouteTimeAxisView::get_regionviews_at_or_after (timepos_t const & pos, RegionSelection& regions)
{
	if (!_view) {
		return;
	}

	_view->get_regionviews_at_or_after (pos, regions);
}

std::shared_ptr<RouteGroup>
RouteTimeAxisView::route_group () const
{
	return _route->route_group();
}

std::shared_ptr<Playlist>
RouteTimeAxisView::playlist () const
{
	std::shared_ptr<Track> tr;

	if ((tr = track()) != 0) {
		return tr->playlist();
	} else {
		return std::shared_ptr<Playlist> ();
	}
}

bool
RouteTimeAxisView::name_entry_changed (string const& str)
{
	if (str == _route->name()) {
		return true;
	}

	string x = str;

	strip_whitespace_edges (x);

	if (x.empty()) {
		return false;
	}

	if (_session->route_name_internal (x)) {
		ARDOUR_UI::instance()->popup_error (string_compose (_("The name \"%1\" is reserved for %2"), x, PROGRAM_NAME));
		return false;
	} else if (RouteUI::verify_new_route_name (x)) {
		_route->set_name (x);
		return true;
	}

	return false;
}

std::shared_ptr<Region>
RouteTimeAxisView::find_next_region (timepos_t const & pos, RegionPoint point, int32_t dir)
{
	std::shared_ptr<Playlist> pl = playlist ();

	if (pl) {
		return pl->find_next_region (pos, point, dir);
	}

	return std::shared_ptr<Region> ();
}

timepos_t
RouteTimeAxisView::find_next_region_boundary (timepos_t const & pos, int32_t dir)
{
	std::shared_ptr<Playlist> pl = playlist ();

	if (pl) {
		return pl->find_next_region_boundary (pos, dir);
	}

	return timepos_t::max (pos.time_domain());
}

void
RouteTimeAxisView::fade_range (TimeSelection& selection)
{
	std::shared_ptr<Track> tr = track ();
	std::shared_ptr<Playlist> playlist;

	if (tr == 0) {
		/* route is a bus, not a track */
		return;
	}

	playlist = tr->playlist();

	TimeSelection time (selection);

	playlist->clear_changes ();
	playlist->clear_owned_changes ();

	playlist->fade_range (time);

	playlist->rdiff_and_add_command (_session);
}

void
RouteTimeAxisView::cut_copy_clear (Selection& selection, CutCopyOp op)
{
	std::shared_ptr<Playlist> what_we_got;
	std::shared_ptr<Track> tr = track ();
	std::shared_ptr<Playlist> playlist;

	if (tr == 0) {
		/* route is a bus, not a track */
		return;
	}

	playlist = tr->playlist();

	TimeSelection time (selection.time);

	playlist->clear_changes ();
	playlist->clear_owned_changes ();

	switch (op) {
	case Delete:
		if (playlist->cut (time) != 0) {
			if (_editor.should_ripple()) {
				playlist->ripple (time.start_time(), -time.length(), NULL);
			}
			playlist->rdiff_and_add_command (_session);
		}
		break;

	case Cut:
		if ((what_we_got = playlist->cut (time)) != 0) {
			_editor.get_cut_buffer().add (what_we_got);
			if (_editor.should_ripple()) {
				playlist->ripple (time.start_time(), -time.length(), NULL);
			}
			playlist->rdiff_and_add_command (_session);
		}
		break;
	case Copy:
		if ((what_we_got = playlist->copy (time)) != 0) {
			_editor.get_cut_buffer().add (what_we_got);
		}
		break;

	case Clear:
		if ((what_we_got = playlist->cut (time)) != 0) {
			if (_editor.should_ripple()) {
				playlist->ripple (time.start_time(), -time.length(), NULL);
			}
			playlist->rdiff_and_add_command (_session);
		}
		break;
	}
}

bool
RouteTimeAxisView::paste (timepos_t const & pos, const Selection& selection, PasteContext& ctx)
{
	if (!is_track()) {
		return false;
	}

	std::shared_ptr<Playlist>       pl   = playlist ();
	const ARDOUR::DataType            type = pl->data_type();
	PlaylistSelection::const_iterator p    = selection.playlists.get_nth(type, ctx.counts.n_playlists(type));

	if (p == selection.playlists.end()) {
		return false;
	}
	ctx.counts.increase_n_playlists(type);

	DEBUG_TRACE (DEBUG::CutNPaste, string_compose ("paste to %1\n", pos));

	/* add multi-paste offset if applicable */
	std::pair<timepos_t, timepos_t> extent  = (*p)->get_extent();
	const timecnt_t                 duration = extent.first.distance (extent.second);

	timepos_t ppos = pos;
	ppos += _editor.get_paste_offset (ppos, ctx.count, duration);

	pl->clear_changes ();
	pl->clear_owned_changes ();
	if (_editor.should_ripple()) {
		std::pair<timepos_t, timepos_t> extent = (*p)->get_extent_with_endspace();
		timecnt_t amount = extent.first.distance (extent.second);
		pl->ripple (ppos, amount.scale (ctx.times), std::shared_ptr<Region>());
	}
	pl->paste (*p, ppos, ctx.times);

	vector<Command*> cmds;
	pl->rdiff (cmds);
	_session->add_commands (cmds);

	_session->add_command (new StatefulDiffCommand (pl));

	return true;
}

void
RouteTimeAxisView::update_playlist_tip ()
{
	std::shared_ptr<RouteGroup> rg = route_group ();
	if (rg && rg->is_active() && rg->enabled_property (ARDOUR::Properties::group_select.property_id)) {
		string group_string = "." + rg->name() + ".";

		string take_name = track()->playlist()->name();
		string::size_type idx = take_name.find(group_string);

		if (idx != string::npos) {
			/* find the bit containing the take number / name */
			take_name = take_name.substr (idx + group_string.length());

			/* set the playlist button tooltip to the take name */
			set_tooltip (
				playlist_button,
				string_compose(_("Take: %1.%2"),
					Gtkmm2ext::markup_escape_text (rg->name()),
					Gtkmm2ext::markup_escape_text (take_name))
				);

			return;
		}
	}

	/* set the playlist button tooltip to the playlist name */
	set_tooltip (playlist_button, _("Playlist") + std::string(": ") + Gtkmm2ext::markup_escape_text (track()->playlist()->name()));
}

void
RouteTimeAxisView::map_frozen ()
{
	if (!is_track()) {
		return;
	}

	ENSURE_GUI_THREAD (*this, &RouteTimeAxisView::map_frozen)

	switch (track()->freeze_state()) {
	case Track::Frozen:
		playlist_button.set_sensitive (false);
		break;
	default:
		playlist_button.set_sensitive (true);
		break;
	}
	RouteUI::map_frozen ();
}

void
RouteTimeAxisView::color_handler ()
{
	//case cTimeStretchOutline:
	if (timestretch_rect) {
		timestretch_rect->set_outline_color (UIConfiguration::instance().color ("time stretch outline"));
	}
	//case cTimeStretchFill:
	if (timestretch_rect) {
		timestretch_rect->set_fill_color (UIConfiguration::instance().color ("time stretch fill"));
	}

	update_track_header_color ();
	reset_meter();
}

/** Toggle an automation track for a fully-specified Parameter (type,channel,id)
 *  Will add track if necessary.
 */
void
RouteTimeAxisView::toggle_automation_track (const Evoral::Parameter& param)
{
	assert (param.type() != PluginAutomation);

	std::shared_ptr<AutomationTimeAxisView> track = automation_child (param);
	Gtk::CheckMenuItem* menu = automation_child_menu_item (param);

	if (!track) {
		/* it doesn't exist yet, so we don't care about the button state: just add it */
		create_automation_child (param, true);
	} else {
		assert (menu);
		bool yn = menu->get_active();
		bool changed = false;

		if ((changed = track->set_marked_for_display (menu->get_active())) && yn) {

			/* we made it visible, now trigger a redisplay. if it was hidden, then automation_track_hidden()
			   will have done that for us.
			*/

			if (changed && !no_redraw) {
				request_redraw ();
			}
		}
	}
}

void
RouteTimeAxisView::update_pan_track_visibility ()
{
	bool const showit = pan_automation_item->get_active();
	bool changed = false;

	for (list<std::shared_ptr<AutomationTimeAxisView> >::iterator i = pan_tracks.begin(); i != pan_tracks.end(); ++i) {
		if ((*i)->set_marked_for_display (showit)) {
			changed = true;
		}
	}

	if (changed) {
		_route->gui_changed (X_("visible_tracks"), (void *) 0); /* EMIT_SIGNAL */
	}
}

void
RouteTimeAxisView::ensure_pan_views (bool show)
{
	bool changed = false;
	for (list<std::shared_ptr<AutomationTimeAxisView> >::iterator i = pan_tracks.begin(); i != pan_tracks.end(); ++i) {
		changed = true;
		(*i)->set_marked_for_display (false);
	}
	if (changed) {
		_route->gui_changed (X_("visible_tracks"), (void *) 0); /* EMIT_SIGNAL */
	}
	pan_tracks.clear();

	if (!_route->panner()) {
		return;
	}

	set<Evoral::Parameter> params = _route->pannable()->what_can_be_automated();
	set<Evoral::Parameter>::iterator p;

	for (p = params.begin(); p != params.end(); ++p) {
		std::shared_ptr<ARDOUR::AutomationControl> pan_control = _route->pannable()->automation_control(*p);

		if (pan_control->parameter().type() == NullAutomation) {
			error << "Pan control has NULL automation type!" << endmsg;
			continue;
		}

		if (automation_child (pan_control->parameter ()).get () == 0) {

			/* we don't already have an AutomationTimeAxisView for this parameter */

			std::string const name = _route->pannable()->describe_parameter (pan_control->parameter ());

			std::shared_ptr<AutomationTimeAxisView> t (
					new AutomationTimeAxisView (_session,
						_route,
						_route->pannable(),
						pan_control,
						pan_control->parameter (),
						_editor,
						*this,
						false,
						parent_canvas,
						name)
					);

			pan_tracks.push_back (t);
			add_automation_child (*p, t, show);
		} else {
			pan_tracks.push_back (automation_child (pan_control->parameter ()));
		}
	}

	/* remove ATAV of no longer relevant pan ctrls (e.g. width, height); */
	bool removed_one;
	do {
		removed_one = false;
		for (auto const& j : children) {
			std::shared_ptr<AutomationTimeAxisView> atv = std::dynamic_pointer_cast<AutomationTimeAxisView> (j);
			if (!atv || !std::dynamic_pointer_cast<PanControllable> (atv->control ())) {
				continue;
			}
			if (std::find (pan_tracks.begin (), pan_tracks.end(), atv) != pan_tracks.end ()) {
				continue;
			}
			/* this invalidates the iterator */
			remove_child (atv);
			removed_one = true;
			break;
		}
	} while (removed_one);
}


void
RouteTimeAxisView::show_all_automation (bool apply_to_selection)
{
	if (apply_to_selection) {
		_editor.get_selection().tracks.foreach_route_time_axis (std::bind (&RouteTimeAxisView::show_all_automation, _1, false));
	} else {
		no_redraw = true;

		StripableTimeAxisView::show_all_automation ();

		/* Show processor automation */

		for (list<ProcessorAutomationInfo*>::iterator i = processor_automation.begin(); i != processor_automation.end(); ++i) {
			for (vector<ProcessorAutomationNode*>::iterator ii = (*i)->lines.begin(); ii != (*i)->lines.end(); ++ii) {
				if ((*ii)->view == 0) {
					add_processor_automation_curve ((*i)->processor, (*ii)->what);
				}

				(*ii)->menu_item->set_active (true);
			}
		}

		no_redraw = false;

		/* Redraw */

		request_redraw ();
	}
}

void
RouteTimeAxisView::show_existing_automation (bool apply_to_selection)
{
	if (apply_to_selection) {
		_editor.get_selection().tracks.foreach_route_time_axis (std::bind (&RouteTimeAxisView::show_existing_automation, _1, false));
	} else {
		no_redraw = true;

		StripableTimeAxisView::show_existing_automation ();

		/* Show processor automation */
		for (list<ProcessorAutomationInfo*>::iterator i = processor_automation.begin(); i != processor_automation.end(); ++i) {
			for (vector<ProcessorAutomationNode*>::iterator ii = (*i)->lines.begin(); ii != (*i)->lines.end(); ++ii) {
				if ((*i)->processor->control((*ii)->what)->list()->size() > 0) {
					(*ii)->menu_item->set_active (true);
				}
			}
		}

		no_redraw = false;
		request_redraw ();
	}
}

void
RouteTimeAxisView::maybe_hide_automation (bool hide, WeakAutomationControlList wctrls)
{
	ctrl_autohide_connection.disconnect ();
	if (!hide) {
		/* disconnect only, leave lane visible */
		return;
	}

	for (auto const& wctrl: wctrls) {
		std::shared_ptr<AutomationControl> ac = std::dynamic_pointer_cast<AutomationControl> (wctrl.lock ());
		if (!ac) {
			continue;
		}

		Gtk::CheckMenuItem* cmi = find_menu_item_by_ctrl (ac);
		if (cmi) {
			cmi->set_active (false);
			continue;
		}

		std::shared_ptr<AutomationTimeAxisView> atav = find_atav_by_ctrl (ac);
		if (atav) {
			atav->set_marked_for_display (false);
			request_redraw ();
		}
	}
}

void
RouteTimeAxisView::show_touched_automation (std::weak_ptr<PBD::Controllable> wctrl)
{
	std::shared_ptr<AutomationControl> ac = std::dynamic_pointer_cast<AutomationControl> (wctrl.lock ());
	if (!ac) {
		return;
	}

	if (!_editor.show_touched_automation ()) {
		if (ctrl_autohide_connection.connected ()) {
			signal_ctrl_touched (true); /* EMIT SIGNAL */
		}
		return;
	}

	std::shared_ptr<AutomationTimeAxisView> atav;
	Gtk::CheckMenuItem* cmi = find_menu_item_by_ctrl (ac);
	if (!cmi) {
		atav = find_atav_by_ctrl (ac);
		if (!atav) {
			return;
		}
	}

	/* hide any lanes */
	signal_ctrl_touched (true); /* EMIT SIGNAL */

	WeakAutomationControlList wctrls;

	if (cmi && !cmi->get_active ()) {
		cmi->set_active (true);
		wctrls.push_back (ac);
		/* search ctrl to scroll to */
		atav = find_atav_by_ctrl (ac, false);
	} else if (atav && ! string_to<bool>(atav->gui_property ("visible"))) {
		atav->set_marked_for_display (true);
		wctrls.push_back (ac);
		request_redraw ();
	}

	for (auto const& i: ac->visually_linked_controls ()) {
		std::shared_ptr<AutomationControl> wac = i.lock ();
		if (!wac) {
			continue;
		}
		cmi = find_menu_item_by_ctrl (wac);
		if (cmi && !cmi->get_active ()) {
			cmi->set_active (true);
			wctrls.push_back (wac);
			continue;
		}
		std::shared_ptr<AutomationTimeAxisView> datav = find_atav_by_ctrl (wac, false);
		if (datav && ! string_to<bool>(datav->gui_property ("visible"))) {
			datav->set_marked_for_display (true);
			wctrls.push_back (wac);
			request_redraw ();
		}
	}

	if (!wctrls.empty ()) {
		ctrl_autohide_connection = signal_ctrl_touched.connect (sigc::bind (sigc::mem_fun (*this, &RouteTimeAxisView::maybe_hide_automation), wctrls));
	}

	if (atav) {
		_editor.ensure_time_axis_view_is_visible (*atav, false);
	}
}

void
RouteTimeAxisView::hide_all_automation (bool apply_to_selection)
{
	if (apply_to_selection) {
		_editor.get_selection().tracks.foreach_route_time_axis (std::bind (&RouteTimeAxisView::hide_all_automation, _1, false));
	} else {
		no_redraw = true;
		StripableTimeAxisView::hide_all_automation ();

		/* Hide processor automation */
		for (list<ProcessorAutomationInfo*>::iterator i = processor_automation.begin(); i != processor_automation.end(); ++i) {
			for (vector<ProcessorAutomationNode*>::iterator ii = (*i)->lines.begin(); ii != (*i)->lines.end(); ++ii) {
				(*ii)->menu_item->set_active (false);
			}
		}

		no_redraw = false;
		request_redraw ();
	}
}

void
RouteTimeAxisView::region_view_added (RegionView* rv)
{
	/* XXX need to find out if automation children have automationstreamviews. If yes, no ghosts */
	for (Children::iterator i = children.begin(); i != children.end(); ++i) {
		std::shared_ptr<AutomationTimeAxisView> atv;

		if ((atv = std::dynamic_pointer_cast<AutomationTimeAxisView> (*i)) != 0) {
			atv->add_ghost(rv);
		}
	}

	/* make sure elastic audio state (anchor lines, polyphonic render
	 * cache) is reflected on region views created after this track view,
	 * e.g. when a session is loaded.
	 */
	refresh_elastic_audio_region_view (rv, elastic_audio_editing ());
}

RouteTimeAxisView::ProcessorAutomationInfo::~ProcessorAutomationInfo ()
{
	for (vector<ProcessorAutomationNode*>::iterator i = lines.begin(); i != lines.end(); ++i) {
		delete *i;
	}
}


RouteTimeAxisView::ProcessorAutomationNode::~ProcessorAutomationNode ()
{
	parent.remove_processor_automation_node (this);
}

void
RouteTimeAxisView::remove_processor_automation_node (ProcessorAutomationNode* pan)
{
	if (pan->view) {
		remove_child (pan->view);
	}
}

RouteTimeAxisView::ProcessorAutomationNode*
RouteTimeAxisView::find_processor_automation_node (std::shared_ptr<Processor> processor, Evoral::Parameter what)
{
	for (list<ProcessorAutomationInfo*>::iterator i = processor_automation.begin(); i != processor_automation.end(); ++i) {

		if ((*i)->processor == processor) {

			for (vector<ProcessorAutomationNode*>::iterator ii = (*i)->lines.begin(); ii != (*i)->lines.end(); ++ii) {
				if ((*ii)->what == what) {
					return *ii;
				}
			}
		}
	}

	return 0;
}

Gtk::CheckMenuItem*
RouteTimeAxisView::find_menu_item_by_ctrl (std::shared_ptr<AutomationControl> ac)
{
	std::map<std::shared_ptr<PBD::Controllable>, Gtk::CheckMenuItem*>::const_iterator i;
	i = ctrl_item_map.find (ac);
	if (i != ctrl_item_map.end ()) {
		return i->second;
	}
	return 0;
}

std::shared_ptr<AutomationTimeAxisView>
RouteTimeAxisView::find_atav_by_ctrl (std::shared_ptr<ARDOUR::AutomationControl> ac, bool route_owned_only)
{
	if (gain_track && gain_track->control () == ac) {
		return gain_track;
	}
	else if (trim_track && trim_track->control () == ac) {
		return trim_track;
	}
	else if (mute_track && mute_track->control () == ac) {
		return mute_track;
	}

	if (!pan_tracks.empty() && !ARDOUR::Profile->get_mixbus()) {
		for (list<std::shared_ptr<AutomationTimeAxisView> >::iterator i = pan_tracks.begin(); i != pan_tracks.end(); ++i) {
			if ((*i)->control () == ac) {
				return *i;
			}
		}
	}

	if (route_owned_only) {
		return std::shared_ptr<AutomationTimeAxisView> ();
	}

	for (Children::iterator j = children.begin(); j != children.end(); ++j) {
		std::shared_ptr<AutomationTimeAxisView> atv = std::dynamic_pointer_cast<AutomationTimeAxisView> (*j);
		if (atv && atv->control () == ac) {
			return atv;
		}
	}
	return std::shared_ptr<AutomationTimeAxisView> ();
}


/** Add an AutomationTimeAxisView to display automation for a processor's parameter */
void
RouteTimeAxisView::add_processor_automation_curve (std::shared_ptr<Processor> processor, Evoral::Parameter what)
{
	string name;
	ProcessorAutomationNode* pan;

	if ((pan = find_processor_automation_node (processor, what)) == 0) {
		/* session state may never have been saved with new plugin */
		error << _("programming error: ")
		      << string_compose (X_("processor automation curve for %1:%2/%3/%4 not registered with track!"),
		                         processor->name(), what.type(), (int) what.channel(), what.id() )
		      << endmsg;
		abort(); /*NOTREACHED*/
		return;
	}

	if (pan->view) {
		return;
	}

	std::shared_ptr<AutomationControl> control
		= std::dynamic_pointer_cast<AutomationControl>(processor->control(what, true));

	pan->view = std::shared_ptr<AutomationTimeAxisView>(
		new AutomationTimeAxisView (_session, _route, processor, control, control->parameter (),
					    _editor, *this, false, parent_canvas,
					    processor->describe_parameter (what), processor->name()));

	pan->view->Hiding.connect (sigc::bind (sigc::mem_fun(*this, &RouteTimeAxisView::processor_automation_track_hidden), pan, processor));

	add_automation_child (control->parameter(), pan->view, pan->view->marked_for_display ());

	if (_view) {
		_view->foreach_regionview (sigc::mem_fun(*pan->view.get(), &TimeAxisView::add_ghost));
	}
}

void
RouteTimeAxisView::processor_automation_track_hidden (RouteTimeAxisView::ProcessorAutomationNode* pan, std::shared_ptr<Processor>)
{
	if (!_hidden) {
		pan->menu_item->set_active (false);
	}

	if (!no_redraw) {
		request_redraw ();
	}
}

void
RouteTimeAxisView::add_existing_processor_automation_curves (std::weak_ptr<Processor> p)
{
	std::shared_ptr<Processor> processor (p.lock ());

	if (!processor || std::dynamic_pointer_cast<Amp> (processor)) {
		/* The Amp processor is a special case and is dealt with separately */
		return;
	}
	if (!processor->display_to_user()) {
		return;
	}

	set<Evoral::Parameter> existing;
	processor->what_has_data (existing);

	/* Also add explicitly visible */
	const std::set<Evoral::Parameter>& automatable = processor->what_can_be_automated ();
	for (std::set<Evoral::Parameter>::const_iterator i = automatable.begin(); i != automatable.end(); ++i) {
		std::shared_ptr<AutomationControl> control = std::dynamic_pointer_cast<AutomationControl>(processor->control(*i, false));
		if (!control) {
			continue;
		}
		/* see also AutomationTimeAxisView::state_id() */
		std::string ctrl_state_id = std::string("automation ") + control->id().to_s();
		bool visible;
		if (get_gui_property (ctrl_state_id, "visible", visible) && visible) {
			existing.insert (*i);
		}
	}

	for (set<Evoral::Parameter>::iterator i = existing.begin(); i != existing.end(); ++i) {

		Evoral::Parameter param (*i);
		std::shared_ptr<EditorAutomationLine> al;

		std::shared_ptr<AutomationControl> control = std::dynamic_pointer_cast<AutomationControl>(processor->control(*i, false));
		if (!control || control->flags () & Controllable::HiddenControl) {
			continue;
		}

		if ((al = find_processor_automation_curve (processor, param)) != 0) {
			al->queue_reset ();
		} else {
			add_processor_automation_curve (processor, param);
		}
	}
}

void
RouteTimeAxisView::add_processor_to_subplugin_menu (std::weak_ptr<Processor> p)
{
	std::shared_ptr<Processor> processor (p.lock ());

	if (!processor) {
		return;
	}

	if (std::dynamic_pointer_cast<SurroundSend> (processor) != 0) {
		/* OK, show surround send controls */
	} else if (std::dynamic_pointer_cast<Amp> (processor) != 0) {
			/* we use this override to veto the Amp processor from the plugin menu,
			 * as its automation lane can be accessed using the special "Fader" menu
			 * option
			 */
		return;
	} else if (!processor->display_to_user ()) {
		return;
	}

	using namespace Menu_Helpers;
	ProcessorAutomationInfo *rai;
	list<ProcessorAutomationInfo*>::iterator x;

	const std::set<Evoral::Parameter>& automatable = processor->what_can_be_automated ();

	if (automatable.empty()) {
		return;
	}

	for (x = processor_automation.begin(); x != processor_automation.end(); ++x) {
		if ((*x)->processor == processor) {
			break;
		}
	}

	if (x == processor_automation.end()) {
		rai = new ProcessorAutomationInfo (processor);
		processor_automation.push_back (rai);
	} else {
		rai = *x;
	}

	/* any older menu was deleted at the top of processors_changed()
	   when we cleared the subplugin menu.
	*/

	rai->menu = manage (new Menu);
	MenuList& items = rai->menu->items();
	rai->menu->set_name ("ArdourContextMenu");

	items.clear ();

	size_t total_ctrls = 0;
	for (std::set<Evoral::Parameter>::const_iterator i = automatable.begin(); i != automatable.end(); ++i) {
		string const& name = processor->describe_parameter (*i);
		if (name == X_("hidden")) {
			continue;
		}
		++total_ctrls;
	}

	const int max_items   = 32; // 32 per submenu, next menu begins with 33nd at the top
	unsigned  n_items     = 0;
	unsigned  n_groups    = 1;
	bool      use_submenu = total_ctrls > max_items + 5; // allow for some slack
	Menu*     menu        = NULL;

	if (use_submenu) {
		menu = manage (new Menu);
		menu->set_name ("ArdourContextMenu");
		items.push_back (MenuElem (string_compose (_("Parameters %1 - %2"), 1, max_items), *menu));
	} else {
		menu = rai->menu;
	}

	for (std::set<Evoral::Parameter>::const_iterator i = automatable.begin(); i != automatable.end(); ++i) {

		ProcessorAutomationNode* pan;
		Gtk::CheckMenuItem* mitem;

		string const& name = processor->describe_parameter (*i);

		if (name == X_("hidden")) {
			continue;
		}

		if (use_submenu && ++n_items > max_items) {
			n_items = 1;
			menu = manage (new Menu);
			menu->set_name ("ArdourContextMenu");
			size_t start = n_groups * max_items + 1;
			size_t end   = ++n_groups * max_items;
			/* at least 2 items per sub-menu */
			if (end + 1 >= total_ctrls) {
				end = total_ctrls;
				use_submenu = false;
			}
			items.push_back (MenuElem (string_compose (_("Parameters %1 - %2"), start, end), *menu));
		}

		MenuList& mitems = menu->items();
		mitems.push_back (CheckMenuElem (name));
		mitem = dynamic_cast<Gtk::CheckMenuItem*> (&mitems.back());

		_subplugin_menu_map[*i] = mitem;

		if ((pan = find_processor_automation_node (processor, *i)) == 0) {

			/* new item */

			pan = new ProcessorAutomationNode (*i, mitem, *this);

			rai->lines.push_back (pan);

		} else {

			pan->menu_item = mitem;

		}

		std::shared_ptr<AutomationTimeAxisView> atav = pan->view;
		bool visible;
		if (atav && atav->get_gui_property ("visible", visible)) {
			mitem->set_active(visible);
		} else {
			mitem->set_active(false);
		}

		mitem->signal_toggled().connect (sigc::bind (sigc::mem_fun(*this, &RouteTimeAxisView::processor_menu_item_toggled), rai, pan));
	}

	if (items.size() == 0) {
		return;
	}

	/* add the menu for this processor, because the subplugin
	   menu is always cleared at the top of processors_changed().
	   this is the result of some poor design in gtkmm and/or
	   GTK+.
	*/

	subplugin_menu.items().push_back (MenuElem (processor->name(), *rai->menu));
	rai->valid = true;
}

void
RouteTimeAxisView::processor_menu_item_toggled (RouteTimeAxisView::ProcessorAutomationInfo* rai,
					       RouteTimeAxisView::ProcessorAutomationNode* pan)
{
	bool showit = pan->menu_item->get_active();
	bool redraw = false;

	if (pan->view == 0 && showit) {
		add_processor_automation_curve (rai->processor, pan->what);
		redraw = true;
	}

	std::shared_ptr<AutomationTimeAxisView> atav = pan->view;
	if (atav && atav->set_marked_for_display (showit)) {
		redraw = true;
	}

	if (redraw && !no_redraw) {
		request_redraw ();
	}
}

void
RouteTimeAxisView::reread_midnam ()
{
	std::shared_ptr<PluginInsert> pi = std::dynamic_pointer_cast<PluginInsert> (_route->the_instrument ());
	assert (pi);
	bool rv = pi->plugin ()->read_midnam();

	if (rv && patch_change_dialog ()) {
		patch_change_dialog ()->refresh ();
	}
}

void
RouteTimeAxisView::drop_instrument_ref ()
{
	midnam_connection.drop_connections ();
}

void
RouteTimeAxisView::processors_changed (RouteProcessorChange c)
{
	if (_route) {
		std::shared_ptr<Processor> the_instrument (_route->the_instrument());
		std::shared_ptr<PluginInsert> pi = std::dynamic_pointer_cast<PluginInsert> (the_instrument);
		if (pi && pi->plugin ()->has_midnam ()) {
			midnam_connection.drop_connections ();
			the_instrument->DropReferences.connect (midnam_connection, invalidator (*this),
					std::bind (&RouteTimeAxisView::drop_instrument_ref, this),
					gui_context());
			pi->plugin()->UpdateMidnam.connect (midnam_connection, invalidator (*this),
					std::bind (&RouteTimeAxisView::reread_midnam, this),
					gui_context());

			reread_midnam ();
		}
	}

	if (c.type == RouteProcessorChange::MeterPointChange) {
		/* nothing to do if only the meter point has changed */
		return;
	}

	using namespace Menu_Helpers;

	for (list<ProcessorAutomationInfo*>::iterator i = processor_automation.begin(); i != processor_automation.end(); ++i) {
		(*i)->valid = false;
	}

	setup_processor_menu_and_curves ();

	bool deleted_processor_automation = false;

	for (list<ProcessorAutomationInfo*>::iterator i = processor_automation.begin(); i != processor_automation.end(); ) {

		list<ProcessorAutomationInfo*>::iterator tmp;

		tmp = i;
		++tmp;

		if (!(*i)->valid) {

			delete *i;
			processor_automation.erase (i);
			deleted_processor_automation = true;

		}

		i = tmp;
	}

	if (deleted_processor_automation && !no_redraw) {
		request_redraw ();
	}
}

std::shared_ptr<EditorAutomationLine>
RouteTimeAxisView::find_processor_automation_curve (std::shared_ptr<Processor> processor, Evoral::Parameter what)
{
	ProcessorAutomationNode* pan;

	if ((pan = find_processor_automation_node (processor, what)) != 0) {
		if (pan->view) {
			return pan->view->line();
		}
	}

	return std::shared_ptr<EditorAutomationLine>();
}

void
RouteTimeAxisView::reset_processor_automation_curves ()
{
	for (ProcessorAutomationCurves::iterator i = processor_automation_curves.begin(); i != processor_automation_curves.end(); ++i) {
		(*i)->reset();
	}
}

bool
RouteTimeAxisView::can_edit_name () const
{
	/* inactive routes do not have an editable label */
	if (_route && !_route->active()) {
		return false;
	}

	/* we do not allow track name changes if it is record enabled */
	std::shared_ptr<Track> trk (std::dynamic_pointer_cast<Track> (_route));
	if (!trk) {
		return true;
	}
	return !trk->rec_enable_control()->get_value();
}

void
RouteTimeAxisView::blink_rec_display (bool onoff)
{
	RouteUI::blink_rec_display (onoff);
}

void
RouteTimeAxisView::toggle_layer_display ()
{
	/* this is a bit of a hack, but we implement toggle via the menu items,
	   in order to keep them in sync with the visual state.
	*/

	if (!is_track()) {
		return;
	}

	if (!display_menu) {
		build_display_menu ();
	}

	if (dynamic_cast<RadioMenuItem*>(overlaid_menu_item)->get_active()) {
		dynamic_cast<RadioMenuItem*>(stacked_menu_item)->set_active (true);
	} else {
		dynamic_cast<RadioMenuItem*>(overlaid_menu_item)->set_active (true);
	}
}

void
RouteTimeAxisView::set_layer_display (LayerDisplay d)
{
	if (_ignore_set_layer_display) {
		return;
	}

	if (_view) {
		_view->set_layer_display (d);
	}

	set_gui_property (X_("layer-display"), d);
}

LayerDisplay
RouteTimeAxisView::layer_display () const
{
	if (_view) {
		return _view->layer_display ();
	}

	/* we don't know, since we don't have a _view, so just return something */
	return Overlaid;
}

void
RouteTimeAxisView::fast_update ()
{
	gm.update_meters ();
}

void
RouteTimeAxisView::hide_meter ()
{
	clear_meter ();
	gm.hide_all_meters ();
}

void
RouteTimeAxisView::show_meter ()
{
	reset_meter ();
}

void
RouteTimeAxisView::reset_meter ()
{
	if (UIConfiguration::instance().get_show_track_meters()) {
		int meter_width = 3;
		if (_route && _route->shared_peak_meter()->input_streams().n_total() == 1) {
			meter_width = 6;
		}
		gm.get_level_meter().setup_meters (height - 9, meter_width);
	} else {
		hide_meter ();
	}
}

void
RouteTimeAxisView::clear_meter ()
{
	gm.reset_peak_display ();
}

void
RouteTimeAxisView::meter_changed ()
{
	ENSURE_GUI_THREAD (*this, &RouteTimeAxisView::meter_changed)
	reset_meter();
	if (_route && !no_redraw && UIConfiguration::instance().get_show_track_meters()) {
		request_redraw ();
	}
	// reset peak when meter point changes
	gm.reset_peak_display();
}

void
RouteTimeAxisView::io_changed (IOChange /*change*/)
{
	reset_meter ();
	if (_route && !no_redraw && !_session->routes_deletion_in_progress ()) {
		request_redraw ();
	}
}

void
RouteTimeAxisView::chan_count_changed ()
{
	AudioStreamView* asv = dynamic_cast<AudioStreamView*>(_view);
	if (_route && !no_redraw && asv) {
		/* This is similar to ARDOUR_UI::cleanup_peakfiles, and
		 * re-loads wave-form displays. */
		asv->reload_waves ();
		reset_meter ();
		request_redraw ();
	}
}

void
RouteTimeAxisView::set_button_names ()
{
	if (_route && _route->solo_safe_control()->solo_safe()) {
		solo_button->set_visual_state (Gtkmm2ext::VisualState (solo_button->visual_state() | Gtkmm2ext::Insensitive));
	} else {
		solo_button->set_visual_state (Gtkmm2ext::VisualState (solo_button->visual_state() & ~Gtkmm2ext::Insensitive));
	}
	if (Config->get_solo_control_is_listen_control()) {
		switch (Config->get_listen_position()) {
			case AfterFaderListen:
				solo_button->set_text (S_("AfterFader|A"));
				set_tooltip (*solo_button, _("After-fade listen (AFL)"));
				break;
			case PreFaderListen:
				solo_button->set_text (S_("PreFader|P"));
				set_tooltip (*solo_button, _("Pre-fade listen (PFL)"));
			break;
		}
	} else {
		solo_button->set_text (S_("Solo|S"));
		set_tooltip (*solo_button, _("Solo"));
	}
	mute_button->set_text (S_("Mute|M"));
}

Gtk::CheckMenuItem*
RouteTimeAxisView::automation_child_menu_item (Evoral::Parameter param)
{
	Gtk::CheckMenuItem* rv = StripableTimeAxisView::automation_child_menu_item (param);
	if (rv) {
		return rv;
	}

	ParameterMenuMap::iterator i = _subplugin_menu_map.find (param);
	if (i != _subplugin_menu_map.end()) {
		return i->second;
	}

	return 0;
}

void
RouteTimeAxisView::create_gain_automation_child (const Evoral::Parameter& param, bool show)
{
	std::shared_ptr<AutomationControl> c = _route->gain_control();
	if (!c) {
		error << "Route has no gain automation, unable to add automation track view." << endmsg;
		return;
	}

	gain_track.reset (new AutomationTimeAxisView (_session,
						      _route, _route->amp(), c, param,
						      _editor,
						      *this,
						      false,
						      parent_canvas,
						      _route->amp()->describe_parameter(param)));

	if (_view) {
		_view->foreach_regionview (sigc::mem_fun (*gain_track.get(), &TimeAxisView::add_ghost));
	}

	add_automation_child (Evoral::Parameter(GainAutomation), gain_track, show);
}

void
RouteTimeAxisView::create_trim_automation_child (const Evoral::Parameter& param, bool show)
{
	std::shared_ptr<AutomationControl> c = _route->trim()->gain_control();
	if (!c || ! _route->trim()->active()) {
		return;
	}

	trim_track.reset (new AutomationTimeAxisView (_session,
						      _route, _route->trim(), c, param,
						      _editor,
						      *this,
						      false,
						      parent_canvas,
						      _route->trim()->describe_parameter(param)));

	if (_view) {
		_view->foreach_regionview (sigc::mem_fun (*trim_track.get(), &TimeAxisView::add_ghost));
	}

	add_automation_child (Evoral::Parameter(TrimAutomation), trim_track, show);
}

void
RouteTimeAxisView::create_mute_automation_child (const Evoral::Parameter& param, bool show)
{
	std::shared_ptr<AutomationControl> c = _route->mute_control();
	if (!c) {
		error << "Route has no mute automation, unable to add automation track view." << endmsg;
		return;
	}

	mute_track.reset (new AutomationTimeAxisView (_session,
						      _route, _route, c, param,
						      _editor,
						      *this,
						      false,
						      parent_canvas,
						      _route->describe_parameter(param)));

	if (_view) {
		_view->foreach_regionview (sigc::mem_fun (*mute_track.get(), &TimeAxisView::add_ghost));
	}

	add_automation_child (Evoral::Parameter(MuteAutomation), mute_track, show);
}

static
void add_region_to_list (RegionView* rv, RegionList* l)
{
	l->push_back (rv->region());
}

RegionView*
RouteTimeAxisView::combine_regions ()
{
	if (!_view) {
		return 0;
	}

	RegionList selected_regions;
	std::shared_ptr<Playlist> playlist = track()->playlist();

	_view->foreach_selected_regionview (sigc::bind (sigc::ptr_fun (add_region_to_list), &selected_regions));

	if (selected_regions.size() < 2) {
		return 0;
	}

	playlist->clear_changes ();
	std::shared_ptr<Region> compound_region = playlist->combine (selected_regions, track());

	_session->add_command (new StatefulDiffCommand (playlist));
	/* make the new region be selected */

	return _view->find_view (compound_region);
}

void
RouteTimeAxisView::uncombine_regions ()
{
	/* as of may 2011, we do not offer uncombine for MIDI tracks
	 */
	if (!is_audio_track()) {
		return;
	}

	if (!_view) {
		return;
	}

	RegionList selected_regions;
	std::shared_ptr<Playlist> playlist = track()->playlist();

	/* have to grab selected regions first because the uncombine is going
	 * to change that in the middle of the list traverse
	 */

	_view->foreach_selected_regionview (sigc::bind (sigc::ptr_fun (add_region_to_list), &selected_regions));

	playlist->clear_changes ();

	for (RegionList::iterator i = selected_regions.begin(); i != selected_regions.end(); ++i) {
		playlist->uncombine (*i);
	}

	_session->add_command (new StatefulDiffCommand (playlist));
}

string
RouteTimeAxisView::state_id() const
{
	return string_compose ("rtav %1", _route->id().to_s());
}


void
RouteTimeAxisView::remove_child (std::shared_ptr<TimeAxisView> c)
{
	TimeAxisView::remove_child (c);

	std::shared_ptr<AutomationTimeAxisView> a = std::dynamic_pointer_cast<AutomationTimeAxisView> (c);
	if (a) {
		for (AutomationTracks::iterator i = _automation_tracks.begin(); i != _automation_tracks.end(); ++i) {
			if (i->second == a) {
				_automation_tracks.erase (i);
				return;
			}
		}
	}
}

std::shared_ptr<AutomationTimeAxisView>
RouteTimeAxisView::automation_child(Evoral::Parameter param, PBD::ID ctrl_id)
{
	if (param.type() != PluginAutomation) {
		return StripableTimeAxisView::automation_child (param, ctrl_id);
	}
	for (list<ProcessorAutomationInfo*>::iterator i = processor_automation.begin(); i != processor_automation.end(); ++i) {
		for (vector<ProcessorAutomationNode*>::iterator ii = (*i)->lines.begin(); ii != (*i)->lines.end(); ++ii) {
			std::shared_ptr<AutomationTimeAxisView> atv ((*ii)->view);
			if (atv->control()->id() == ctrl_id) {
				return atv;
			}
		}
	}
	return std::shared_ptr<AutomationTimeAxisView>();
}

std::shared_ptr<AutomationLine>
RouteTimeAxisView::automation_child_by_alist_id (PBD::ID alist_id)
{
	for (list<ProcessorAutomationInfo*>::iterator i = processor_automation.begin(); i != processor_automation.end(); ++i) {
		for (vector<ProcessorAutomationNode*>::iterator ii = (*i)->lines.begin(); ii != (*i)->lines.end(); ++ii) {
			std::shared_ptr<AutomationTimeAxisView> atv ((*ii)->view);
			if (!atv) {
				continue;
			}
			for (auto & line : atv->lines()) {
				if (line->the_list()->id() == alist_id) {
					return line;
				}
			}
		}
	}
	return StripableTimeAxisView::automation_child_by_alist_id (alist_id);
}


Gdk::Color
RouteTimeAxisView::color () const
{
	return route_color ();
}

bool
RouteTimeAxisView::marked_for_display () const
{
	return !_route->presentation_info().hidden();
}

bool
RouteTimeAxisView::set_marked_for_display (bool yn)
{
	return RouteUI::mark_hidden (!yn);
}

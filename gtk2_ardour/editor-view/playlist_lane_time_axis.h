/*
 * Copyright (C) 2026 Ardour custom fork
 *
 * Pro-Tools-style playlist lane: shows one alternate (non-active) playlist of a
 * track as an editable lane beneath the main track view.
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

#pragma once

#include <memory>

#include <ytkmm/box.h>

#include "widgets/ardour_button.h"

#include "editor-view/audio_time_axis.h"

namespace ARDOUR {
	class AudioPlaylist;
	class Playlist;
	class Route;
	class Session;
}

class RegionSelection;

/** A single Pro-Tools-style "comp lane": a child time-axis view that displays
 *  and edits one alternate playlist of the parent track. It shares the parent
 *  track's Route (so editing/selection/elastic-audio work like a normal track),
 *  but never records, and binds its StreamView to a fixed playlist instead of
 *  the track's active one.
 */
class PlaylistLaneTimeAxisView : public AudioTimeAxisView
{
public:
	PlaylistLaneTimeAxisView (PublicEditor&, ARDOUR::Session*, ArdourCanvas::Canvas&,
	                          RouteTimeAxisView& parent,
	                          std::shared_ptr<ARDOUR::AudioPlaylist>);
	~PlaylistLaneTimeAxisView ();

	void set_route (std::shared_ptr<ARDOUR::Route>);

	/* the lane edits its own (alternate) playlist, not the track's active one */
	std::shared_ptr<ARDOUR::Playlist> playlist () const;
	std::shared_ptr<ARDOUR::AudioPlaylist> lane_playlist () const { return _lane_playlist; }

	void first_idle ();
	void set_height (uint32_t h, TrackHeightMode m = OnlySelf, bool from_idle = false);
	/* set our height without re-broadcasting it as a shared lane height */
	void apply_shared_height (uint32_t h);

	void cut_copy_clear (Selection&, Editing::CutCopyOp);

	/* lane-solo (speaker) state; the parent coordinates exclusivity */
	void set_audition_active (bool);
	bool audition_active () const { return _audition_active; }

	/* emitted when the user toggles this lane's speaker button */
	sigc::signal<void, PlaylistLaneTimeAxisView*, bool> AuditionToggled;
	/* emitted when the user drags this lane's bottom edge (shared lane height) */
	sigc::signal<void, uint32_t> LaneResized;

	void update_promote_sensitivity ();

	/* The lane shares the parent's Route, so it must NOT reuse
	 * RouteTimeAxisView's route-keyed gui state (height/visibility would
	 * collide with the parent) nor its route-presentation visibility (which
	 * would hide the whole track). Override to a per-lane identity instead.
	 */
	std::string state_id () const;
	bool marked_for_display () const;
	bool set_marked_for_display (bool);
	bool is_playlist_lane () const { return true; }

protected:
	void label_view ();
	bool can_edit_name () const { return false; }

private:
	RouteTimeAxisView&                     _parent;
	std::shared_ptr<ARDOUR::AudioPlaylist> _lane_playlist;

	ArdourWidgets::ArdourButton _audition_button; /* speaker: lane-solo */
	ArdourWidgets::ArdourButton _promote_button;  /* up-arrow: copy selection to main */

	bool _audition_active;
	bool _lane_controls_built;
	bool _in_set_height;

	void build_lane_controls ();
	void hide_route_controls ();
	bool audition_button_press (GdkEventButton*);
	bool promote_button_press (GdkEventButton*);
	void copy_selection_to_main ();
};

/*
 * Copyright (C) 2011-2012 Carl Hetherington <carl@carlh.net>
 * Copyright (C) 2011-2012 David Robillard <d@drobilla.net>
 * Copyright (C) 2011-2016 Paul Davis <paul@linuxaudiosystems.com>
 * Copyright (C) 2014-2017 Robin Gareus <robin@gareus.org>
 * Copyright (C) 2015 Tim Mayberry <mojofunk@gmail.com>
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

#include <iostream>
#include <iomanip>
#include <cstring>
#include <cmath>
#include <algorithm>

#include <ytkmm/window.h>
#include <pangomm/layout.h>

#include "pbd/compose.h"

#include "gtkmm2ext/gui_thread.h"
#include "gtkmm2ext/gtk_ui.h"
#include "gtkmm2ext/keyboard.h"
#include "gtkmm2ext/utils.h"
#include "gtkmm2ext/persistent_tooltip.h"

#include "ardour/pannable.h"
#include "ardour/panner.h"
#include "ardour/panner_shell.h"

#include "mixer/pan-knob/mono_panner.h"
#include "mixer/pan-knob/mono_panner_editor.h"
#include "app-core/rgb_macros.h"
#include "session-config-dialogs/ui_config.h"
#include "app-core/utils.h"

#include "pbd/i18n.h"

using namespace std;
using namespace Gtk;
using namespace Gtkmm2ext;
using namespace ARDOUR_UI_UTILS;

using PBD::Controllable;

namespace {

double
clamp_unit_interval (double value)
{
	return std::max (0.0, std::min (1.0, value));
}

void
set_rgba (Cairo::RefPtr<Cairo::Context> const& context, uint32_t color)
{
	context->set_source_rgba (UINT_RGBA_R_FLT(color), UINT_RGBA_G_FLT(color), UINT_RGBA_B_FLT(color), UINT_RGBA_A_FLT(color));
}

std::string
pro_tools_pan_text (double pos)
{
	int const pan = (int) rint ((clamp_unit_interval (pos) - 0.5) * 200.0);

	if (pan < 0) {
		return string_compose (X_("<%1"), -pan);
	} else if (pan > 0) {
		return string_compose (X_("%1>"), pan);
	}

	return X_("0");
}

void
draw_pro_tools_pan_knob (Cairo::RefPtr<Cairo::Context> const& context, double cx, double cy, double radius, double pos, uint32_t tick_color, bool sensitive)
{
	static const double pi = 3.14159265358979323846;
	double const angle = (-225.0 + (270.0 * clamp_unit_interval (pos))) * (pi / 180.0);
	double const inner = std::max (1.0, radius - 3.0);
	Cairo::RefPtr<Cairo::LinearGradient> knob_fill = Cairo::LinearGradient::create (cx, cy - radius, cx, cy + radius);

	knob_fill->add_color_stop_rgb (0.0, .66, .66, .64);
	knob_fill->add_color_stop_rgb (.48, .27, .27, .26);
	knob_fill->add_color_stop_rgb (1.0, .08, .08, .08);

	context->save ();
	context->arc (cx, cy, radius, 0, 2.0 * pi);
	context->set_source_rgb (.02, .02, .02);
	context->fill_preserve ();
	context->set_line_width (1.0);
	context->set_source_rgb (.70, .70, .66);
	context->stroke ();

	context->arc (cx, cy, inner, 0, 2.0 * pi);
	context->set_source (knob_fill);
	context->fill_preserve ();
	context->set_line_width (1.0);
	context->set_source_rgb (.06, .06, .06);
	context->stroke ();

	context->set_line_width (std::max (1.2, radius * .18));
	if (sensitive) {
		set_rgba (context, tick_color);
	} else {
		context->set_source_rgb (.48, .48, .48);
	}
	context->move_to (cx + cos (angle) * (radius * .20), cy + sin (angle) * (radius * .20));
	context->line_to (cx + cos (angle) * (radius * .72), cy + sin (angle) * (radius * .72));
	context->stroke ();

	context->set_line_width (1.0);
	context->set_source_rgba (1.0, 1.0, 1.0, .25);
	context->arc (cx - radius * .28, cy - radius * .34, radius * .18, 0, 2.0 * pi);
	context->stroke ();
	context->restore ();
}

void
draw_pro_tools_pan_display (Cairo::RefPtr<Cairo::Context> const& context, Glib::RefPtr<Pango::Layout> const& layout, double x, double y, double w, double h, std::string const& text, bool sensitive)
{
	int tw;
	int th;

	context->save ();
	context->rectangle (x, y, w, h);
	context->set_source_rgb (.015, .025, .015);
	context->fill_preserve ();
	context->set_line_width (1.0);
	context->set_source_rgb (.10, .16, .10);
	context->stroke ();

	layout->set_text (text);
	layout->get_pixel_size (tw, th);
	context->move_to (rint (x + ((w - tw) / 2.0)), rint (y + ((h - th) / 2.0)));
	if (sensitive) {
		context->set_source_rgb (.45, 1.0, .05);
	} else {
		context->set_source_rgb (.32, .45, .24);
	}
	pango_cairo_show_layout (context->cobj(), layout->gobj());
	context->restore ();
}

} /* namespace */

MonoPanner::ColorScheme MonoPanner::colors;
bool MonoPanner::have_colors = false;

Pango::AttrList MonoPanner::panner_font_attributes;
bool            MonoPanner::have_font = false;

MonoPanner::MonoPanner (std::shared_ptr<ARDOUR::PannerShell> p)
	: PannerInterface (p->panner())
	, _panner_shell (p)
	, position_control (_panner->pannable()->pan_azimuth_control)
	, drag_start_x (0)
	, last_drag_x (0)
	, drag_start_y (0)
	, last_drag_y (0)
	, accumulated_delta (0)
	, detented (false)
	, position_binder (position_control)
	, _dragging (false)
{
	if (!have_colors) {
		set_colors ();
		have_colors = true;
	}
	if (!have_font) {
		Pango::FontDescription font;
		Pango::AttrFontDesc* font_attr;
		font = Pango::FontDescription (UIConfiguration::instance().get_SmallBoldMonospaceFont());
		font_attr = new Pango::AttrFontDesc (Pango::Attribute::create_attr_font_desc (font));
		panner_font_attributes.change(*font_attr);
		delete font_attr;
		have_font = true;
	}

	position_control->Changed.connect (panvalue_connections, invalidator(*this), std::bind (&MonoPanner::value_change, this), gui_context());

	_panner_shell->Changed.connect (panshell_connections, invalidator (*this), std::bind (&MonoPanner::bypass_handler, this), gui_context());
	_panner_shell->PannableChanged.connect (panshell_connections, invalidator (*this), std::bind (&MonoPanner::pannable_handler, this), gui_context());
	UIConfiguration::instance().ColorsChanged.connect (sigc::mem_fun (*this, &MonoPanner::color_handler));

	set_tooltip ();
}

MonoPanner::~MonoPanner ()
{

}

void
MonoPanner::set_tooltip ()
{
	if (_panner_shell->bypassed()) {
		_tooltip.set_tip (_("bypassed"));
		return;
	}
	double pos = position_control->get_value(); // 0..1

	/* We show the position of the center of the image relative to the left & right.
		 This is expressed as a pair of percentage values that ranges from (100,0)
		 (hard left) through (50,50) (hard center) to (0,100) (hard right).

		 This is pretty weird, but its the way audio engineers expect it. Just remember that
		 the center of the USA isn't Kansas, its (50LA, 50NY) and it will all make sense.
		 */

	char buf[64];
	snprintf (buf, sizeof (buf), _("L:%3d R:%3d"),
			(int) rint (100.0 * (1.0 - pos)),
			(int) rint (100.0 * pos));
	_tooltip.set_tip (buf);
}

bool
MonoPanner::on_expose_event (GdkEventExpose*)
{
	Cairo::RefPtr<Cairo::Context> context = get_window()->create_cairo_context();
	Glib::RefPtr<Pango::Layout> layout = Pango::Layout::create(get_pango_context());
	layout->set_attributes (panner_font_attributes);

	int const width = get_width();
	int const height = get_height ();
	double const scale = UIConfiguration::instance().get_ui_scale();
	double const pos = position_control->get_value (); /* 0..1 */
	uint32_t tick = (_send_mode && !_panner_shell->is_linked_to_route()) ? colors.send_pan : colors.pos_fill;
	bool sensitive = _sensitive;

	if (_panner_shell->bypassed()) {
		tick = 0x606060ff;
		sensitive = false;
	} else if (!_sensitive) {
		tick = 0xa0a0a0ff;
	}

	Gdk::Color bg_color = get_style()->get_bg (get_state());
	context->set_source_rgb (bg_color.get_red_p(), bg_color.get_green_p(), bg_color.get_blue_p());
	context->rectangle (0, 0, width, height);
	context->fill ();

	double const display_h = std::max (11.0, rint (12.0 * scale));
	double const radius = std::max (8.0, std::min (std::min (width * .36, (height - display_h - 6.0) * .5), 13.0 * scale));
	double const cx = rint (width * .5);
	double const cy = rint (2.0 + radius);
	double const display_w = std::max (28.0, std::min (width - 4.0, 42.0 * scale));
	double const display_x = rint ((width - display_w) * .5);
	double const display_y = rint (height - display_h - 1.0);

	draw_pro_tools_pan_knob (context, cx, cy, radius, pos, tick, sensitive);
	draw_pro_tools_pan_display (context, layout, display_x, display_y, display_w, display_h, pro_tools_pan_text (pos), sensitive);

	return true;
}

bool
MonoPanner::on_button_press_event (GdkEventButton* ev)
{
	if (PannerInterface::on_button_press_event (ev)) {
		return true;
	}
	if (_panner_shell->bypassed()) {
		return false;
	}

	drag_start_x = ev->x;
	last_drag_x = ev->x;
	drag_start_y = ev->y;
	last_drag_y = ev->y;

	_dragging = false;
	_tooltip.target_stop_drag ();
	accumulated_delta = 0;
	detented = false;

	/* Let the binding proxies get first crack at the press event
	*/

	if (ev->y < 20) {
		if (position_binder.button_press_handler (ev)) {
			return true;
		}
	}

	if (ev->button != 1) {
		return false;
	}

	if (ev->type == GDK_2BUTTON_PRESS) {
		int width = get_width();

		if (Keyboard::modifier_state_contains (ev->state, Keyboard::TertiaryModifier)) {
			/* handled by button release */
			return true;
		}


		if (ev->x <= width/3) {
			/* left side dbl click */
			position_control->set_value (0, Controllable::NoGroup);
		} else if (ev->x > 2*width/3) {
			position_control->set_value (1.0, Controllable::NoGroup);
		} else {
			position_control->set_value (0.5, Controllable::NoGroup);
		}

		_dragging = false;
		_tooltip.target_stop_drag ();

	} else if (ev->type == GDK_BUTTON_PRESS) {

		if (Keyboard::modifier_state_contains (ev->state, Keyboard::TertiaryModifier)) {
			/* handled by button release */
			return true;
		}

		_dragging = true;
		_tooltip.target_start_drag ();
		StartGesture ();
	}

	return true;
}

bool
MonoPanner::on_button_release_event (GdkEventButton* ev)
{
	if (PannerInterface::on_button_release_event (ev)) {
		return true;
	}

	if (ev->button != 1) {
		return false;
	}

	if (_panner_shell->bypassed()) {
		return false;
	}

	_dragging = false;
	_tooltip.target_stop_drag ();
	accumulated_delta = 0;
	detented = false;

	if (Keyboard::modifier_state_contains (ev->state, Keyboard::TertiaryModifier)) {
		_panner->reset ();
	} else {
		StopGesture ();
	}

	return true;
}

bool
MonoPanner::on_scroll_event (GdkEventScroll* ev)
{
	double one_degree = 1.0/180.0; // one degree as a number from 0..1, since 180 degrees is the full L/R axis
	double pv = position_control->get_value(); // 0..1.0 ; 0 = left
	double step;

	if (_panner_shell->bypassed()) {
		return false;
	}

	if (Keyboard::modifier_state_contains (ev->state, Keyboard::PrimaryModifier)) {
		step = one_degree;
	} else {
		step = one_degree * 5.0;
	}

	switch (ev->direction) {
		case GDK_SCROLL_LEFT:
		case GDK_SCROLL_DOWN:
			pv -= step;
			position_control->set_value (pv, Controllable::NoGroup);
			break;
		case GDK_SCROLL_RIGHT:
		case GDK_SCROLL_UP:
			pv += step;
			position_control->set_value (pv, Controllable::NoGroup);
			break;
	}

	return true;
}

bool
MonoPanner::on_motion_notify_event (GdkEventMotion* ev)
{
	if (_panner_shell->bypassed()) {
		_dragging = false;
	}
	if (!_dragging) {
		return false;
	}

	int h = get_height();
	double delta = (last_drag_y - ev->y) / (double) h;

	/* create a detent close to the center, at approx 1/180 deg */
	if (!detented && fabs (position_control->get_value() - .5) < 0.006) {
		detented = true;
		/* snap to center */
		position_control->set_value (0.5, Controllable::NoGroup);
	}

	if (detented) {
		accumulated_delta += delta;

		/* have we pulled far enough to escape ? */

		if (fabs (accumulated_delta) >= 0.048) {
			position_control->set_value (position_control->get_value() + (accumulated_delta > 0 ? 0.006 : -0.006), Controllable::NoGroup);
			detented = false;
			accumulated_delta = 0;
		}
	} else {
		double pv = position_control->get_value(); // 0..1.0 ; 0 = left
		position_control->set_value (pv + delta, Controllable::NoGroup);
	}

	last_drag_x = ev->x;
	last_drag_y = ev->y;
	return true;
}

bool
MonoPanner::on_key_press_event (GdkEventKey* ev)
{
	double one_degree = 1.0/180.0;
	double pv = position_control->get_value(); // 0..1.0 ; 0 = left
	double step;

	if (_panner_shell->bypassed()) {
		return false;
	}

	if (Keyboard::modifier_state_contains (ev->state, Keyboard::PrimaryModifier)) {
		step = one_degree;
	} else {
		step = one_degree * 5.0;
	}

	switch (ev->keyval) {
		case GDK_Left:
			pv -= step;
			position_control->set_value (pv, Controllable::NoGroup);
			break;
		case GDK_Right:
			pv += step;
			position_control->set_value (pv, Controllable::NoGroup);
			break;
		case GDK_0:
		case GDK_KP_0:
			position_control->set_value (0.0, Controllable::NoGroup);
			break;
		default:
			return false;
	}

	return true;
}

void
MonoPanner::set_colors ()
{
	colors.fill        = UIConfiguration::instance().color_mod ("mono panner fill", "panner fill");
	colors.outline     = UIConfiguration::instance().color ("mono panner outline");
	colors.text        = UIConfiguration::instance().color ("mono panner text");
	colors.background  = UIConfiguration::instance().color ("mono panner bg");
	colors.pos_outline = UIConfiguration::instance().color ("mono panner position outline");
	colors.pos_fill    = UIConfiguration::instance().color_mod ("mono panner position fill", "mono panner position fill");
	colors.send_bg     = UIConfiguration::instance().color ("send bg");
	colors.send_pan    = UIConfiguration::instance().color ("send pan");
}

void
MonoPanner::color_handler ()
{
	set_colors ();
	queue_draw ();
}

void
MonoPanner::bypass_handler ()
{
	queue_draw ();
}

void
MonoPanner::pannable_handler ()
{
	panvalue_connections.drop_connections();
	position_control = _panner->pannable()->pan_azimuth_control;
	position_binder.set_controllable(position_control);
	position_control->Changed.connect (panvalue_connections, invalidator(*this), std::bind (&MonoPanner::value_change, this), gui_context());
	queue_draw ();
}

PannerEditor*
MonoPanner::editor ()
{
	return new MonoPannerEditor (this);
}

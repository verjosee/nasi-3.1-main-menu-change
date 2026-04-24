draw_set_halign(fa_center);
draw_set_valign(fa_middle);
var float_y = sin(ui_timer * 0.08) * 4;

for (var i = 0; i <= room_height; i += 4) {
    var t = i / room_height;
    var r = 8 + (t * 16);
    var g = 10 + (t * 14);
    var b = 24 + (t * 45);
    draw_set_color(make_color_rgb(r, g, b));
    draw_rectangle(0, i, room_width, i + 4, false);
}

draw_set_alpha(0.35);
draw_set_color(c_black);
draw_roundrect(panel_x1, panel_y1 + float_y, panel_x2, panel_y2 + float_y, false);
draw_set_alpha(ui_alpha);

draw_set_color(c_aqua);
draw_text_transformed(room_width * 0.5, title_y + float_y, "SETTINGS", 1.8, 1.8, 0);

draw_set_color(c_white);
draw_text(room_width * 0.5, title_y + 55 + float_y, "Atur audio, debug, dan progres game");

var minus_x = room_width * 0.35;
var plus_x = room_width * 0.65;
var slider_x1 = room_width * 0.4;
var slider_x2 = room_width * 0.6;

draw_volume_row = function(_label, _value, _y, _is_hover_minus, _is_hover_plus, _minus_x, _plus_x, _slider_x1, _slider_x2) {
    draw_set_color(c_white);
    draw_text(room_width * 0.5, _y - 55, _label + ": " + string(round(_value * 100)) + "%");

    draw_set_color(make_color_rgb(70, 80, 110));
    draw_roundrect(_slider_x1, _y - 8, _slider_x2, _y + 8, false);

    var fill_x = lerp(_slider_x1, _slider_x2, _value);
    draw_set_color(c_lime);
    draw_roundrect(_slider_x1, _y - 8, fill_x, _y + 8, false);

    draw_set_color(_is_hover_minus ? c_yellow : c_ltgray);
    draw_roundrect(_minus_x - button_w * 0.5, _y - button_h * 0.5, _minus_x + button_w * 0.5, _y + button_h * 0.5, false);
    draw_set_color(c_black);
    draw_text(_minus_x, _y, "-");

    draw_set_color(_is_hover_plus ? c_yellow : c_ltgray);
    draw_roundrect(_plus_x - button_w * 0.5, _y - button_h * 0.5, _plus_x + button_w * 0.5, _y + button_h * 0.5, false);
    draw_set_color(c_black);
    draw_text(_plus_x, _y, "+");
};

// Remove old volume rows - now handled by sliders

var toggle_x1 = (room_width - toggle_w) * 0.5;
var toggle_x2 = toggle_x1 + toggle_w;
draw_set_color(c_white);
draw_text(room_width * 0.5, fullscreen_y - 55, "Fullscreen");
draw_set_color(hover_id == "fullscreen" ? c_yellow : make_color_rgb(80, 90, 130));
draw_roundrect(toggle_x1, fullscreen_y - toggle_h * 0.5, toggle_x2, fullscreen_y + toggle_h * 0.5, false);
draw_set_color(c_black);
draw_text(room_width * 0.5, fullscreen_y, global.fullscreen ? "ON" : "OFF");

var action_w = 460;
var action_h = 70;
var action_x1 = (room_width - action_w) * 0.5;
var action_x2 = action_x1 + action_w;

draw_set_color(hover_id == "debug_unlock" ? c_yellow : make_color_rgb(95, 110, 160));
draw_roundrect(action_x1, debug_unlock_y - action_h * 0.5, action_x2, debug_unlock_y + action_h * 0.5, false);
draw_set_color(c_black);
draw_text(room_width * 0.5, debug_unlock_y, "DEBUG UNLOCK ALL: " + (global.debug_unlock_all ? "ON" : "OFF"));

draw_set_color(hover_id == "reset_progress" ? c_red : make_color_rgb(170, 90, 90));
draw_roundrect(action_x1, reset_progress_y - action_h * 0.5, action_x2, reset_progress_y + action_h * 0.5, false);
draw_set_color(c_white);
draw_text(room_width * 0.5, reset_progress_y, "RESET LEVEL + HIGHSCORE");

var back_x1 = (room_width - back_w) * 0.5;
var back_x2 = back_x1 + back_w;
draw_set_color(hover_id == "back" ? c_yellow : c_aqua);
draw_roundrect(back_x1, back_y - back_h * 0.5, back_x2, back_y + back_h * 0.5, false);
draw_set_color(c_black);
draw_text(room_width * 0.5, back_y, "KEMBALI");

draw_set_color(c_ltgray);
draw_text(room_width * 0.5, room_height - 70, "Tekan ESC untuk kembali");

draw_set_alpha(1);
draw_set_color(c_white);
draw_set_halign(fa_left);
draw_set_valign(fa_top);

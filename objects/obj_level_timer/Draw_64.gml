draw_set_halign(fa_center);
draw_set_valign(fa_top);
draw_set_font(fnt_score);

// Timer
var seconds = global.level_time_left div 60;
var display_time = string(seconds) + "s";

draw_set_color(c_white);
draw_text(room_width/2, 20, "TIME LEFT: " + display_time);

// Wave
draw_set_color(c_yellow);
draw_text(room_width/2, 60, "WAVE " + string(global.current_wave) + "/3");
/// DRAW GUI - obj_level (Modern UI)

draw_set_font(fnt_score);
draw_set_halign(fa_center);
draw_set_valign(fa_top);

var panel_x1 = room_width/2 - 120;
var panel_y1 = 20;
var panel_x2 = room_width/2 + 120;
var panel_y2 = 100;

// --- PANEL BACKGROUND ---
draw_set_alpha(0.4);
draw_set_color(c_black);
draw_roundrect_ext(panel_x1, panel_y1, panel_x2, panel_y2, 15, 15, false);
draw_set_alpha(0.6);
draw_set_color(c_green);
draw_roundrect_ext(panel_x1, panel_y1, panel_x2, panel_y2, 15, 15, true);
draw_set_alpha(1);

// === LEVEL ===
draw_set_color(c_white);
draw_text_transformed(room_width/2, panel_y1 + 10, "LEVEL", 0.6, 0.6, 0);

// Level number with glow effect
draw_set_color(c_lime);
draw_text_transformed(room_width/2, panel_y1 + 35, string(global.level), 1.5, 1.5, 0);

// Reset alignment
draw_set_halign(fa_left);
draw_set_color(c_white);
draw_set_font(-1);

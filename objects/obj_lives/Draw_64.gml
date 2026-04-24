/// DRAW GUI - obj_lives (Modern UI)

draw_set_font(fnt_score);
draw_set_halign(fa_right);
draw_set_valign(fa_top);

var panel_x1 = room_width - 220;
var panel_y1 = 20;
var panel_x2 = room_width - 20;
var panel_y2 = 100;

// --- PANEL BACKGROUND ---
draw_set_alpha(0.4);
draw_set_color(c_black);
draw_roundrect_ext(panel_x1, panel_y1, panel_x2, panel_y2, 15, 15, false);
draw_set_alpha(0.6);
draw_set_color(c_red);
draw_roundrect_ext(panel_x1, panel_y1, panel_x2, panel_y2, 15, 15, true);
draw_set_alpha(1);

// === LIVES ===
draw_set_color(c_white);
draw_text_transformed(panel_x2 - 15, panel_y1 + 10, "LIVES", 0.6, 0.6, 0);

// Animasi kedip jika nyawa sedikit (1)
var lives_color = c_white;
if (global.lives <= 1) {
    lives_color = (sin(current_time * 0.01) > 0) ? c_red : c_white;
}

draw_set_color(lives_color);
draw_text_transformed(panel_x2 - 15, panel_y1 + 35, string(global.lives), 1.5, 1.5, 0);

// Reset
draw_set_halign(fa_left);
draw_set_color(c_white);
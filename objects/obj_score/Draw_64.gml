/// DRAW GUI - obj_score (Modern UI)

draw_set_font(fnt_score);
draw_set_halign(fa_left);
draw_set_valign(fa_top);

// --- PANEL BACKGROUND ---
draw_set_alpha(0.4);
draw_set_color(c_black);
draw_roundrect_ext(20, 20, 280, 280, 20, 20, false); // Panel background
draw_set_alpha(0.6);
draw_set_color(c_aqua);
draw_roundrect_ext(20, 20, 280, 280, 20, 20, true);  // Outline panel
draw_set_alpha(1);

var start_x = 45;

// === SCORE ===
draw_set_color(c_white);
draw_text_transformed(start_x, 35, "SCORE", 0.7, 0.7, 0);
draw_set_color(c_yellow);
draw_text_transformed(start_x, 60, string(global.score), 1.4, 1.4, 0);

// === HIGH SCORE ===
draw_set_color(c_white);
draw_text_transformed(start_x, 115, "BEST SCORE", 0.7, 0.7, 0);
draw_set_color(c_orange);
draw_text_transformed(start_x, 140, string(global.highscore), 1.2, 1.2, 0);

// === LEVEL ===
draw_set_color(c_aqua);
draw_text_transformed(start_x, 200, "LEVEL", 0.7, 0.7, 0);
draw_set_color(c_white);
draw_text_transformed(start_x, 225, string(global.level), 1.8, 1.8, 0);

// Glow effect for Score (if increasing)
if (global.score > 0) {
    draw_set_alpha(0.1 + sin(current_time * 0.005) * 0.05);
    draw_set_color(c_yellow);
    draw_text_transformed(start_x, 60, string(global.score), 1.45, 1.45, 0);
    draw_set_alpha(1);
}

draw_set_color(c_white);
draw_set_font(fnt_score);

// === SCORE ===
draw_set_color(c_white);
draw_text(40, 30, "SCORE");
draw_set_color(c_yellow);
draw_text(40, 65, string(global.score));

// === HIGH SCORE ===
draw_set_color(c_white);
draw_text(40, 110, "HIGH SCORE");
draw_set_color(c_yellow);
draw_text(40, 145, string(global.highscore));

// === LEVEL ===
draw_set_color(c_aqua);
draw_text(40, 195, "LEVEL");
draw_set_color(c_white);
draw_text_transformed(40, 230, string(global.level), 1.8, 1.8, 0);  // ukuran sedang

draw_set_color(c_white);
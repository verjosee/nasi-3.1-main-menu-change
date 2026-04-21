draw_set_font(fnt_score);     // pakai font yang sama dengan score
draw_set_color(c_red);

draw_text(room_width - 220, 30, "LIVES: " + string(global.lives));

draw_set_color(c_white);      // reset warna
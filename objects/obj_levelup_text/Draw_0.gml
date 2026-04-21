draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_set_font(fnt_score);
draw_set_color(c_aqua);
draw_set_alpha(alpha);
draw_text_transformed(x, y, text, scale, scale, 0);
draw_set_alpha(1);
draw_set_halign(fa_left);
draw_set_valign(fa_top);
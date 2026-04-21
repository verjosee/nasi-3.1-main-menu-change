draw_set_halign(fa_center);
draw_set_valign(fa_middle);

draw_set_color(c_red);
draw_text_transformed(room_width/2, 180, "GAME OVER", 2, 2, 0);

draw_set_color(c_yellow);
draw_text(room_width/2, 280, "YOUR SCORE: " + string(final_score));
draw_text(room_width/2, 340, "HIGH SCORE: " + string(global.highscore));

if (level_status == "WIN") {
    draw_set_color(c_lime);
    draw_text(room_width/2, 420, "LEVEL COMPLETE!");
} else {
    draw_set_color(c_orange);
    draw_text(room_width/2, 420, "GAME OVER");
}

draw_set_color(c_white);
draw_text(room_width/2, 520, "TEKAN ENTER UNTUK KEMBALI KE MENU");

draw_set_halign(fa_left);
draw_set_valign(fa_top);
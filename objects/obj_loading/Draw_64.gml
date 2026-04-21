draw_set_halign(fa_center);
draw_set_valign(fa_middle);

// Background gelap full
draw_set_color(make_color_rgb(5, 10, 35));
draw_rectangle(0, 0, room_width, room_height, false);

// Judul game kecil di atas
draw_set_color(c_aqua);
draw_text_transformed(room_width/2, 180, "BEYOND EARTH", 2.0, 2.0, 0);

draw_set_color(c_white);
draw_text(room_width/2, 240, "GOOD GUARDIAN");

// Loading Text Besar
draw_set_color(c_yellow);
draw_text_transformed(room_width/2, room_height/2 - 30, loading_text, 1.6, 1.6, 0);

// Please wait
draw_set_color(c_ltgray);
draw_text(room_width/2, room_height/2 + 40, "PLEASE WAIT...");

draw_set_halign(fa_left);
draw_set_valign(fa_top);
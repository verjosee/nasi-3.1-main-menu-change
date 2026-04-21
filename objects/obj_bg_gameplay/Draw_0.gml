/// DRAW EVENT

// Gradien background
for (var i = 0; i <= room_height; i += 4) {
    var t = i / room_height;
    draw_set_color(make_color_rgb(10 + t*30, 20, 50 + t*30));
    draw_rectangle(0, i, room_width, i+4, false);
}

// Bintang
draw_set_color(c_white);
for (var i = 0; i < 150; i++) {
    draw_set_alpha(bintang_alpha[i]);
    draw_point(bintang_x[i], bintang_y[i]);
}
draw_set_alpha(1);


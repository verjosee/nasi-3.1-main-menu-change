/// DRAW EVENT - Menu utama

// ========================
// 1. PERSIAPAN
// ========================
draw_set_alpha(1);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);

// ========================
// 2. BACKGROUND GRADIEN
// ========================
for (var i = 0; i <= room_height; i += 4) {
    var t = i / room_height;
    var r = 10 + (t * 30);
    var g = 20;
    var b = 50 + (t * 30);
    draw_set_color(make_color_rgb(r, g, b));
    draw_rectangle(0, i, room_width, i+4, false);
}

// ========================
// 3. BINTANG LATAR
// ========================
draw_set_color(c_white);
for (var i = 0; i < 200; i++) {
    draw_set_alpha(bintang_alpha[i]);
    draw_point(bintang_x[i], bintang_y[i]);
    
    if (i mod 20 == 0) {
        draw_set_alpha(bintang_alpha[i] * 0.7);
        draw_rectangle(bintang_x[i]-1, bintang_y[i]-1, bintang_x[i]+1, bintang_y[i]+1, false);
    }
}
draw_set_alpha(1);

// ========================
// 3.5 EFEK PARTIKEL
// ========================
draw_set_color(c_aqua);
draw_set_alpha(0.3);
for (var i = 0; i < 50; i++) {
    var px = room_width/2 + sin(current_time * 0.002 + i) * 200;
    var py = 400 + cos(current_time * 0.003 + i) * 50;
    draw_circle(px, py, 2, false);
}
draw_set_alpha(1);

// ========================
// 4. JUDUL UTAMA
// ========================
var title = "BEYOND EARTH";

draw_set_color(c_black);
draw_set_alpha(0.5);
draw_text_transformed(room_width/2 + 5, 165, title, 2.2, 2.2, 0);

draw_set_alpha(1);
draw_set_color(c_aqua);
draw_text_transformed(room_width/2, 160, title, 2.2, 2.2, 0);

// ========================
// 5. SUB JUDUL
// ========================
draw_set_color(c_white);
draw_set_alpha(0.9);
draw_text(room_width/2, 240, "GOOD GUARDIAN");

draw_set_color(c_yellow);
draw_set_alpha(0.5);
draw_line(room_width/2 - 80, 255, room_width/2 + 80, 255);



// ========================
// 8. RESET
// ========================
draw_set_alpha(1);
draw_set_color(c_white);
draw_set_halign(fa_left);
draw_set_valign(fa_top);
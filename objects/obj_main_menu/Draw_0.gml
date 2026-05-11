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
var particle_offset = 30;
var time = current_time * 0.002;

for (var i = 0; i < 80; i++) { // Tambah jumlah partikel
    // Posisi dengan gerakan halus
    var px = room_width/2 + sin(time + i) * 200 + cos(time * 0.6 + i) * 50 + particle_offset;
    var py = room_height/2 + cos(time * 0.8 + i) * 90 + sin(time * 1.2 + i) * 40;
    
    // Ukuran partikel lebih besar (5-8 pixel)
    var size = 2 + sin(time * 2 + i) * 1.5;
    
    // Alpha lebih tebal (0.4 - 0.7)
    draw_set_alpha(0.20 + sin(time * 2.5 + i) * 0.15);
    
    // Gambar partikel dengan fill (biar tebal)
    draw_circle(px, py, size, true);
    
    // Tambah outline biar makin tegas
    draw_set_alpha(0.7);
    draw_circle(px, py, size + 1, false);
}

draw_set_alpha(1);

// ========================
// 4. JUDUL UTAMA
// ========================
var title = " ";
var title_offset = 30; // Geser ke kanan

draw_set_font(fnt_main);
draw_set_color(c_black);
draw_set_alpha(0.5);
draw_text_transformed(room_width/2 + 5 + title_offset, 165, title, 2, 2, 0);

draw_set_alpha(1);
draw_set_color(c_aqua);
draw_text_transformed(room_width/2 + title_offset, 160, title, 2, 2, 0);

// ========================
// 5. SUB JUDUL
// ========================
draw_set_font(font_default);
draw_set_color(c_white);
draw_set_alpha(0.9);
draw_text(room_width/2 + title_offset, 300, "GOOD GUARDIAN");




// ========================
// 8. RESET
// ========================
draw_set_alpha(1);
draw_set_color(c_white);
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_font(-1);
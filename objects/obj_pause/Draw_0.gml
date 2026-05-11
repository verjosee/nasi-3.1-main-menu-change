/// DRAW GUI EVENT

if (paused == false) exit;
draw_set_font(font_default);

// ========================
// 1. BACKGROUND GRADIEN (sama seperti main menu)
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
// 2. BINTANG LATAR
// ========================
draw_set_color(c_white);
for (var i = 0; i < 150; i++) {
    draw_set_alpha(bintang_alpha[i]);
    draw_point(bintang_x[i], bintang_y[i]);
    
    // Bintang besar sesekali
    if (i mod 20 == 0) {
        draw_set_alpha(bintang_alpha[i] * 0.7);
        draw_rectangle(bintang_x[i]-1, bintang_y[i]-1, bintang_x[i]+1, bintang_y[i]+1, false);
    }
}
draw_set_alpha(1);

// ========================
// 3. OVERLAY GELAP (biar teks mudah dibaca)
// ========================
draw_set_color(c_black);
draw_set_alpha(fade_alpha * 0.7);
draw_rectangle(0, 0, room_width, room_height, false);
draw_set_alpha(1);

// ========================
// 4. MENU PAUSE
// ========================
draw_set_font(font_default);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);

if (menu_page == "pause") {
    // ===== JUDUL DENGAN EFEK NEON =====
draw_set_font(fnt_main);
// Bayangan
draw_set_color(c_black);
draw_set_alpha(0.6);
draw_text_transformed(room_width/2 + 5, 155, "PAUSED", 2.2, 2.2, 0);

// Teks utama
draw_set_alpha(1);
draw_set_color(c_aqua);
draw_text_transformed(room_width/2, 150, "PAUSED", 2.2, 2.2, 0);

draw_set_font(font_default);
    // Garis bawah neon
    draw_set_color(c_white);
    draw_set_alpha(0.7);
    draw_line(room_width/2 - 100, 180, room_width/2 + 100, 180);
    draw_set_alpha(1);
    
    // ===== MENU OPTIONS =====
    var menu_y_start = 400;
    var menu_spacing = 80;
    
    // Resume
    if (selected == 0) {
        draw_set_color(c_yellow);
        draw_text_transformed(room_width/2, menu_y_start, "> RESUME <", 1.15, 1.15, 0);
    } else {
        draw_set_color(c_white);
        draw_set_alpha(0.8);
        draw_text(room_width/2, menu_y_start, "RESUME");
    }
    
    // Settings
    if (selected == 1) {
        draw_set_color(c_yellow);
        draw_text_transformed(room_width/2, menu_y_start + menu_spacing, "> SETTINGS <", 1.15, 1.15, 0);
    } else {
        draw_set_color(c_white);
        draw_set_alpha(0.8);
        draw_text(room_width/2, menu_y_start + menu_spacing, "SETTINGS");
    }
    
    // Restart
    if (selected == 2) {
        draw_set_color(c_yellow);
        draw_text_transformed(room_width/2, menu_y_start + menu_spacing * 2, "> RESTART <", 1.15, 1.15, 0);
    } else {
        draw_set_color(c_white);
        draw_set_alpha(0.8);
        draw_text(room_width/2, menu_y_start + menu_spacing * 2, "RESTART");
    }
    
    // Quit
    if (selected == 3) {
        draw_set_color(c_yellow);
        draw_text_transformed(room_width/2, menu_y_start + menu_spacing * 3, "> QUIT <", 1.15, 1.15, 0);
    } else {
        draw_set_color(c_white);
        draw_set_alpha(0.8);
        draw_text(room_width/2, menu_y_start + menu_spacing * 3, "QUIT");
    }
    

}

// ========================
// 6. RESET
// ========================
draw_set_alpha(1);
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_font(-1);
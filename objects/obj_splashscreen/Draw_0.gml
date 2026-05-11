/// DRAW EVENT

draw_set_halign(fa_center);
draw_set_valign(fa_middle);

// ========================
// 1. BACKGROUND HITAM
// ========================
draw_set_color(c_black);
draw_rectangle(0, 0, room_width, room_height, false);

// ========================
// 2. TAMPILKAN LOGO (HANYA SAAT FADE_IN, HOLD, FADE_OUT)
// ========================
if (fade_state != "wait") {
    var center_x = room_width / 2;
    var center_y = room_height / 2;
    
    // Hitung alpha untuk sprite (semakin kecil fade_alpha, semakin jelas)
    var sprite_alpha_value = 1 - fade_alpha;
    draw_set_alpha(sprite_alpha_value);
    
    // Gambar sprite di tengah
    if (sprite_exists(spr_splashscreen)) {
        draw_sprite_ext(spr_splashscreen, 0, center_x, center_y, 
                         sprite_scale, sprite_scale, 0, c_white, 1);
    } else {
        // Kalau ga ada sprite, tampilkan teks
        draw_set_font(fnt_main);
        draw_set_color(c_white);
        draw_text_transformed(center_x, center_y, "YOUR GAME", 2, 2, 0);
        draw_set_font(font_default);
    }
}

// ========================
// 3. OVERLAY FADE (HITAM)
// ========================
draw_set_alpha(fade_alpha);
draw_set_color(c_black);
draw_rectangle(0, 0, room_width, room_height, false);


// ========================
// RESET
// ========================
draw_set_alpha(1);
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_font(-1);
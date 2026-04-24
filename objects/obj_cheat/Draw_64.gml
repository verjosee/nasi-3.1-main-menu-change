/// DRAW GUI - obj_cheat
// Menampilkan indikator jika Debug Mode aktif

if (global.debug_mode || debug_mode) {
    draw_set_font(fnt_score);
    draw_set_halign(fa_center);
    draw_set_valign(fa_top);
    
    // Background kecil untuk teks debug
    draw_set_alpha(0.5);
    draw_set_color(c_black);
    draw_rectangle(room_width/2 - 150, 0, room_width/2 + 150, 40, false);
    
    // Teks indikator
    draw_set_alpha(1);
    draw_set_color(c_lime);
    var mode_text = debug_mode ? "GM DEBUG ACTIVE" : "CHEAT MODE ACTIVE";
    draw_text_transformed(room_width/2, 5, mode_text + " (Press 1-5, 0)", 0.6, 0.6, 0);
}

// Reset
draw_set_halign(fa_left);
draw_set_color(c_white);
draw_set_alpha(1);

// Gambar roket normal
draw_self();

// === VISUAL SHIELD ROKET ===
if (shield_active) {
    var sx = x + 60;
    var sy = y + 90;
    
    // Glow luar
    draw_set_alpha(0.28);
    draw_set_color(c_aqua);
    draw_circle(sx, sy, 68, false);
    
    // Glow tengah
    draw_set_alpha(0.50);
    draw_circle(sx, sy, 55, false);
    
    // Lingkaran utama perisai (transparan sedang)
    draw_set_alpha(0.65);
    draw_set_color(c_aqua);
    draw_circle(sx, sy, 48, true);
    
    draw_set_alpha(1);
}

// Gambar roket normal
draw_self();

// === AURA KUNING FAST UP (VERSI TIPIS & ELEGANT) ===
if (fastup_active) {
    var sx = x + 60;
    var sy = y + 90;
    
    // Aura luar yang sangat tipis
    draw_set_alpha(0.18);
    draw_set_color(make_color_rgb(255, 245, 130));
    draw_circle(sx, sy, 70, false);
    
    // Aura tengah (sedang)
    draw_set_alpha(0.35);
    draw_set_color(make_color_rgb(255, 230, 90));
    draw_circle(sx, sy, 56, false);
    
    // Aura dalam yang berkedip ringan
    draw_set_alpha(0.55 + 0.25 * sin(current_time / 90));
    draw_set_color(make_color_rgb(255, 255, 160));
    draw_circle(sx, sy, 46, false);
    
    // Lingkaran tipis energi di pinggir (hanya outline)
    draw_set_alpha(0.45);
    draw_set_color(c_yellow);
    draw_circle(sx, sy, 52, true);
    
    draw_set_alpha(1);
}


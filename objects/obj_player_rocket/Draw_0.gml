// ========================
// DEATH EXPLOSION PARTICLES
// ========================
if (is_exploding) {
    // Screen shake offset
    var shake_x = random_range(-explosion_shake, explosion_shake);
    var shake_y = random_range(-explosion_shake, explosion_shake);
    
    // Draw explosion particles (behind flash)
    for (var i = 0; i < array_length(explosion_particles); i++) {
        var p = explosion_particles[i];
        var alpha = p.life / p.max_life;
        var psize = p.size * alpha;
        
        draw_set_color(p.color);
        draw_set_alpha(alpha);
        draw_circle(p.px + shake_x, p.py + shake_y, psize, false);
    }
    
    // Draw smoke ring
    draw_set_color(c_gray);
    draw_set_alpha((explosion_timer / 90) * 0.4);
    var smoke_size = (90 - explosion_timer) * 2;
    draw_circle(x + 60 + shake_x, y + 80 + shake_y, smoke_size, true);
    
    // Draw central bright flash
    draw_set_color(c_white);
    draw_set_alpha((explosion_timer / 90) * 0.9);
    draw_circle(x + 60 + shake_x, y + 80 + shake_y, 40 + (90 - explosion_timer) * 0.8, false);
    
    // Draw fire core
    draw_set_color(c_orange);
    draw_set_alpha((explosion_timer / 90) * 0.7);
    draw_circle(x + 60 + shake_x, y + 80 + shake_y, 25 + (90 - explosion_timer) * 0.3, false);
    
    draw_set_alpha(1);
    
    // Skip drawing rocket and shield during explosion
    exit;
}

// Gambar roket normal (only when not exploding)
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


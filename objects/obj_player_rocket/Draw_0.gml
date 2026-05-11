// ========================
// DEATH EXPLOSION PARTICLES
// ========================
if (is_exploding && !global.paused) {
    var shake_intensity = explosion_shake * (explosion_timer / 120);
    var shake_x = random_range(-shake_intensity, shake_intensity);
    var shake_y = random_range(-shake_intensity, shake_intensity);
    
    for (var i = 0; i < array_length(explosion_particles); i++) {
        var p = explosion_particles[i];
        p.px += p.vx;
        p.py += p.vy;
        p.life -= 1;
        p.vy += 0.3;
        
        var alpha = clamp(p.life / p.max_life, 0, 1);
        var psize = p.size * alpha;
        
        var particle_color = p.color;
        if (alpha < 0.3) particle_color = c_gray;
        
        draw_set_color(particle_color);
        draw_set_alpha(alpha * 0.9);
        draw_circle(p.px + shake_x, p.py + shake_y, psize, false);
    }
    
    var progress = explosion_timer / 120;
    var inv_progress = 1 - progress;
    
    draw_set_color(c_gray);
    draw_set_alpha(inv_progress * 0.5);
    draw_circle(x + shake_x, y + shake_y, 40 + (120 - explosion_timer) * 3, false);
    
    draw_set_color(c_white);
    draw_set_alpha(inv_progress * inv_progress * 0.95);
    draw_circle(x + shake_x, y + shake_y, 50 + (120 - explosion_timer) * 1.5, false);
    
    draw_set_color(c_orange);
    draw_set_alpha(power(inv_progress, 1.5) * 0.85);
    draw_circle(x + shake_x, y + shake_y, 35 + (120 - explosion_timer), false);
    
    draw_set_color(c_red);
    draw_set_alpha(inv_progress * 0.9 * (0.7 + random_range(0, 0.6)));
    draw_circle(x + shake_x, y + shake_y, 20 + (120 - explosion_timer) * 0.5, false);
    
    draw_set_color(c_yellow);
    draw_set_alpha(inv_progress * 0.8);
    for (var s = 0; s < 12; s++) {
        var angle = random_range(0, 360);
        var dist = random_range(30, 30 + (120 - explosion_timer) * 2);
        var sx = x + lengthdir_x(dist, angle) + shake_x;
        var sy = y + lengthdir_y(dist, angle) + shake_y;
        draw_circle(sx, sy, random_range(2, 5), false);
    }
    
    draw_set_alpha(1);
    exit;
}

// ========================
// GAMBAR ROKET (PERTAMA, PASTI KELIHATAN)
// ========================
draw_self();

// ========================
// SHIELD (TIPIS, HANYA GARIS LUAR)
// ========================
if (shield_active) {
    var sx = x - 10;
    var sy = y + 0;
    var pulse = 0.7 + 0.1 * sin(current_time / 120);
    
    // Hanya outline, tidak diisi
    draw_set_alpha(0.35 * pulse);
    draw_set_color(c_aqua);
    draw_circle(sx, sy, 58, false);  // Hanya garis tepi
    
    // Inner glow tipis
    draw_set_alpha(0.12);
    draw_set_color(c_blue);
    draw_circle(sx, sy, 50, false);
    
    draw_set_alpha(1);
}

// ========================
// FASTUP (TIPIS, HANYA AURA)
// ========================
if (fastup_active) {
    var sx = x - 10;
    var sy = y + 0;
    var beat = 0.7 + 0.15 * sin(current_time / 60);
    
    // Aura luar tipis
    draw_set_alpha(0.1 * beat);
    draw_set_color(make_color_rgb(255, 230, 80));
    draw_circle(sx, sy, 68, false);
    
    // Aura dalam tipis
    draw_set_alpha(0.18 * beat);
    draw_set_color(make_color_rgb(255, 200, 50));
    draw_circle(sx, sy, 54, false);
    
    // Lingkaran energi kecil (tidak nutupin roket)
    draw_set_alpha(0.4);
    draw_set_color(c_yellow);
    var ring_angle = current_time / 50;
    for (var a = 0; a < 360; a += 60) {
        var angle = a + ring_angle;
        var rx = sx + lengthdir_x(62, angle);
        var ry = sy + lengthdir_y(62, angle);
        draw_circle(rx, ry, 2, false);  // Kecil!
    }
    
    draw_set_alpha(1);
}

// ========================
// RESET
// ========================
draw_set_alpha(1);
draw_set_color(c_white);
// ========================
// DEATH EXPLOSION ANIMATION
// ========================
if (is_exploding) {
    explosion_timer -= 1;
    
    // Update explosion particles
    for (var i = array_length(explosion_particles) - 1; i >= 0; i--) {
        var p = explosion_particles[i];
        p.px += p.vx;
        p.py += p.vy;
        p.vx *= 0.96;
        p.vy *= 0.96;
        p.life -= 1;
        
        if (p.life <= 0) {
            array_delete(explosion_particles, i, 1);
        }
    }
    
    // Screen shake decreases over time
    if (explosion_shake > 0) {
        explosion_shake -= 0.3;
    }
    
    // When timer ends, wait for all particles to fade before game over
    if (explosion_timer <= 0) {
        explosion_timer = 0;
        explosion_shake = max(0, explosion_shake - 1);
        
        // Only trigger game over when particles are gone
        if (array_length(explosion_particles) <= 0 && explosion_shake <= 0) {
            global.level_time_left = -2;
            instance_destroy();
            exit;
        }
    }
    
    // Skip normal movement/shooting while exploding
    exit;
}

// ========================
// ENTRANCE ANIMATION (rocket slides in from left)
// ========================
if (entrance_active) {
    x += entrance_speed;
    
    // Create trail during entrance
    trail_timer += 1;
    if (trail_timer >= 2) {
        var trail_x = x - 45;
        var trail_y = y + 74;
        instance_create_layer(trail_x, trail_y, "Instances", obj_trail);
        trail_timer = 0;
    }
    
    // Stop entrance when reaching target
    if (x >= entrance_target_x) {
        x = entrance_target_x;
        entrance_active = false;
        trail_timer = 0; // Reset for clean transition
    }
    
    // Skip normal controls during entrance
    exit;
}

// ========================
// 1. GERAKAN ROKET
// ========================
var move_speed = 6;
if (keyboard_check(vk_up) || keyboard_check(ord("W"))) y -= move_speed;
if (keyboard_check(vk_down) || keyboard_check(ord("S"))) y += move_speed;
if (keyboard_check(vk_left) || keyboard_check(ord("A"))) x -= move_speed;
if (keyboard_check(vk_right)|| keyboard_check(ord("D"))) x += move_speed;

x = clamp(x, -10, room_width - 160);
y = clamp(y, -50, room_height - 130);

// ========================
// 2. COOLDOWN TEMBAK
// ========================
if (shoot_cooldown > 0) shoot_cooldown -= 1;

if ((keyboard_check(vk_space) || mouse_check_button(mb_left)) && shoot_cooldown <= 0) {
    var bullet_x = x + 85;
    var bullet_y = y + 83;
   
    instance_create_layer(bullet_x, bullet_y, "Instances", obj_bullet);
    audio_play_sound(shoot, 1, false);
   
    if (fastup_active) {
        shoot_cooldown = 6;
    } else {
        shoot_cooldown = shoot_delay;
    }
}

// ========================
// 3. INVINCIBILITY & KEDIP
// ========================
if (invincible) {
    invincible_timer -= 1;
    if (invincible_timer > 0) {
        image_alpha = 0.4 + 0.6 * sin(current_time * 0.1);
    } else {
        invincible = false;
        image_alpha = 1;
    }
} else {
    if (global.lives < 3) {
        image_alpha = 0.6 + 0.4 * sin(current_time * 0.08);
    } else {
        image_alpha = 1;
    }
}

// ========================
// 4. ROCKET TRAIL
// ========================
trail_timer += 1;
if (trail_timer >= 3) {
    var trail_x = x - 45;
    var trail_y = y + 74;
    instance_create_layer(trail_x, trail_y, "Instances", obj_trail);
    trail_timer = 0;
}
// ========================
// 5. TIMERS & SPAWN WINGMAN
// ========================
if (shield_timer > 0) {
    shield_timer -= 1;
    if (shield_timer <= 0) shield_active = false;
}

if (fastup_timer > 0) {
    fastup_timer -= 1;
    if (fastup_timer <= 0) {
        fastup_active = false;
        shoot_delay = normal_shoot_delay;
    }
}

if (wingman_timer > 0) {
    wingman_timer -= 1;
    if (wingman_timer <= 0) {
        wingman_active = false;
        wingman_spawned = false;
    }
}

// SPAWN WINGMAN (hanya saat power-up aktif)
if (wingman_active && !wingman_spawned) {
    var wingman_top = instance_create_layer(x, y, "Instances", obj_wingman);
    wingman_top.position = "top";
    wingman_top.orbit_angle = -90;
    
    var wingman_bottom = instance_create_layer(x, y, "Instances", obj_wingman);
    wingman_bottom.position = "bottom";
    wingman_bottom.orbit_angle = 90;
    
    wingman_spawned = true;
}

// HANCURKAN WINGMAN JIKA POWER-UP MATI (backup)
if (!wingman_active && instance_exists(obj_wingman)) {
    with (obj_wingman) {
        instance_destroy();
    }
    wingman_spawned = false;
}

// ========================
// 5.5. SPAWN WINGMAN (SAAT POWER-UP AKTIF)
// ========================
if (wingman_active && !wingman_spawned) {
    // Spawn wingman atas
    var wingman_top = instance_create_layer(x, y, "Instances", obj_wingman);
    wingman_top.position = "top";
    wingman_top.orbit_angle = -90;
    
    // Spawn wingman bawah
    var wingman_bottom = instance_create_layer(x, y, "Instances", obj_wingman);
    wingman_bottom.position = "bottom";
    wingman_bottom.orbit_angle = 90;
    
    wingman_spawned = true;
}

// Hancurkan wingman jika power-up tidak aktif
if (!wingman_active && instance_exists(obj_wingman)) {
    with (obj_wingman) {
        instance_destroy();
    }
    wingman_spawned = false;
}

// ========================
// 6. LEVEL MANAGER
// ========================
if (room == room1) {
    with (obj_level_manager) {
        countdown_active = true;
        wave_active = true;
    }
}

// ========================
// 7. TOGGLE FULLSCREEN (F11)
// ========================
if (keyboard_check_pressed(vk_f11)) {
    window_set_fullscreen(!window_get_fullscreen());
}
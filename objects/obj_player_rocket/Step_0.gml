// ========================
// DEATH EXPLOSION ANIMATION
// ========================
if (is_exploding && !global.paused) {
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
        var trail_x = x - sprite_get_xoffset(sprite_index) - 7;
        var trail_y = y + (sprite_get_height(sprite_index) - sprite_get_yoffset(sprite_index)) + 2;
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

// 1. Movement
var move_speed = 6;
if (keyboard_check(vk_up) || keyboard_check(ord("W"))) y -= move_speed;
if (keyboard_check(vk_down) || keyboard_check(ord("S"))) y += move_speed;
if (keyboard_check(vk_left) || keyboard_check(ord("A"))) x -= move_speed;
if (keyboard_check(vk_right) || keyboard_check(ord("D"))) x += move_speed;
x = clamp(x, -10, room_width - 160);
y = clamp(y, -50, room_height - 130);

// 2. Shooting
if (shoot_cooldown > 0) shoot_cooldown -= 1;
if ((keyboard_check(vk_space) || mouse_check_button(mb_left)) && shoot_cooldown <= 0) {
    instance_create_layer(x + 0, y - 7, "Instances", obj_bullet);
    var snd = audio_play_sound(shoot, 1, false);
    audio_sound_gain(snd, variable_global_exists("sfx_volume") ? global.sfx_volume : 0.8);
    shoot_cooldown = fastup_active ? 6 : shoot_delay;
}

// 3. Invincibility blink
if (invincible) {
    invincible_timer -= 1;
    if (invincible_timer > 0) {
        image_alpha = 0.3 + 0.4 * (sin(current_time * 0.15) > 0);
    } else {
        invincible = false;
        image_alpha = 1;
    }
} else {
    image_alpha = 1;
}

// 4. Trail
trail_timer += 1;
if (trail_timer >= 3) {
    instance_create_layer(x - 45, y + 74, "Instances", obj_trail);
    trail_timer = 0;
}

// 5. Power-up timers
if (shield_timer > 0) { shield_timer -= 1; if (shield_timer <= 0) shield_active = false; }
if (fastup_timer > 0) { fastup_timer -= 1; if (fastup_timer <= 0) { fastup_active = false; shoot_delay = normal_shoot_delay; } }
if (wingman_timer > 0) { wingman_timer -= 1; if (wingman_timer <= 0) { wingman_active = false; wingman_spawned = false; } }

// 6. Wingman spawn/despawn
if (wingman_active && !wingman_spawned) {
    var wm1 = instance_create_layer(x, y, "Instances", obj_wingman); wm1.position = "top"; wm1.orbit_angle = -90;
    var wm2 = instance_create_layer(x, y, "Instances", obj_wingman); wm2.position = "bottom"; wm2.orbit_angle = 90;
    wingman_spawned = true;
}
if (!wingman_active && instance_exists(obj_wingman)) { with (obj_wingman) instance_destroy(); wingman_spawned = false; }

// 7. Fullscreen
if (keyboard_check_pressed(vk_f11)) window_set_fullscreen(!window_get_fullscreen());
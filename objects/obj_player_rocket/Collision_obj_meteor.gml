/// COLLISION EVENT - obj_player_rocket collides with obj_meteor

if (!invincible && !shield_active) {
    global.lives -= 1;
    
    // Clamp lives to 0
    if (global.lives < 0) global.lives = 0;
    
    invincible = true;
    invincible_timer = 120;  // 2 detik invincibility
    
    // Efek visual kedip
    image_alpha = 0.5;
    
    show_debug_message("COLLISION! Lives left: " + string(global.lives));
    
    if (global.lives <= 0) {
        show_debug_message("GAME OVER - OUT OF LIVES - EXPLOSION START");
        
        // Trigger explosion animation
        is_exploding = true;
        explosion_timer = 120; // 2 seconds animation
        explosion_shake = 25;
        
        // Play explosion sound
        if (audio_exists(explode)) {
            audio_play_sound(explode, 1, false);
        }
        
        // Create explosion particles (more and larger)
        for (var i = 0; i < 50; i++) {
            array_push(explosion_particles, {
                px: x + 60 + random_range(-40, 40),
                py: y + 80 + random_range(-40, 40),
                vx: random_range(-8, 8),
                vy: random_range(-8, 8),
                life: random_range(40, 120),
                max_life: 0,
                size: random_range(5, 18),
                color: choose(c_orange, c_red, c_yellow, c_white, c_ltgray)
            });
            explosion_particles[i].max_life = explosion_particles[i].life;
        }
        
        // Destroy all meteors
        with (obj_meteor) instance_destroy();
        with (obj_meteor_variety) instance_destroy();
        
        // Destroy wingman
        with (obj_wingman) instance_destroy();
        
        // Stop level manager from spawning
        if (instance_exists(obj_level_manager)) {
            with (obj_level_manager) {
                wave_active = false;
            }
        }
        
        // Signal LOSE condition will be set after animation
        global.level_time_left = -3; // Special value: exploding
    }
} else if (shield_active || invincible) {
    // Shield or invincibility protects player - meteor destroyed but shield remains
    show_debug_message("Shield/Invincibility protected player!");
}

// Destroy the meteor
with (other) {
    instance_destroy();
}

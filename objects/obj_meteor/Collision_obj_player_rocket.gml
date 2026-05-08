// Meteor nabrak player
if (!obj_player_rocket.invincible && !obj_player_rocket.shield_active) {
    
    instance_destroy();                    // hancurkan meteor
    
    global.lives -= 1;
    
    // Efek ledakan
    effect_create_above(ef_explosion, obj_player_rocket.x, obj_player_rocket.y, 2, c_red);
    
    // Cek nyawa
    if (global.lives > 0) {
        // Masih hidup → kebal sementara
        obj_player_rocket.invincible = true;
        obj_player_rocket.invincible_timer = 60;
        obj_player_rocket.image_alpha = 0.4;
    } 
    else {
        // Nyawa habis → trigger explosion animation on player
        // Don't go to gameover here - let obj_player_rocket handle it
        audio_stop_all(); // Stop background music
        
        // Start explosion on player
        with (obj_player_rocket) {
            is_exploding = true;
            explosion_timer = 120;
            explosion_shake = 25;
            
            // Create explosion particles
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
            
            // Signal explosion state
            global.level_time_left = -3;
        }
    }
} else if (obj_player_rocket.shield_active || obj_player_rocket.invincible) {
    // Shield or invincibility protects player - meteor destroyed but shield remains
    instance_destroy();                    // hancurkan meteor
    effect_create_above(ef_explosion, obj_player_rocket.x, obj_player_rocket.y, 2, c_blue);
}
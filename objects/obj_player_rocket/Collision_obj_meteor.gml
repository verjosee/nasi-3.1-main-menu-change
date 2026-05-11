if (!invincible && !shield_active) {
    global.lives -= 1;
    if (global.lives < 0) global.lives = 0;
    invincible = true;
    invincible_timer = 120;
    image_alpha = 0.5;
    
    if (global.lives <= 0) {
        is_exploding = true;
        explosion_timer = 120;
        explosion_shake = 25;
        if (audio_exists(explode)) {
            var snd = audio_play_sound(explode, 1, false);
            audio_sound_gain(snd, variable_global_exists("sfx_volume") ? global.sfx_volume : 0.8);
        }
        
        for (var i = 0; i < 50; i++) {
            array_push(explosion_particles, {
                px: x + random_range(-40, 40), py: y + random_range(-40, 40),
                vx: random_range(-8, 8), vy: random_range(-8, 8),
                life: random_range(40, 120), max_life: 0,
                size: random_range(5, 18), color: choose(c_orange, c_red, c_yellow, c_white)
            });
            explosion_particles[i].max_life = explosion_particles[i].life;
        }
        
        with (obj_meteor) instance_destroy();
        with (obj_meteor_variety) instance_destroy();
        with (obj_wingman) instance_destroy();
        if (instance_exists(obj_level_manager)) with (obj_level_manager) wave_active = false;
        global.level_time_left = -3;
    }
}
with (other) instance_destroy();

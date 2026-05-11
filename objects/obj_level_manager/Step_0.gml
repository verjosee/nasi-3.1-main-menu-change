// Start delay
if (start_delay_timer > 0) {
    start_delay_timer -= 1;
    if (start_delay_timer <= 0) wave_active = true;
    exit;
}

// Countdown
if (countdown_active && !global.paused) {
    countdown_time -= 1;
    countdown_display = ceil(countdown_time / room_speed);
    if (countdown_time <= 0) {
        countdown_active = false;
        global.level_time_left = 1; // Win
    }
}

// Wave system
if (wave_active && !global.paused) {
    wave_timer += 1;
    if (wave_timer >= wave_duration) {
        wave_timer = 0;
        wave += 1;
        if (wave > total_waves) wave_active = false;
    }
}

// Spawn meteors
if (wave_active && !global.paused) {
    enemy_spawn_timer += 1;
    if (enemy_spawn_timer >= enemy_spawn_delay) {
        enemy_spawn_timer = 0;
        for (var i = 0; i < wave; i++) {
            var m = instance_create_layer(random(room_width - 100) + 50, -50, "Instances", obj_meteor);
            m.speed = 3 + wave + global.current_level * 0.5;
            m.direction = random_range(155, 205);
        }
    }
}
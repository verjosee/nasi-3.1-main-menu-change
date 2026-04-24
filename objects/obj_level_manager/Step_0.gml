/// STEP EVENT - Level Manager

// ========== COUNTDOWN TIMER ==========
if (countdown_active && !level_complete) {
    countdown_time -= 1;
    countdown_display = ceil(countdown_time / room_speed);
    
    if (countdown_time <= 0) {
        countdown_active = false;
        level_complete = true;
    }
}

// ========== LEVEL SELESAI ==========
if (level_complete) {
    level_complete = false;
    
    // Tandai level sebagai completed
    if (!variable_global_exists("level_completed")) {
        global.level_completed = array_create(10);
        for (var i = 0; i < 10; i++) global.level_completed[i] = false;
    }
    
    if (global.current_level <= 10) {
        global.level_completed[global.current_level - 1] = true;
    }
    
    show_message("LEVEL " + string(global.current_level) + " COMPLETE!");
    
    // Naikkan level
    global.current_level += 1;
    if (global.current_level > 5) global.current_level = 5;
    
    room_goto(room_level_select);
}

// ========== WAVE SYSTEM ==========
if (wave_active && !game_over) {
    wave_timer += 1;
    
    // Ganti wave setiap 30 detik
    if (wave_timer >= wave_duration) {
        wave_timer = 0;
        wave += 1;
        
        if (wave > total_waves) {
            wave_active = false;
            show_debug_message("ALL WAVES COMPLETE!");
        } else {
            show_debug_message("Wave " + string(wave) + " started!");
        }
    }
}

// ========== SPAWN METEOR ==========
if (wave_active && !game_over) {
    enemy_spawn_timer += 1;
    
    if (enemy_spawn_timer >= enemy_spawn_delay) {
        enemy_spawn_timer = 0;
        
        // Spawn meteor berdasarkan wave
        var spawn_count = wave;
        
        for (var i = 0; i < spawn_count; i++) {
            var meteor = instance_create_layer(random(room_width - 100) + 50, -50, "Instances", obj_meteor);
            
            // Kecepatan bertambah sesuai wave dan level
            meteor.speed = 3 + (wave * 1) + (global.current_level * 0.5);
            meteor.direction = random_range(155, 205);
        }
    }
}

// ========== GAME OVER ==========
if (game_over) {
    game_over = false;
    wave_active = false;
    countdown_active = false;
    
    show_message("GAME OVER!");
    room_goto(room_main_menu);
}
/// STEP EVENT - Level Manager

// ========== COUNTDOWN TIMER ==========
if (countdown_active) {
    countdown_time -= 1;
    countdown_display = ceil(countdown_time / room_speed);
    
    if (countdown_time <= 0) {
        countdown_active = false;
        // Level selesai!
        show_message("LEVEL COMPLETE!");
        room_goto(room_level_select);
    }
}

// ========== WAVE SYSTEM ==========
if (wave_active) {
    wave_timer += 1;
    
    // Ganti wave setiap 30 detik
    if (wave_timer >= wave_duration) {
        wave_timer = 0;
        wave += 1;
        
        if (wave > total_waves) {
            wave_active = false;
            show_message("ALL WAVES COMPLETE!");
        } else {
            show_debug_message("Wave " + string(wave) + " started!");
        }
    }
}

// ========== SPAWN METEOR ==========
if (wave_active) {
    enemy_spawn_timer += 1;
    
    if (enemy_spawn_timer >= enemy_spawn_delay) {
        enemy_spawn_timer = 0;
        
        // Spawn meteor berdasarkan wave
        var spawn_count = wave;  // wave 1 = 1 meteor, wave 2 = 2, wave 3 = 3
        
        for (var i = 0; i < spawn_count; i++) {
            var meteor = instance_create_layer(random(room_width - 100) + 50, -50, "Instances", obj_meteor);
            
            // Kecepatan bertambah sesuai wave
            meteor.speed_y = 3 + (wave * 1);
            meteor.speed_x = random(2) - 1;
        }
    }
}

// Inisialisasi High Score
if (!variable_global_exists("highscore")) {
    global.highscore = 0;
}

// Load high score saat game mulai
load_highscore();


// ========== START GAME (Contoh: mulai countdown saat game dimulai) ==========
// Panggil ini dari object lain, atau aktifkan manual:
// countdown_active = true;
/// CREATE EVENT - Level Manager

// ========== WAVE SYSTEM ==========
wave = 1;
total_waves = 3;
wave_active = true;
wave_timer = 0;
wave_duration = 30 * room_speed;  // 30 detik

// ========== COUNTDOWN TIMER ==========
countdown_active = true;
countdown_time = 90 * room_speed;  // 1 menit 30 detik
countdown_display = 90;

// ========== DEBUG MODE ==========
show_debug_info = true;

// ========== SPAWN ENEMY ==========
enemy_spawn_timer = 0;
enemy_spawn_delay = 30;  // spawn setiap 0.5 detik

// ========== GAME STATE ==========
game_over = false;
level_complete = false;

// ========== INISIALISASI GLOBAL ==========
if (!variable_global_exists("current_level")) {
    global.current_level = 1;
}

if (!variable_global_exists("lives")) {
    global.lives = 3;
}

// ========== INISIALISASI LEVEL COMPLETED ==========
if (!variable_global_exists("level_completed")) {
    global.level_completed = array_create(10);
    for (var i = 0; i < 10; i++) {
        global.level_completed[i] = false;
    }
}

show_debug_message("Level Manager Ready - Level: " + string(global.current_level));
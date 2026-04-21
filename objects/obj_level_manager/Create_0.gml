/// CREATE EVENT - Level Manager

// ========== WAVE SYSTEM ==========
wave = 1;
total_waves = 3;
wave_active = true;
wave_timer = 0;
wave_duration = 30 * room_speed;  // 30 detik

// ========== COUNTDOWN TIMER ==========
countdown_active = false;
countdown_time = 90 * room_speed;  // 1 menit 30 detik
countdown_display = 90;

// ========== DEBUG MODE ==========
show_debug_info = true;

// ========== SPAWN ENEMY ==========
enemy_spawn_timer = 0;
enemy_spawn_delay = 30;  // spawn setiap 0.5 detik

// ========================
// INISIALISASI GLOBAL LEVEL COMPLETED
// ========================
if (!variable_global_exists("level_completed")) {
    global.level_completed = array_create(10);  // Asumsi 10 level
    for (var i = 0; i < 10; i++) {
        global.level_completed[i] = false;
    }
    show_debug_message("global.level_completed initialized");
}
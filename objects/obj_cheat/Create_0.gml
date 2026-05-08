/// CREATE EVENT - obj_cheat

// Cegah duplikasi karena objek ini persistent
if (instance_number(obj_cheat) > 1) {
    instance_destroy();
    exit;
}

// === INISIALISASI GLOBAL VARIABLES ===

// Debug Mode
if (!variable_global_exists("debug_mode")) {
    global.debug_mode = false;
}

// Debug Unlock All
if (!variable_global_exists("debug_unlock_all")) {
    global.debug_unlock_all = false;
}

// Time Stop Active (untuk cheat time stop)
if (!variable_global_exists("time_stop_active")) {
    global.time_stop_active = false;
}

// Game Speed Multiplier (untuk slow motion)
if (!variable_global_exists("game_speed_multiplier")) {
    global.game_speed_multiplier = 1.0;
}

// === INISIALISASI LEVEL UNLOCKED ===
if (!variable_global_exists("level_unlocked")) {
    global.level_unlocked = array_create(10);
    for (var i = 0; i < 10; i++) {
        global.level_unlocked[i] = false;
    }
    global.level_unlocked[0] = true; // Level 1 terbuka
}

// === INISIALISASI VARIABEL CHEAT LAINNYA (Opsional) ===
if (!variable_global_exists("cheat_shield_used")) {
    global.cheat_shield_used = false;
}

if (!variable_global_exists("cheat_fastup_used")) {
    global.cheat_fastup_used = false;
}

if (!variable_global_exists("cheat_wingman_used")) {
    global.cheat_wingman_used = false;
}

// === PERSISTEN SIAPKAN ===
global.persistent = true;  // Pastikan cheat system persist antar room

// === DEBUG LOG ===
show_debug_message("=====================================");
show_debug_message("Cheat System Initialized");
show_debug_message("Debug Mode: " + string(global.debug_mode));
show_debug_message("Time Stop Active: " + string(global.time_stop_active));
show_debug_message("Game Speed: " + string(global.game_speed_multiplier));
show_debug_message("Total Levels Unlocked: " + string(array_length(global.level_unlocked)));
show_debug_message("=====================================");
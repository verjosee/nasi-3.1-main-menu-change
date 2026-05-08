// Jika player kalah, langsung pindah ke gameover (jangan proses timer lagi)
// -3 = explosion animation playing, wait for it to finish
// -2 = animation done, go to gameover
if (global.level_time_left == -3) {
    // Wait for explosion animation to finish
    exit;
}

if (global.level_time_left <= -2) {
    show_debug_message("=== LEVEL " + string(global.current_level) + " FAILED (OUT OF LIVES) ===");
    audio_stop_all(); // Stop background music
    room_persistent = false;
    room_goto(room_gameover);
    exit;
}

// ========== START DELAY ==========
// Wait for rocket entrance animation before starting countdown
if (instance_exists(obj_player_rocket)) {
    var rocket = instance_find(obj_player_rocket, 0);
    if (rocket.entrance_active) {
        exit; // Don't start countdown yet
    }
}

// Kurangi waktu level
global.level_time_left -= 1;

// Kurangi wave timer
wave_timer -= 1;

// Ganti wave setiap 30 detik (3 waves total dalam 90 detik)
if (wave_timer <= 0 && global.current_wave < 3) {
    global.current_wave += 1;
    wave_timer = global.wave_duration;
    
    show_debug_message("WAVE " + string(global.current_wave) + " STARTED!");
}

// CHECK GAME OVER CONDITIONS
// Condition 1: TIME'S UP (player survived 90 seconds) = WIN
if (global.level_time_left <= 0 && global.level_time_left > -1) {
    global.level_time_left = 1; // Set to 1 agar obj_gameover tahu ini WIN
    
    show_debug_message("=== LEVEL " + string(global.current_level) + " COMPLETED (TIME UP) ===" );
    
    // Unlock next level jika ada
    if (global.current_level < 10) {
        global.level_unlocked[global.current_level] = true;
        save_level_progress();
    }
    
    room_persistent = false;
    audio_stop_all(); // Stop background music
    room_goto(room_gameover);
}

// Lose condition ditangani di awal Step untuk mencegah race condition.
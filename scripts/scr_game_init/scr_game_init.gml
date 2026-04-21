/// scr_game_init()
/// Inisialisasi utama game: fullscreen, global variables, sound settings

function init_game_settings() {
    /// Set up fullscreen dan window properties
    
    // Enable fullscreen mode
    window_set_fullscreen(true);
    
    // Set window title
    window_set_caption("NASI 3.1 - Asteroid Shooter");
    
    show_debug_message("Game initialized: Fullscreen enabled");
}

function init_global_variables() {
    /// Initialize semua global variables yang diperlukan
    
    // Game time tracker
    if (!variable_global_exists("game_time")) {
        global.game_time = 0;
    }
    
    // Score system
    if (!variable_global_exists("score")) {
        global.score = 0;
    }
    
    if (!variable_global_exists("highscore")) {
        global.highscore = 0;
    }
    
    // Level system
    if (!variable_global_exists("current_level")) {
        global.current_level = 1;
    }
    
    if (!variable_global_exists("level_unlocked")) {
        global.level_unlocked = array_create(10);
        global.level_unlocked[0] = true;   // Level 1 always unlocked
        for (var i = 1; i < 10; i++) {
            global.level_unlocked[i] = false;
        }
    }
    
    if (!variable_global_exists("level_completed")) {
        global.level_completed = array_create(10);
        for (var i = 0; i < 10; i++) {
            global.level_completed[i] = false;
        }
    }
    
    // Wave and time system
    if (!variable_global_exists("level_time_left")) {
        global.level_time_left = 0;
    }
    
    if (!variable_global_exists("current_wave")) {
        global.current_wave = 1;
    }
    
    if (!variable_global_exists("wave_duration")) {
        global.wave_duration = 1800;  // 30 seconds at 60 fps
    }
    
    // Lives system
    if (!variable_global_exists("lives")) {
        global.lives = 3;
    }
    
    // Difficulty system
    if (!variable_global_exists("level_difficulty")) {
        global.level_difficulty = 1.0;
    }
    
    if (!variable_global_exists("spawn_rate_base")) {
        global.spawn_rate_base = 60;
    }
    
    show_debug_message("All global variables initialized");
}

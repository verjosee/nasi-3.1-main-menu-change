/// CREATE EVENT - obj_gameover

// ========== SCORE ==========
final_score = global.score;
update_highscore_for_current_level(final_score);

// Reset score untuk game berikutnya
global.score = 0;

// ========== STATUS (WIN/LOSE) ==========
if (variable_global_exists("level_time_left") && global.level_time_left == 1) {
    level_status = "WIN";
} else {
    level_status = "LOSE";
}

// ========== ANIMASI ==========
ui_alpha = 0;
ui_timer = 0;

// ========== SAVE PROGRESS JIKA MENANG ==========
if (level_status == "WIN" && variable_global_exists("current_level")) {
    // Pastikan array level ada
    if (!variable_global_exists("level_completed")) {
        global.level_completed = array_create(10);
        for (var i = 0; i < 10; i++) global.level_completed[i] = false;
    }
    if (!variable_global_exists("level_unlocked")) {
        global.level_unlocked = array_create(10);
        for (var i = 0; i < 10; i++) global.level_unlocked[i] = false;
        global.level_unlocked[0] = true;
    }
    
    // Tandai level sebagai completed
    var idx = global.current_level - 1;
    if (idx >= 0 && idx < 10) {
        global.level_completed[idx] = true;
        
        // Unlock level berikutnya
        if (idx + 1 < 10) {
            global.level_unlocked[idx + 1] = true;
        }
    }
}

show_debug_message("Game Over - Status: " + level_status);
show_debug_message("Game Over - Final Score: " + string(final_score));
/// STEP EVENT - obj_gameover (Diperbaiki)

if (!variable_instance_exists(id, "already_saved")) {
    already_saved = true;   // agar hanya dijalankan sekali
    
    // Simpan High Score
    if (global.score > global.highscore) {
        global.highscore = global.score;
        save_highscore();
    }
    
    // Simpan Level Progress dengan safety check
    if (variable_global_exists("level_unlocked")) {
        save_level_progress();
    } else {
        show_debug_message("Warning: level_unlocked belum diinisialisasi");
    }
}
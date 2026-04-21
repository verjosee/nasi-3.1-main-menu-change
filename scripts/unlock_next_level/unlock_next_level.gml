/// unlock_next_level()
/// Script untuk membuka level berikutnya setelah menyelesaikan level saat ini

// Safety check - pastikan global variables ada
if (!variable_global_exists("current_level")) {
    show_debug_message("WARNING: global.current_level not set!");
    return; // Hentikan script jika tidak ada
}

if (!variable_global_exists("level_unlocked")) {
    show_debug_message("WARNING: global.level_unlocked not set!");
    return;
}

var completed_level = global.current_level;
var next_level = completed_level; // index array mulai 0

// Pastikan next_level dalam batas yang valid (0-9 untuk 10 level)
if (next_level >= 0 && next_level < 10) {
    // Unlock level berikutnya jika belum terbuka
    if (next_level < 9 && !global.level_unlocked[next_level + 1]) {
        global.level_unlocked[next_level + 1] = true;
        
        // Simpan progress
        var file = file_text_open_write("level_progress.sav");
        for (var i = 0; i < 10; i++) {
            file_text_write_real(file, global.level_unlocked[i]);
        }
        file_text_close(file);
        
        show_debug_message("✅ Level " + string(next_level + 2) + " UNLOCKED!");
        
        // Tampilkan efek notifikasi
        effect_create_above(ef_stars, room_width/2, room_height/2, 1, c_yellow);
    } else if (next_level >= 9) {
        show_debug_message("🏆 You completed ALL levels! Congratulations!");
    }
} else {
    show_debug_message("ERROR: Invalid level number: " + string(completed_level));
}
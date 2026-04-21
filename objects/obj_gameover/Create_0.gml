/// CREATE EVENT - obj_gameover

final_score = global.score;

// Simpan High Score jika lebih tinggi
if (global.score > global.highscore) {
    global.highscore = global.score;
    save_highscore();
}

// RESET SCORE
global.score = 0;

// INISIALISASI level_status (ini yang hilang)
level_status = "LOSE";     // default adalah LOSE

show_debug_message("Game Over - Final Score: " + string(final_score));
show_debug_message("High Score: " + string(global.highscore));
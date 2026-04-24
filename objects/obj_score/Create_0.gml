// Inisialisasi Score & High Score
if (!variable_global_exists("score")) global.score = 0;
if (!variable_global_exists("highscore")) global.highscore = 0;

// Load High Score dari JSON
load_highscore();
sync_current_level_highscore();

global.score = 0;                    // Reset score setiap kali mulai game
// load_highscore() tetap ada di sini


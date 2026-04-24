/// STEP EVENT - obj_score
// Update highscore real-time jika skor saat ini melampaui highscore
if (global.score > global.highscore) {
    global.highscore = global.score;
    
    // Opsional: Beri efek suara atau visual saat pecah rekor (hanya sekali per game)
    if (!variable_instance_exists(id, "record_broken")) {
        record_broken = true;
        show_debug_message("NEW RECORD BROKEN!");
    }
}

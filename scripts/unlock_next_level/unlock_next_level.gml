/// unlock_next_level()
/// Unlock the next level after completing current level

function unlock_next_level() {
    if (!variable_global_exists("current_level")) {
        return false;
    }
    
    if (!variable_global_exists("level_unlocked")) {
        return false;
    }
    
    var completed_level_index = global.current_level - 1;
    var next_level_index = completed_level_index + 1;
    
    if (next_level_index < 10 && !global.level_unlocked[next_level_index]) {
        global.level_unlocked[next_level_index] = true;
        show_debug_message("Level " + string(next_level_index + 1) + " unlocked!");
        save_level_progress();
        return true;
    }
    
    return false;
}
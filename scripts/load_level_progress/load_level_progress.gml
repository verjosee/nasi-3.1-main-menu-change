/// load_level_progress()
/// Load level unlock status from file

function load_level_progress() {
    if (file_exists("level_progress.sav")) {
        var file = file_text_open_read("level_progress.sav");
        var save_data = file_text_read_string(file);
        file_text_close(file);
        
        var level_data = string_split(save_data, ",");
        
        if (!variable_global_exists("level_unlocked")) {
            global.level_unlocked = array_create(10);
        }
        
        for (var i = 0; i < array_length(level_data) && i < 10; i++) {
            global.level_unlocked[i] = (level_data[i] == "1");
        }
        
        show_debug_message("Level progress loaded");
        return true;
    }
    return false;
}

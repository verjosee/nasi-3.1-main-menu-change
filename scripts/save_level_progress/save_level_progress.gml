/// save_level_progress()
/// Save level unlock status to file

function save_level_progress() {
    if (!variable_global_exists("level_unlocked")) {
        return;
    }
    
    var save_data = "";
    for (var i = 0; i < 10; i++) {
        save_data += string(global.level_unlocked[i]);
        if (i < 9) save_data += ",";
    }
    
    var file = file_text_open_write("level_progress.sav");
    file_text_write_string(file, save_data);
    file_text_close(file);
    
    show_debug_message("Level progress saved");
}

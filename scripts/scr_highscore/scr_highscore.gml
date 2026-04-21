// Save High Score only
function save_highscore() {
    var map = ds_map_create();
    ds_map_add(map, "highscore", global.highscore);
    
    var json_str = json_encode(map);
    var file = file_text_open_write("highscore.json");
    file_text_write_string(file, json_str);
    file_text_close(file);
    
    ds_map_destroy(map);
}

// Load High Score
function load_highscore() {
    if (!file_exists("highscore.json")) {
        global.highscore = 0;
        return;
    }
    
    var file = file_text_open_read("highscore.json");
    var json_str = file_text_read_string(file);
    file_text_close(file);
    
    var map = json_decode(json_str);
    
    if (ds_map_exists(map, "highscore")) {
        global.highscore = ds_map_find_value(map, "highscore");
    } else {
        global.highscore = 0;
    }
    
    ds_map_destroy(map);
}

// Save Level Progress (unlocked levels)
function save_level_progress() {
    var map = ds_map_create();
    
    for (var i = 0; i < 10; i++) {
        ds_map_add(map, "level_" + string(i), global.level_unlocked[i]);
    }
    
    var json_str = json_encode(map);
    var file = file_text_open_write("level_progress.json");
    file_text_write_string(file, json_str);
    file_text_close(file);
    
    ds_map_destroy(map);
    show_debug_message("Level progress saved");
}

// Load Level Progress (unlocked levels)
function load_level_progress() {
    if (!file_exists("level_progress.json")) {
        // Jika file tidak ada, inisialisasi default
        global.level_unlocked[0] = true;   // Level 1 selalu unlock
        for (var i = 1; i < 10; i++) {
            global.level_unlocked[i] = false;
        }
        show_debug_message("No level progress file found, using default");
        return;
    }
    
    var file = file_text_open_read("level_progress.json");
    var json_str = file_text_read_string(file);
    file_text_close(file);
    
    var map = json_decode(json_str);
    
    for (var i = 0; i < 10; i++) {
        var key = "level_" + string(i);
        if (ds_map_exists(map, key)) {
            global.level_unlocked[i] = ds_map_find_value(map, key);
        } else {
            global.level_unlocked[i] = (i == 0); // Level 1 selalu true
        }
    }
    
    ds_map_destroy(map);
    show_debug_message("Level progress loaded");
}
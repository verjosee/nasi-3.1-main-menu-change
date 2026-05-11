function ensure_level_arrays() {
    var total_levels = 20;  // CHANGE THIS FROM 10 TO 20

    if (!variable_global_exists("level_unlocked")) {
        global.level_unlocked = array_create(total_levels, false);
    }
    if (!variable_global_exists("level_completed")) {
        global.level_completed = array_create(total_levels, false);
    }
    if (!variable_global_exists("level_highscores")) {
        global.level_highscores = array_create(total_levels, 0);  // Also 20 for highscores
    }

    if (array_length(global.level_unlocked) < total_levels) {
        var old_unlock = global.level_unlocked;
        global.level_unlocked = array_create(total_levels, false);
        for (var i = 0; i < array_length(old_unlock); i++) global.level_unlocked[i] = old_unlock[i];
    }
    if (array_length(global.level_completed) < total_levels) {
        var old_completed = global.level_completed;
        global.level_completed = array_create(total_levels, false);
        for (var j = 0; j < array_length(old_completed); j++) global.level_completed[j] = old_completed[j];
    }
    if (array_length(global.level_highscores) < total_levels) {
        var old_hs = global.level_highscores;
        global.level_highscores = array_create(total_levels, 0);
        for (var k = 0; k < array_length(old_hs); k++) global.level_highscores[k] = old_hs[k];
    }

    global.level_unlocked[0] = true;
}

function get_current_level_index() {
    if (!variable_global_exists("current_level")) return 0;
    return clamp(global.current_level - 1, 0, 19);  // CHANGE FROM 9 TO 19
}

// Save High Score per level
function save_highscore() {
    ensure_level_arrays();

    var map = ds_map_create();
    for (var i = 0; i < 20; i++) {  // CHANGE FROM 10 TO 20
        ds_map_add(map, "level_" + string(i + 1), global.level_highscores[i]);
    }

    var json_str = json_encode(map);
    var file = file_text_open_write("highscore.json");
    file_text_write_string(file, json_str);
    file_text_close(file);
    ds_map_destroy(map);
}

// Load High Score per level and sync global.highscore to current level
function load_highscore() {
    ensure_level_arrays();

    if (file_exists("highscore.json")) {
        var file = file_text_open_read("highscore.json");
        var json_str = file_text_read_string(file);
        file_text_close(file);

        var map = json_decode(json_str);
        for (var i = 0; i < 20; i++) {  // CHANGE FROM 10 TO 20
            var key = "level_" + string(i + 1);
            if (ds_map_exists(map, key)) {
                global.level_highscores[i] = max(0, ds_map_find_value(map, key));
            }
        }
        ds_map_destroy(map);
    }

    global.highscore = global.level_highscores[get_current_level_index()];
}

function sync_current_level_highscore() {
    ensure_level_arrays();
    global.highscore = global.level_highscores[get_current_level_index()];
}

function update_highscore_for_current_level(_score) {
    ensure_level_arrays();
    var level_index = get_current_level_index();
    if (_score > global.level_highscores[level_index]) {
        global.level_highscores[level_index] = _score;
        global.highscore = _score;
        save_highscore();
    } else {
        global.highscore = global.level_highscores[level_index];
    }
}

function reset_all_level_highscores() {
    ensure_level_arrays();
    for (var i = 0; i < 20; i++) global.level_highscores[i] = 0;  // CHANGE FROM 10 TO 20
    save_highscore();
    sync_current_level_highscore();
}

// Save Level Progress (unlocked + completed)
function save_level_progress() {
    ensure_level_arrays();

    var map = ds_map_create();
    for (var i = 0; i < 20; i++) {  // THIS WAS ALREADY CORRECT (20)
        ds_map_add(map, "unlock_" + string(i), global.level_unlocked[i]);
        ds_map_add(map, "complete_" + string(i), global.level_completed[i]);
    }

    var json_str = json_encode(map);
    var file = file_text_open_write("level_progress.json");
    file_text_write_string(file, json_str);
    file_text_close(file);

    ds_map_destroy(map);
}

// Load Level Progress (unlocked + completed)
function load_level_progress() {
    ensure_level_arrays();

    if (file_exists("level_progress.json")) {
        var file = file_text_open_read("level_progress.json");
        var json_str = file_text_read_string(file);
        file_text_close(file);

        var map = json_decode(json_str);
        for (var i = 0; i < 20; i++) {  // THIS WAS ALREADY CORRECT (20)
            var unlock_key = "unlock_" + string(i);
            var complete_key = "complete_" + string(i);
            if (ds_map_exists(map, unlock_key)) global.level_unlocked[i] = ds_map_find_value(map, unlock_key);
            if (ds_map_exists(map, complete_key)) global.level_completed[i] = ds_map_find_value(map, complete_key);
        }
        ds_map_destroy(map);
    }

    global.level_unlocked[0] = true;
}

function reset_level_progress() {
    ensure_level_arrays();
    for (var i = 0; i < 20; i++) {  // THIS WAS ALREADY CORRECT (20)
        global.level_unlocked[i] = (i == 0);
        global.level_completed[i] = false;
    }
    save_level_progress();
}

function unlock_all_levels_debug() {
    ensure_level_arrays();
    for (var i = 0; i < 20; i++) global.level_unlocked[i] = true;  // THIS WAS ALREADY CORRECT (20)
    save_level_progress();
}
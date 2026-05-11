// -3 = explosion playing, -2 = go to gameover
if (global.level_time_left == -3) exit;
if (global.level_time_left <= -2) {
    audio_stop_all();
    room_goto(room_gameover);
    exit;
}

// Wait for rocket entrance
if (instance_exists(obj_player_rocket) && instance_find(obj_player_rocket, 0).entrance_active) exit;

// Countdown
if (!global.paused) {
    global.level_time_left -= 1;
    wave_timer -= 1;
    if (wave_timer <= 0 && global.current_wave < 3) {
        global.current_wave += 1;
        wave_timer = global.wave_duration;
    }
}

// Win: time up
if (global.level_time_left <= 0 && global.level_time_left > -1) {
    global.level_time_left = 1; // Win flag
    if (global.current_level < 20) {
        if (array_length(global.level_unlocked) <= global.current_level) array_resize(global.level_unlocked, global.current_level + 1);
        global.level_unlocked[global.current_level] = true;
        save_level_progress();
    }
    audio_stop_all();
    room_goto(room_gameover);
}
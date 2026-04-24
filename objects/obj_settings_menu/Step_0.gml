var mx = device_mouse_x_to_gui(0);
var my = device_mouse_y_to_gui(0);
var click = mouse_check_button_pressed(mb_left);
ui_timer += 1;
ui_alpha = min(1, ui_alpha + 0.04);

function point_in_rect(_mx, _my, _x1, _y1, _x2, _y2) {
    return (_mx >= _x1 && _mx <= _x2 && _my >= _y1 && _my <= _y2);
}

function save_settings_file() {
    ini_open("settings.ini");
    ini_write_real("Settings", "music_volume", global.music_volume);
    ini_write_real("Settings", "sfx_volume", global.sfx_volume);
    ini_write_real("Settings", "fullscreen", global.fullscreen ? 1 : 0);
    ini_write_real("Settings", "debug_unlock_all", global.debug_unlock_all ? 1 : 0);
    ini_close();
}

hover_id = "";
var changed = false;

var minus_x = room_width * 0.35;
var plus_x = room_width * 0.65;
var toggle_x1 = (room_width - toggle_w) * 0.5;
var toggle_x2 = toggle_x1 + toggle_w;
var action_w = 460;
var action_h = 70;
var action_x1 = (room_width - action_w) * 0.5;
var action_x2 = action_x1 + action_w;
var back_x1 = (room_width - back_w) * 0.5;
var back_x2 = back_x1 + back_w;

// Remove old volume button handling - now handled by sliders

if (point_in_rect(mx, my, toggle_x1, fullscreen_y - toggle_h * 0.5, toggle_x2, fullscreen_y + toggle_h * 0.5)) {
    hover_id = "fullscreen";
    if (click) {
        global.fullscreen = !global.fullscreen;
        window_set_fullscreen(global.fullscreen);
        changed = true;
    }
}

if (point_in_rect(mx, my, action_x1, debug_unlock_y - action_h * 0.5, action_x2, debug_unlock_y + action_h * 0.5)) {
    hover_id = "debug_unlock";
    if (click) {
        global.debug_unlock_all = !global.debug_unlock_all;
        if (global.debug_unlock_all) unlock_all_levels_debug();
        save_settings_file();
    }
}

if (point_in_rect(mx, my, action_x1, reset_progress_y - action_h * 0.5, action_x2, reset_progress_y + action_h * 0.5)) {
    hover_id = "reset_progress";
    if (click) {
        reset_level_progress();
        reset_all_level_highscores();
        global.debug_unlock_all = false;
        save_settings_file();
        show_message("Progress level dan highscore semua level sudah di-reset.");
    }
}

if (point_in_rect(mx, my, back_x1, back_y - back_h * 0.5, back_x2, back_y + back_h * 0.5)) {
    hover_id = "back";
    if (click) {
        save_settings_file();
        
        // Cek room sebelumnya. Jika itu level (bukan menu), pastikan tidak restart.
        if (variable_global_exists("prev_room") && room_exists(global.prev_room)) {
            room_goto(global.prev_room);
        } else {
            room_goto(room_menu);
        }
    }
}

if (keyboard_check_pressed(vk_escape)) {
    save_settings_file();
    if (variable_global_exists("prev_room") && room_exists(global.prev_room)) {
        room_goto(global.prev_room);
    } else {
        room_goto(room_menu);
    }
}

if (changed) {
    global.music_volume = clamp(global.music_volume, 0, 1);
    global.sfx_volume = clamp(global.sfx_volume, 0, 1);
    audio_master_gain(global.music_volume);
    save_settings_file();
}

if (hover_id == "") window_set_cursor(cr_default);
else window_set_cursor(cr_handpoint);

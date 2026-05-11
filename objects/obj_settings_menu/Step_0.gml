var mx = device_mouse_x_to_gui(0);
var my = device_mouse_y_to_gui(0);
var mouse_click = mouse_check_button_pressed(mb_left);
ui_timer += 1;
ui_alpha = min(1, ui_alpha + 0.04);

function point_in_rect(_mx, _my, _x1, _y1, _x2, _y2) {
    return (_mx >= _x1 && _mx <= _x2 && _my >= _y1 && _my <= _y2);
}

function save_settings_file() {
    ini_open("settings.ini");
    ini_write_real("Settings", "music_volume", global.music_volume);
    ini_write_real("Settings", "audio_volume", global.audio_volume);
    ini_write_real("Settings", "sfx_volume", global.sfx_volume);
    ini_close();
}

hover_id = "";

// Update volume dari slider
if (instance_exists(music_slider)) {
    global.music_volume = music_slider.value;
}
if (instance_exists(sfx_slider)) {
    global.audio_volume = sfx_slider.value;
    global.sfx_volume = global.audio_volume;
}

// Terapkan volume ke music yang sedang diputar
if (audio_exists(music2)) {
    audio_sound_gain(music2, global.music_volume);
}

// Tombol BACK
var back_x1 = (room_width - back_w) * 0.5;
var back_x2 = back_x1 + back_w;
var back_y_bottom = room_height - 80;

if (point_in_rect(mx, my, back_x1, back_y_bottom - back_h * 0.5, back_x2, back_y_bottom + back_h * 0.5)) {
    hover_id = "back";
    if (mouse_click) {
        var snd = audio_play_sound(click, 1, false);
        audio_sound_gain(snd, global.sfx_volume);
        save_settings_file();
        
        // Stop musik settings dan mainkan musik game jika ada
        audio_stop_all();
        if (variable_global_exists("current_music") && audio_exists(global.current_music)) {
            audio_play_sound(global.current_music, 1, true);
            audio_sound_gain(global.current_music, global.music_volume);
        }
        
        if (variable_global_exists("prev_room") && room_exists(global.prev_room)) {
            room_goto(global.prev_room);
        } else {
            room_goto(room_menu);
        }
    }
}

// Tombol ESC
if (keyboard_check_pressed(vk_escape)) {
    save_settings_file();
    
    // Stop musik settings dan mainkan musik game jika ada
    audio_stop_all();
    if (variable_global_exists("current_music") && audio_exists(global.current_music)) {
        audio_play_sound(global.current_music, 1, true);
        audio_sound_gain(global.current_music, global.music_volume);
    }
    
    if (variable_global_exists("prev_room") && room_exists(global.prev_room)) {
        room_goto(global.prev_room);
    } else {
        room_goto(room_menu);
    }
}

// Cursor
if (hover_id == "") window_set_cursor(cr_default);
else window_set_cursor(cr_handpoint);

// F11 Fullscreen
if (keyboard_check_pressed(vk_f11)) {
    window_set_fullscreen(!window_get_fullscreen());
}
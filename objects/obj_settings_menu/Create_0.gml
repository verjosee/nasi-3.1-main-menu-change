title_y = 140;
panel_x1 = room_width * 0.2;
panel_x2 = room_width * 0.8;
panel_y1 = 240;
panel_y2 = 980;

music_y = 360;
sfx_y = 500;
fullscreen_y = 640;
debug_unlock_y = 730;
reset_progress_y = 810;
back_y = 900;

button_w = 70;
button_h = 70;
toggle_w = 300;
toggle_h = 70;
back_w = 320;
back_h = 90;

hover_id = "";
ui_alpha = 0;
ui_timer = 0;

// Initialize sliders
music_slider = instance_create_layer(0, 0, "Instances", obj_volume_slider);
music_slider.slider_type = "music";
music_slider.value = global.music_volume;
music_slider.slider_x = room_width * 0.4;
music_slider.slider_y = music_y;
music_slider.min_x = room_width * 0.4;
music_slider.max_x = room_width * 0.6;

sfx_slider = instance_create_layer(0, 0, "Instances", obj_volume_slider);
sfx_slider.slider_type = "sfx";
sfx_slider.value = global.sfx_volume;
sfx_slider.slider_x = room_width * 0.4;
sfx_slider.slider_y = sfx_y;
sfx_slider.min_x = room_width * 0.4;
sfx_slider.max_x = room_width * 0.6;

if (!variable_global_exists("music_volume")) global.music_volume = 0.7;
if (!variable_global_exists("sfx_volume")) global.sfx_volume = 0.8;
if (!variable_global_exists("fullscreen")) global.fullscreen = false;
if (!variable_global_exists("debug_unlock_all")) global.debug_unlock_all = false;

if (file_exists("settings.ini")) {
    ini_open("settings.ini");
    global.music_volume = ini_read_real("Settings", "music_volume", global.music_volume);
    global.sfx_volume = ini_read_real("Settings", "sfx_volume", global.sfx_volume);
    global.fullscreen = ini_read_real("Settings", "fullscreen", global.fullscreen ? 1 : 0) == 1;
    global.debug_unlock_all = ini_read_real("Settings", "debug_unlock_all", global.debug_unlock_all ? 1 : 0) == 1;
    ini_close();
}

global.music_volume = clamp(global.music_volume, 0, 1);
global.sfx_volume = clamp(global.sfx_volume, 0, 1);
ensure_level_arrays();
audio_master_gain(global.music_volume);
window_set_fullscreen(global.fullscreen);

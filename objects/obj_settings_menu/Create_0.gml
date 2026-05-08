title_y = 140;
panel_x1 = room_width * 0.2;
panel_x2 = room_width * 0.8;
panel_y1 = 240;
panel_y2 = 600;

music_y = 360;
sfx_y = 480;
back_y = 550;

button_w = 70;
button_h = 70;
toggle_w = 300;
toggle_h = 70;
back_w = 320;
back_h = 90;

hover_id = "";
ui_alpha = 0;
ui_timer = 0;

if (!variable_global_exists("music_volume")) global.music_volume = 0.7;
if (!variable_global_exists("sfx_volume")) global.sfx_volume = 0.8;
if (!variable_global_exists("audio_volume")) global.audio_volume = global.sfx_volume;

// Load settings dari file
if (file_exists("settings.ini")) {
    ini_open("settings.ini");
    var saved_music_volume = ini_read_real("Settings", "music_volume", -1);
    var saved_audio_volume = ini_read_real("Settings", "audio_volume", -1);
    var saved_sfx_volume = ini_read_real("Settings", "sfx_volume", -1);
    if (saved_music_volume >= 0) global.music_volume = saved_music_volume;
    if (saved_audio_volume >= 0) {
        global.audio_volume = saved_audio_volume;
    } else if (saved_sfx_volume >= 0) {
        global.audio_volume = saved_sfx_volume;
    }
    global.sfx_volume = global.audio_volume;
    ini_close();
}

global.music_volume = clamp(global.music_volume, 0, 1);
global.audio_volume = clamp(global.audio_volume, 0, 1);
global.sfx_volume = global.audio_volume;

// Play settings menu music
audio_stop_all();
if (audio_exists(music2)) {
    audio_play_sound(music2, 1, true);
    audio_sound_gain(music2, global.music_volume);
}

// Hapus slider lama jika ada
with (obj_volume_slider) {
    instance_destroy();
}

// Buat slider MUSIC (tanpa tombol +/-)
music_slider = instance_create_layer(0, 0, "Instances", obj_volume_slider);
music_slider.slider_type = "music";
music_slider.value = global.music_volume;
music_slider.slider_x = room_width * 0.4;
music_slider.slider_y = music_y;
music_slider.slider_width = room_width * 0.2;  // 0.6 - 0.4 = 0.2
music_slider.min_x = room_width * 0.4;
music_slider.max_x = room_width * 0.6;
music_slider.show_buttons = false;  // Matikan tombol -/+

// Buat slider SFX (tanpa tombol +/-)
sfx_slider = instance_create_layer(0, 0, "Instances", obj_volume_slider);
sfx_slider.slider_type = "audio";
sfx_slider.value = global.audio_volume;
sfx_slider.slider_x = room_width * 0.4;
sfx_slider.slider_y = sfx_y;
sfx_slider.slider_width = room_width * 0.2;  // 0.6 - 0.4 = 0.2
sfx_slider.min_x = room_width * 0.4;
sfx_slider.max_x = room_width * 0.6;
sfx_slider.show_buttons = false;  // Matikan tombol -/+
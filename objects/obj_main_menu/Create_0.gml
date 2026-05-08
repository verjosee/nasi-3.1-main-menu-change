// ===== CALL INITIALIZATION =====
randomize();
game_set_speed(60, gamespeed_fps);

// Play main menu music
audio_stop_all();
if (audio_exists(music1)) {
    audio_play_sound(music1, 1, true);
    var vol = variable_global_exists("music_volume") ? global.music_volume : 0.7;
    audio_sound_gain(music1, vol);
}

// Pastikan sistem cheat aktif (Persistent)
if (!instance_exists(obj_cheat)) {
    instance_create_layer(0, 0, "Instances", obj_cheat);
}

// ===== FUNCTION DECLARATIONS =====
function init_game_settings() {
    // Game settings
    display_set_gui_size(1920, 1080);
    window_set_fullscreen(false);
    window_center();
}

function init_global_variables() {
    // Global variables
    global.player_score = 0;
    global.player_lives = 3;
    global.current_level = 1;
    global.highscore = 0;
    global.music_volume = 0.7;
    global.sfx_volume = 0.8;
}

// Panggil fungsi inisialisasi
if (script_exists(asset_get_index("init_game_settings"))) {
    init_game_settings();
} else {
    init_game_settings();
}

if (script_exists(asset_get_index("init_global_variables"))) {
    init_global_variables();
} else {
    init_global_variables();
}

// ========================
// INITIALIZE LEVEL UNLOCK SYSTEM (UKURAN 10)
// ========================
if (!variable_global_exists("level_unlocked")) {
    global.level_unlocked = array_create(10);
    global.level_unlocked[0] = true;
    for (var i = 1; i < 10; i++) global.level_unlocked[i] = false;
}
if (!variable_global_exists("level_completed")) {
    global.level_completed = array_create(10);
    for (var i = 0; i < 10; i++) global.level_completed[i] = false;
}

// Load progress dari file
if (script_exists(asset_get_index("load_level_progress"))) {
    load_level_progress();
}
if (script_exists(asset_get_index("load_highscore"))) {
    load_highscore();
}

// ===== INITIALIZE MENU ANIMATION VARIABLES =====
menu_intro_timer = 0;
menu_intro_alpha = 0;
title_pulse = 1;

// ===== FLEX UI SYSTEM =====
// Gunakan margin dan padding untuk layout yang responsif
var center_x = room_width / 2;
var center_y = room_height / 2;

// Konfigurasi flex layout
var button_width = 110;  // Perkiraan lebar tombol
var button_spacing = 45;  // Jarak antar tombol (lebarin lagi)
var total_height = (3 * button_width * 0.7) + (2 * button_spacing); // Tinggi total semua tombol
var start_y = center_y - (total_height / 2); // Mulai tepat di tengah

// Posisi tombol dengan flex layout (vertical center)
var play_y = start_y;
var setting_y = start_y + (button_width * 0.7) + button_spacing;
var quit_y = setting_y + (button_width * 0.7) + button_spacing;

// ========================
// 0. SETUP BUTTONS (Respect existing instances if any)
// ========================
var _layer = layer_exists("menu") ? layer_get_id("menu") : layer;

// PLAY BUTTON
if (instance_exists(obj_btn_play)) {
    btn_play = instance_find(obj_btn_play, 0);
    btn_play.x = center_x;
    btn_play.y = play_y;
} else {
    btn_play = instance_create_layer(center_x, play_y, _layer, obj_btn_play);
}
btn_play.image_xscale = 0.6;
btn_play.image_yscale = 0.6;
btn_play.visible = true;
btn_play.image_alpha = 1;

// SETTING BUTTON
if (instance_exists(obj_btn_setting)) {
    btn_settings = instance_find(obj_btn_setting, 0);
    btn_settings.x = center_x;
    btn_settings.y = setting_y;
} else {
    btn_settings = instance_create_layer(center_x, setting_y, _layer, obj_btn_setting);
}
btn_settings.image_xscale = 0.6;
btn_settings.image_yscale = 0.6;
btn_settings.visible = true;
btn_settings.image_alpha = 1;

// QUIT BUTTON
if (instance_exists(obj_btn_quit)) {
    btn_quit = instance_find(obj_btn_quit, 0);
    btn_quit.x = center_x;
    btn_quit.y = quit_y;
} else {
    btn_quit = instance_create_layer(center_x, quit_y, _layer, obj_btn_quit);
}
btn_quit.image_xscale = 0.6;
btn_quit.image_yscale = 0.6;
btn_quit.visible = true;
btn_quit.image_alpha = 1;

// Hapus duplikasi jika ada (kecuali yang pertama)
while (instance_number(obj_btn_play) > 1) instance_destroy(instance_find(obj_btn_play, 1));
while (instance_number(obj_btn_setting) > 1) instance_destroy(instance_find(obj_btn_setting, 1));
while (instance_number(obj_btn_quit) > 1) instance_destroy(instance_find(obj_btn_quit, 1));

// ========================
// 4. BACKGROUND STARS
// ========================
// Get proper dimensions for stars
var display_w = display_get_gui_width();
var display_h = display_get_gui_height();

// If GUI width/height not available, use room dimensions
if (display_w <= 0) display_w = room_width;
if (display_h <= 0) display_h = room_height;

bintang_x = array_create(200);
bintang_y = array_create(200);
bintang_alpha = array_create(200);
bintang_speed = array_create(200);

for (var i = 0; i < 200; i++) {
    bintang_x[i] = random(display_w);
    bintang_y[i] = random(display_h);
    bintang_alpha[i] = random_range(0.2, 0.8);
    bintang_speed[i] = random_range(0.01, 0.03);
}

// Set font jika ada
if (font_exists(fnt_main)) {
    draw_set_font(fnt_main);
}

show_debug_message("=== MAIN MENU CREATED with FLEX UI ===");
show_debug_message("Play button at Y: " + string(play_y));
show_debug_message("Setting button at Y: " + string(setting_y));
show_debug_message("Quit button at Y: " + string(quit_y));


// Di bagian Create Event obj_main_menu, setelah membuat tombol, simpan posisinya

// ========================
// SIMPAN POSISI TOMBOL UNTUK REFERENCE
// ========================
global.btn_play_x = btn_play.x;
global.btn_play_y = btn_play.y;
global.btn_settings_x = btn_settings.x;
global.btn_settings_y = btn_settings.y;
global.btn_quit_x = btn_quit.x;
global.btn_quit_y = btn_quit.y;
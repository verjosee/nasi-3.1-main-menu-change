// ===== FUNCTION DECLARATIONS (declare first!) =====
function scr_game_init() {
    // Core game initialization
    randomize();
    game_set_speed(60, gamespeed_fps);
}

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

// ===== CALL FUNCTIONS =====
scr_game_init();
init_game_settings();
init_global_variables();

// ========================
// INITIALIZE LEVEL UNLOCK SYSTEM
// ========================
if (!variable_global_exists("level_unlocked")) {
    global.level_unlocked = array_create(10);
    global.level_unlocked[0] = true;
    for (var i = 1; i < 10; i++) {
        global.level_unlocked[i] = false;
    }
}

// ===== UI SETUP =====
if (font_exists(fnt_main)) {
    draw_set_font(fnt_main);
}

// ===== BACKGROUND STARS ANIMATION =====
bintang_x = array_create(200);
bintang_y = array_create(200);
bintang_alpha = array_create(200);

for (var i = 0; i < 200; i++) {
    bintang_x[i] = random(room_width);
    bintang_y[i] = random(room_height);
    bintang_alpha[i] = 0.3 + random(0.7);
}

// ===== MENU BUTTONS SETUP =====
var center_x = room_width / 2;
var center_y = room_height / 2;
var button_spacing = 120;

btn_play = instance_create_layer(center_x, center_y - button_spacing, "Instances", obj_btn_play);
btn_play.image_xscale = 0.8;
btn_play.image_yscale = 0.8;

btn_settings = instance_create_layer(center_x, center_y, "Instances", obj_btn_setting);
btn_settings.image_xscale = 0.6;
btn_settings.image_yscale = 0.6;

btn_quit = instance_create_layer(center_x, center_y + button_spacing, "Instances", obj_btn_quit);
btn_quit.image_xscale = 0.6;
btn_quit.image_yscale = 0.6;

show_debug_message("=== MAIN MENU CREATED ===");
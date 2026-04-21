// ===== FUNCTION DECLARATIONS (declare first!) =====
function scr_game_init() {
    // Core game initialization
    randomize();
    game_set_speed(60, gamespeed_fps);
    // surface_enable_alpha(true); // BARIS INI DIHAPUS - sudah deprecated
}

function init_game_settings() {
    // Game settings
    display_set_gui_size(1920, 1080);
    window_set_fullscreen(false);
    window_center();
    show_debug_message("Game settings initialized");
}

function init_global_variables() {
    // Global variables
    global.player_score = 0;
    global.player_lives = 3;
    global.current_level = 1;
    global.unlocked_levels = 1;
    global.highscore = 0;
    global.music_volume = 0.7;
    global.sfx_volume = 0.8;
    global.fullscreen = false;
}

function load_level_progress() {
    // Load saved progress (if any)
    if (file_exists("save_progress.ini")) {
        ini_open("save_progress.ini");
        global.unlocked_levels = ini_read_real("Progress", "unlocked_levels", 1);
        ini_close();
    } else {
        global.unlocked_levels = 1;
    }
}

function load_highscore() {
    // Load high score
    if (file_exists("highscore.ini")) {
        ini_open("highscore.ini");
        global.highscore = ini_read_real("Scores", "highscore", 0);
        ini_close();
    } else {
        global.highscore = 0;
    }
}

// ===== CALL FUNCTIONS =====
scr_game_init();
init_game_settings();
init_global_variables();
load_level_progress();
load_highscore();

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
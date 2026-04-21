/// CREATE EVENT - obj_level_select

// ========================
// LEVEL SYSTEM
// ========================
selected_level = 0;
total_levels = 10;  // 10 LEVEL

// ========================
// ANIMASI TIMER
// ========================
anim_timer = 0;

// ========================
// HOVER SCALE ARRAY (UKURAN 10)
// ========================
hover_scale = array_create(total_levels);  // SIZE 10
for (var i = 0; i < total_levels; i++) {
    hover_scale[i] = 1;
}

// ========================
// INISIALISASI GLOBAL LEVEL UNLOCKED (UKURAN 10!)
// ========================
if (!variable_global_exists("level_unlocked")) {
    global.level_unlocked = array_create(total_levels);  // SIZE 10, BUKAN 5!
    
    // Level 1 selalu terbuka
    global.level_unlocked[0] = true;
    
    // Level 2-10 default terkunci
    for (var i = 1; i < total_levels; i++) {
        global.level_unlocked[i] = false;
    }
} else {
    // Jika sudah ada tapi ukurannya kecil, resize
    if (array_length(global.level_unlocked) < total_levels) {
        var old_array = global.level_unlocked;
        global.level_unlocked = array_create(total_levels);
        
        // Copy data lama
        for (var i = 0; i < array_length(old_array); i++) {
            global.level_unlocked[i] = old_array[i];
        }
        
        // Isi sisanya dengan false
        for (var i = array_length(old_array); i < total_levels; i++) {
            global.level_unlocked[i] = false;
        }
    }
}

// ========================
// INISIALISASI GLOBAL LEVEL COMPLETED (UKURAN 10!)
// ========================
if (!variable_global_exists("level_completed")) {
    global.level_completed = array_create(total_levels);  // SIZE 10
    for (var i = 0; i < total_levels; i++) {
        global.level_completed[i] = false;
    }
} else {
    // Resize jika perlu
    if (array_length(global.level_completed) < total_levels) {
        var old_array = global.level_completed;
        global.level_completed = array_create(total_levels);
        
        for (var i = 0; i < array_length(old_array); i++) {
            global.level_completed[i] = old_array[i];
        }
        
        for (var i = array_length(old_array); i < total_levels; i++) {
            global.level_completed[i] = false;
        }
    }
}

// ========================
// BINTANG BACKGROUND
// ========================
bintang_x = array_create(200);
bintang_y = array_create(200);
bintang_alpha = array_create(200);

randomize();
for (var i = 0; i < 200; i++) {
    bintang_x[i] = random(room_width);
    bintang_y[i] = random(room_height);
    bintang_alpha[i] = 0.2 + random(0.8);
}

// Load level progress dari file
load_level_progress();

show_debug_message("=== LEVEL SELECT CREATED ===");
show_debug_message("Total levels: " + string(total_levels));
show_debug_message("level_unlocked array length: " + string(array_length(global.level_unlocked)));
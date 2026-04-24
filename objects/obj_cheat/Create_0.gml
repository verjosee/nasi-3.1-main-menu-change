/// CREATE EVENT - obj_cheat

// Cegah duplikasi karena objek ini persistent
if (instance_number(obj_cheat) > 1) {
    instance_destroy();
    exit;
}

// Inisialisasi global debug variables
if (!variable_global_exists("debug_mode")) {
    global.debug_mode = false;
}

if (!variable_global_exists("debug_unlock_all")) {
    global.debug_unlock_all = false;
}

// Inisialisasi level_unlocked jika perlu
if (!variable_global_exists("level_unlocked")) {
    global.level_unlocked = array_create(10);
    for (var i = 0; i < 10; i++) {
        global.level_unlocked[i] = false;
    }
    global.level_unlocked[0] = true; // Level 1 terbuka
}

show_debug_message("Cheat system initialized - Debug Mode: OFF");
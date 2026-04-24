/// STEP EVENT - Cheat System

// === TOGGLE DEBUG MODE (Shift + D) ===
if (keyboard_check(vk_shift) && keyboard_check_pressed(ord("D"))) {
    global.debug_mode = !global.debug_mode;
    
    if (global.debug_mode) {
        show_message("DEBUG MODE: ON\nLevel Unlocked: ALL");
        global.debug_unlock_all = true;
        
        // Unlock all levels
        for (var i = 0; i < 10; i++) {
            global.level_unlocked[i] = true;
        }
        show_debug_message("All levels unlocked!");
        
    } else {
        show_message("DEBUG MODE: OFF");
        global.debug_unlock_all = false;
    }
}

// === CHEAT ONLY WHEN DEBUG MODE ACTIVE ===
if (global.debug_mode || debug_mode) {
    
    // CHEAT 1: SHIELD (Tekan 1)
    if (keyboard_check_pressed(ord("1"))) {
        if (instance_exists(obj_player_rocket)) {
            var player = obj_player_rocket;
            player.shield_active = true;
            player.shield_timer = 600;
            player.invincible = true;
            player.invincible_timer = 600;
            show_debug_message("CHEAT: SHIELD ACTIVATED");
        }
    }

    // CHEAT 2: FAST UP (Tekan 2)
    if (keyboard_check_pressed(ord("2"))) {
        if (instance_exists(obj_player_rocket)) {
            var player = obj_player_rocket;
            player.fastup_active = true;
            player.fastup_timer = 600;
            player.shoot_delay = 5;
            show_debug_message("CHEAT: FAST UP ACTIVATED");
        }
    }

    // CHEAT 3: +1 HEALTH (Tekan 3)
    if (keyboard_check_pressed(ord("3"))) {
        global.lives = min(global.lives + 1, 99);
        show_debug_message("CHEAT: +1 LIFE (Total: " + string(global.lives) + ")");
    }

    // CHEAT 4: WINGMAN (Tekan 4)
    if (keyboard_check_pressed(ord("4"))) {
        if (instance_exists(obj_player_rocket)) {
            var player = obj_player_rocket;
            
            // Hapus wingman lama
            with (obj_wingman) instance_destroy();
            
            // Buat wingman baru
            var w1 = instance_create_layer(player.x, player.y, "Instances", obj_wingman);
            var w2 = instance_create_layer(player.x, player.y, "Instances", obj_wingman);
            w1.position = "top";
            w2.position = "bottom";
            show_debug_message("CHEAT: WINGMAN ACTIVATED");
        }
    }
    
    // CHEAT 5: INFINITE LIVES (Tekan 5)
    if (keyboard_check_pressed(ord("5"))) {
        global.lives = 99;
        show_debug_message("CHEAT: INFINITE LIVES");
    }
    
    // CHEAT 0: SKIP LEVEL (Tekan 0)
    if (keyboard_check_pressed(ord("0"))) {
        if (instance_exists(obj_level_manager)) {
            with (obj_level_manager) {
                countdown_time = 1;
            }
            show_debug_message("CHEAT: LEVEL SKIPPED");
        }
    }
}
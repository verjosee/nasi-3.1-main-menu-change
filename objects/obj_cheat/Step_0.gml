/// STEP EVENT - Cheat System (FINAL FIX)

// === Variabel untuk Time Stop ===
if (!variable_global_exists("time_stop_active")) {
    global.time_stop_active = false;
}

// === Variabel untuk Slow Motion ===
if (!variable_global_exists("game_speed_multiplier")) {
    global.game_speed_multiplier = 1.0;
}

// === Variabel untuk tracking status (DI CREATE EVENT) ===
// Pindahkan ke Create Event:
// last_status_frame = 0;

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
if (global.debug_mode) {
    
    // CHEAT 1: SHIELD (Tekan 1)
    if (keyboard_check_pressed(ord("1"))) {
        if (instance_exists(obj_player_rocket)) {
            var player = obj_player_rocket;
            player.shield_active = true;
            player.shield_timer =600;
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
            
            // Set player wingman variables
            player.wingman_active = true;
            player.wingman_timer = 600;
            player.wingman_spawned = false;
            
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
    
    // ===========================================
    // CHEAT 6: TIME STOP (Tekan T)
    // ===========================================
    if (keyboard_check_pressed(ord("T"))) {
        global.time_stop_active = !global.time_stop_active;
        
        // Proses semua instance kecuali cheat dan player
        with (all) {
            // Skip untuk obj_cheat dan player (biarkan player bergerak)
            if (object_index == obj_cheat || object_index == obj_player_rocket) {
                continue;
            }
            
            // Cek apakah instance memiliki speed
            if (variable_instance_exists(id, "speed")) {
                if (global.time_stop_active) {
                    // SIMPAN kecepatan asli
                    if (!variable_instance_exists(id, "stored_speed")) {
                        stored_speed = speed;
                    }
                    speed = 0;
                    
                    // Untuk meteor, simpan juga rotation_speed
                    if (variable_instance_exists(id, "rotation_speed")) {
                        if (!variable_instance_exists(id, "stored_rotation_speed")) {
                            stored_rotation_speed = rotation_speed;
                        }
                        rotation_speed = 0;
                    }
                } else {
                    // KEMBALIKAN kecepatan asli
                    if (variable_instance_exists(id, "stored_speed")) {
                        speed = stored_speed;
                    }
                    if (variable_instance_exists(id, "stored_rotation_speed")) {
                        rotation_speed = stored_rotation_speed;
                    }
                }
            }
        }
        
        if (global.time_stop_active) {
            show_debug_message(">>> TIME STOP: ACTIVATED <<<");
        } else {
            show_debug_message(">>> TIME STOP: DEACTIVATED <<<");
        }
    }
    
    // ===========================================
    // CHEAT 7: SLOW MOTION (Tekan 6)
    // ===========================================
    if (keyboard_check_pressed(ord("6"))) {
        if (!global.time_stop_active) {
            if (global.game_speed_multiplier == 1.0) {
                // AKTIFKAN SLOW MOTION (50%)
                global.game_speed_multiplier = 0.5;
                
                with (all) {
                    // Skip untuk obj_cheat dan player
                    if (object_index == obj_cheat || object_index == obj_player_rocket) {
                        continue;
                    }
                    
                    if (variable_instance_exists(id, "speed")) {
                        if (!variable_instance_exists(id, "stored_normal_speed")) {
                            stored_normal_speed = speed;
                        }
                        speed = stored_normal_speed * 0.5;
                    }
                    if (variable_instance_exists(id, "rotation_speed")) {
                        if (!variable_instance_exists(id, "stored_normal_rotation")) {
                            stored_normal_rotation = rotation_speed;
                        }
                        rotation_speed = stored_normal_rotation * 0.5;
                    }
                    if (variable_instance_exists(id, "image_speed")) {
                        if (!variable_instance_exists(id, "stored_image_speed")) {
                            stored_image_speed = image_speed;
                        }
                        image_speed = stored_image_speed * 0.5;
                    }
                }
                
                show_debug_message(">>> SLOW MOTION: 50% ACTIVATED <<<");
                
            } else {
                // NONAKTIFKAN SLOW MOTION
                global.game_speed_multiplier = 1.0;
                
                with (all) {
                    // Skip untuk obj_cheat dan player
                    if (object_index == obj_cheat || object_index == obj_player_rocket) {
                        continue;
                    }
                    
                    if (variable_instance_exists(id, "stored_normal_speed")) {
                        speed = stored_normal_speed;
                    }
                    if (variable_instance_exists(id, "stored_normal_rotation")) {
                        rotation_speed = stored_normal_rotation;
                    }
                    if (variable_instance_exists(id, "stored_image_speed")) {
                        image_speed = stored_image_speed;
                    }
                }
                
                show_debug_message(">>> SLOW MOTION: DEACTIVATED <<<");
            }
        } else {
            show_debug_message("Cannot activate slow motion while TIME STOP is active!");
        }
    }
    
    // CHEAT 0: SKIP LEVEL (Tekan 0)
    if (keyboard_check_pressed(ord("0"))) {
        if (instance_exists(obj_level_manager)) {
            with (obj_level_manager) {
                countdown_time = 1;
            }
            show_debug_message(">>> LEVEL SKIPPED <<<");
        }
    }
}

// === VISUAL FEEDBACK DI KONSOLE (DIPERBAIKI - tanpa current_time) ===
// Gunakan frame counter sebagai gantinya
if (global.debug_mode) {
    // Increment frame counter (perlu variabel di Create Event)
    if (!variable_instance_exists(id, "frame_counter")) {
        frame_counter = 0;
    }
    frame_counter++;
    
    // Tampilkan status setiap 300 frame (~5 detik pada 60 FPS)
    if (frame_counter >= 300) {
        frame_counter = 0;
        if (global.time_stop_active) {
            show_debug_message("[STATUS] Time Stop: ACTIVE");
        }
        if (global.game_speed_multiplier != 1.0) {
            show_debug_message("[STATUS] Slow Motion: " + string(global.game_speed_multiplier * 100) + "%");
        }
    }
}
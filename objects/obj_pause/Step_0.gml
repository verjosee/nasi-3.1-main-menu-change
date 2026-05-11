/// STEP EVENT - obj_pause (dengan mouse)

/// STEP EVENT - obj_pause (dengan mouse)

// ESC handler - simpel, hanya toggle pause
if (keyboard_check_pressed(vk_escape)) {
    paused = !paused;
    global.paused = paused;
    if (paused) {
        menu_page = "pause";
        selected = 0;
        instance_deactivate_all(true);
    } else {
        instance_activate_all();
    }
}

// ========== MOUSE CONTROL ==========
// Gunakan variable berbeda (bukan mouse_x/mouse_y)
var m_x = window_mouse_get_x();
var m_y = window_mouse_get_y();
var is_hovering = false;

if (paused) {
    // ===== PAUSE MENU =====
    if (menu_page == "pause") {
        for (var i = 0; i < 4; i++) {
            var menu_y = 400 + i * 80; // Lebih turun dan berjarak
            var menu_x_center = room_width/2;
            
            if (m_x > menu_x_center - 120 && m_x < menu_x_center + 120 &&
                m_y > menu_y - 30 && m_y < menu_y + 30) {
                is_hovering = true;
                selected = i;
                window_set_cursor(cr_handpoint);
                
                if (mouse_check_button_pressed(mb_left)) {
                    if (i == 0) { 
                        paused = false; 
                        global.paused = false;
                        instance_activate_all();
                        // Reset spawner alarm untuk spawn cepat
                        with (obj_spawner) alarm[0] = 1;
                    }
                    if (i == 1) { 
                        instance_activate_all();
                        global.prev_room = room;   // Simpan room saat ini
                        global.was_paused = paused;  // Simpan status pause
                        room_persistent = true;    // Biar tidak restart saat balik
                        room_goto(room_settings);
                    }
                    if (i == 2) { 
                        instance_activate_all(); 
                        room_persistent = false; // Reset persistence
                        var target_room_name = "room_level" + string(global.current_level);
                        var target_room = asset_get_index(target_room_name);
                        if (room_exists(target_room)) {
                            room_goto(target_room);
                        } else {
                            game_restart(); // Fallback jika room tidak ada
                        }
                    }
                    if (i == 3) { 
                        instance_activate_all();
                        room_persistent = false; // Reset persistence
                        audio_stop_all(); // Stop background music
                        room_goto(room_menu);
                    }
                }
            }
        }
    }
    
    // Reset cursor if not hovering
    if (!is_hovering) window_set_cursor(cr_default);
}

// ========== KEYBOARD NAVIGATION (tetap jalan) ==========
if (paused) {
    if (menu_page == "pause") {
        if (keyboard_check_pressed(vk_up) || keyboard_check_pressed(ord("W"))) {
            selected = selected - 1;
            if (selected < 0) selected = 3;
        }
        if (keyboard_check_pressed(vk_down) || keyboard_check_pressed(ord("S"))) {
            selected = selected + 1;
            if (selected > 3) selected = 0;
        }
        
        if (keyboard_check_pressed(vk_enter) || keyboard_check_pressed(vk_space)) {
            if (selected == 0) { 
                paused = false; 
                global.paused = false;
                instance_activate_all();
                // Reset spawner alarm untuk spawn cepat
                with (obj_spawner) alarm[0] = 1;
            }
            if (selected == 1) { 
                instance_activate_all();
                global.prev_room = room;
                global.was_paused = paused;  // Simpan status pause
                room_persistent = true;
                room_goto(room_settings);
            }
            if (selected == 2) { 
                instance_activate_all(); 
                room_persistent = false;
                var target_room_name = "room_level" + string(global.current_level);
                var target_room = asset_get_index(target_room_name);
                if (room_exists(target_room)) {
                    room_goto(target_room);
                } else {
                    game_restart(); // Fallback jika room tidak ada
                }
            }
            if (selected == 3) { 
                instance_activate_all();
                room_persistent = false;
                audio_stop_all(); // Stop background music
                room_goto(room_menu);
            }
        }
    }
}

// Animasi bintang berkedip
for (var i = 0; i < 150; i++) {
    bintang_alpha[i] += 0.005 * (irandom(2) - 1);
    if (bintang_alpha[i] > 0.9) bintang_alpha[i] = 0.9;
    if (bintang_alpha[i] < 0.2) bintang_alpha[i] = 0.2;
}

// Fade effect
if (paused) {
    fade_alpha = min(1, fade_alpha + 0.05);
} else {
    fade_alpha = max(0, fade_alpha - 0.05);
}

// F11 Fullscreen
if (keyboard_check_pressed(vk_f11)) {
    window_set_fullscreen(!window_get_fullscreen());
}
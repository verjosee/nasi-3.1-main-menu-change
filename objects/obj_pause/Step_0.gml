/// STEP EVENT - obj_pause (dengan mouse)

// ESC handler - simpel, hanya toggle pause
if (keyboard_check_pressed(vk_escape)) {
    paused = !paused;
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
                        instance_activate_all(); 
                    }
                    if (i == 1) { 
                        instance_activate_all();
                        global.prev_room = room;   // Simpan room saat ini
                        room_persistent = true;    // Biar tidak restart saat balik
                        room_goto(room_settings);
                    }
                    if (i == 2) { 
                        instance_activate_all(); 
                        room_persistent = false; // Reset persistence
                        game_restart(); 
                    }
                    if (i == 3) { 
                        instance_activate_all();
                        room_persistent = false; // Reset persistence
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
            if (selected == 0) { paused = false; instance_activate_all(); }
            if (selected == 1) { 
                instance_activate_all();
                global.prev_room = room;
                room_persistent = true;
                room_goto(room_settings);
            }
            if (selected == 2) { 
                instance_activate_all(); 
                room_persistent = false;
                game_restart(); 
            }
            if (selected == 3) { 
                instance_activate_all();
                room_persistent = false;
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
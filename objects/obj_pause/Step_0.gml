/// STEP EVENT - obj_pause (dengan mouse)

// ESC handler
if (keyboard_check_pressed(vk_escape)) {
    if (paused && menu_page == "settings") {
        menu_page = "pause";
        selected = 1;
    } else {
        paused = !paused;
        if (paused) {
            menu_page = "pause";
            selected = 0;
            instance_deactivate_all(true);
        } else {
            instance_activate_all();
        }
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
            var menu_y = 250 + i * 50;
            var menu_x_center = room_width/2;
            
            if (m_x > menu_x_center - 80 && m_x < menu_x_center + 80 &&
                m_y > menu_y - 20 && m_y < menu_y + 20) {
                is_hovering = true;
                selected = i;
                window_set_cursor(cr_handpoint);
                
                if (mouse_check_button_pressed(mb_left)) {
                    if (i == 0) { 
                        paused = false; 
                        instance_activate_all(); 
                    }
                    if (i == 1) { 
                        menu_page = "settings"; 
                        selected = 0; 
                    }
                    if (i == 2) { 
                        instance_activate_all(); 
                        game_restart(); 
                    }
                    if (i == 3) { 
                        game_end(); 
                    }
                }
            }
        }
    }
    
    // ===== SETTINGS MENU =====
    if (menu_page == "settings") {
        for (var i = 0; i < 4; i++) {
            var setting_y = 200 + i * 50;
            var setting_x_center = room_width/2;
            
            if (m_x > setting_x_center - 150 && m_x < setting_x_center + 150 &&
                m_y > setting_y - 15 && m_y < setting_y + 15) {
                is_hovering = true;
                selected = i;
                window_set_cursor(cr_handpoint);
                
                // Klik kiri = +5
                if (mouse_check_button_pressed(mb_left)) {
                    if (i == 0) global.shield_chance = min(100, global.shield_chance + 5);
                    if (i == 1) global.fastup_chance = min(100, global.fastup_chance + 5);
                    if (i == 2) global.health_chance = min(100, global.health_chance + 5);
                    if (i == 3) global.wingman_chance = min(100, global.wingman_chance + 5);
                }
                // Klik kanan = -5
                if (mouse_check_button_pressed(mb_right)) {
                    if (i == 0) global.shield_chance = max(0, global.shield_chance - 5);
                    if (i == 1) global.fastup_chance = max(0, global.fastup_chance - 5);
                    if (i == 2) global.health_chance = max(0, global.health_chance - 5);
                    if (i == 3) global.wingman_chance = max(0, global.wingman_chance - 5);
                }
            }
        }
        
        // Back button (opsional, tambahkan visual di Draw GUI)
        var back_y = 520;
        if (m_x > room_width/2 - 80 && m_x < room_width/2 + 80 &&
            m_y > back_y - 15 && m_y < back_y + 15) {
            is_hovering = true;
            window_set_cursor(cr_handpoint);
            if (mouse_check_button_pressed(mb_left)) {
                menu_page = "pause";
                selected = 1;
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
            if (selected == 1) { menu_page = "settings"; selected = 0; }
            if (selected == 2) { instance_activate_all(); game_restart(); }
            if (selected == 3) { game_end(); }
        }
    }
    else if (menu_page == "settings") {
        if (keyboard_check_pressed(vk_up) || keyboard_check_pressed(ord("W"))) {
            selected = selected - 1;
            if (selected < 0) selected = 3;
        }
        if (keyboard_check_pressed(vk_down) || keyboard_check_pressed(ord("S"))) {
            selected = selected + 1;
            if (selected > 3) selected = 0;
        }
        
        if (keyboard_check_pressed(vk_left) || keyboard_check_pressed(ord("A"))) {
            if (selected == 0) global.shield_chance = max(0, global.shield_chance - 5);
            if (selected == 1) global.fastup_chance = max(0, global.fastup_chance - 5);
            if (selected == 2) global.health_chance = max(0, global.health_chance - 5);
            if (selected == 3) global.wingman_chance = max(0, global.wingman_chance - 5);
        }
        if (keyboard_check_pressed(vk_right) || keyboard_check_pressed(ord("D"))) {
            if (selected == 0) global.shield_chance = min(100, global.shield_chance + 5);
            if (selected == 1) global.fastup_chance = min(100, global.fastup_chance + 5);
            if (selected == 2) global.health_chance = min(100, global.health_chance + 5);
            if (selected == 3) global.wingman_chance = min(100, global.wingman_chance + 5);
        }
    }
}

// Animasi bintang berkedip
for (var i = 0; i < 150; i++) {
    bintang_alpha[i] += 0.005 * (irandom(2) - 1);
    if (bintang_alpha[i] > 0.9) bintang_alpha[i] = 0.9;
    if (bintang_alpha[i] < 0.2) bintang_alpha[i] = 0.2;
}
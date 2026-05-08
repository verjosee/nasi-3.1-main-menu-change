/// STEP EVENT - obj_tutorial

if (!tutorial_active) exit;

// Game TIDAK di-pause - HAPUS semua instance_deactivate

// Fade in hint
if (show_hint && ui_alpha < 1) {
    ui_alpha += fade_speed;
    if (ui_alpha > 1) ui_alpha = 1;
}

// Hint timer (hint akan hilang setelah beberapa detik jika tidak ada action)
if (show_hint) {
    hint_timer++;
    if (hint_timer > 300) { // 5 detik (asumsi 60 FPS)
        show_hint = false;
        ui_alpha = 0;
    }
}

// Tutorial logic based on current step
switch (tutorial_step) {
    case 0: // Movement tutorial
        // Cek movement
        if (keyboard_check(vk_up) || keyboard_check(vk_down) || 
            keyboard_check(vk_left) || keyboard_check(vk_right) ||
            keyboard_check(ord("W")) || keyboard_check(ord("A")) || 
            keyboard_check(ord("S")) || keyboard_check(ord("D"))) {
            
            if (!moved_wasd) {
                moved_wasd = true;
                
                // Kasih feedback visual
                show_hint = false;
                ui_alpha = 0;
                
                // Delay sebentar sebelum next hint
                alarm[0] = 60; // 1 detik delay
            }
        }
        break;
        
    case 1: // Shooting tutorial
        // Cek shooting
        if (mouse_check_button_pressed(mb_left) || keyboard_check_pressed(vk_space)) {
            if (!shot_bullet) {
                shot_bullet = true;
                
                show_hint = false;
                ui_alpha = 0;
                alarm[1] = 60; // Delay sebelum next hint
            }
        }
        break;
        
    case 2: // ESC tutorial
        // Cek ESC
        if (keyboard_check_pressed(vk_escape)) {
            if (!pressed_esc) {
                pressed_esc = true;
                
                show_hint = false;
                ui_alpha = 0;
                alarm[2] = 60; // Delay sebelum tutorial selesai
            }
        }
        break;
        
    case 3: // Tutorial completed
        tutorial_active = false;
        instance_destroy();
        break;
}
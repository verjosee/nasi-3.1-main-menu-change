/// STEP EVENT - obj_gameover

// ========== ANIMASI FADE IN ==========
ui_timer += 1;
if (ui_alpha < 1) {
    ui_alpha += 0.03;
    if (ui_alpha > 1) ui_alpha = 1;
}

// ========== ENTER ==========
if (keyboard_check_pressed(vk_enter) || keyboard_check_pressed(vk_space)) {
    // Reset game variables
    global.lives = 3;
    global.score = 0;
    
    // Hancurkan object ini
    instance_destroy();
    
    // Kembali ke main menu
    room_goto(room_menu);
}

// ========== ESC ==========
if (keyboard_check_pressed(vk_escape)) {
    game_end();
}
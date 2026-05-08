/// DRAW GUI EVENT - Tampilkan status cheat di layar

// Hanya tampilkan jika debug mode aktif
if (global.debug_mode) {
    var y_offset = 0;
    var x_pos = 10;
    var line_height = 20;
    
    draw_set_color(c_lime);
    draw_set_alpha(1);
    draw_set_font(font_small); // Gunakan font kecil jika ada
    
    // Background
    draw_set_color(c_black);
    draw_set_alpha(0.7);
    draw_rectangle(x_pos - 5, 0, x_pos + 200, line_height * 7, false);
    draw_set_alpha(1);
    
    // Title
    draw_set_color(c_yellow);
    draw_text(x_pos, y_offset + 5, "=== CHEAT MODE ACTIVE ===");
    y_offset += line_height;
    
    // Time Stop Status
    draw_set_color(c_aqua);
    if (global.time_stop_active) {
        draw_text(x_pos, y_offset + 5, "> TIME STOP: [ACTIVE]");
    } else {
        draw_text(x_pos, y_offset + 5, "> TIME STOP: [INACTIVE]");
    }
    y_offset += line_height;
    
    // Slow Motion Status
    if (global.game_speed_multiplier < 1.0) {
        draw_set_color(c_orange);
        draw_text(x_pos, y_offset + 5, "> SLOW MOTION: " + string(global.game_speed_multiplier * 100) + "%");
        y_offset += line_height;
    }
    
    // Lives
    if (variable_global_exists("lives")) {
        draw_set_color(c_red);
        draw_text(x_pos, y_offset + 5, "> LIVES: " + string(global.lives));
        y_offset += line_height;
    }
    
    // Cheat Usage
    draw_set_color(c_white);
    if (global.cheat_shield_used) draw_text(x_pos, y_offset + 5, "> SHIELD: ACTIVE");
    else if (global.cheat_fastup_used) draw_text(x_pos, y_offset + 5, "> FASTUP: ACTIVE");
    else if (global.cheat_wingman_used) draw_text(x_pos, y_offset + 5, "> WINGMAN: ACTIVE");
    
    y_offset += line_height;
    
    // Help Text
    draw_set_color(c_gray);
    draw_text(x_pos, y_offset + 5, "Press T: Time Stop");
    y_offset += line_height;
    draw_text(x_pos, y_offset + 5, "Press 6: Slow Motion");
    y_offset += line_height;
    draw_text(x_pos, y_offset + 5, "Press 0: Skip Level");
}
/// DRAW EVENT - obj_tutorial (GLASSMORPHISM - lebih keren)

if (!tutorial_active && tutorial_step != 3) exit;

if (ui_alpha > 0) {
    var panel_w = 600;
    var panel_h = 150;
    var panel_x = (room_width - panel_w) / 2;
    var panel_y = room_height - panel_h - 50;
    
    // Tidak ada background gelap fullscreen
    
    // Draw panel dengan efek glass (bening + blur effect)
    draw_set_alpha(ui_alpha * 0.7); // 70% opacity
    
    // Background panel dengan warna gelap tapi transparan
    draw_rectangle_color(panel_x, panel_y, panel_x + panel_w, panel_y + panel_h, 
                        c_black, c_black, c_black, c_black, false);
    
    // Glass highlight effect (garis putih tipis di atas)
    draw_set_alpha(ui_alpha * 0.3);
    draw_rectangle_color(panel_x, panel_y, panel_x + panel_w, panel_y + 2, 
                        c_white, c_white, c_white, c_white, false);
    
    // Border
    draw_set_alpha(ui_alpha);
    draw_set_color(c_white);
    draw_rectangle(panel_x, panel_y, panel_x + panel_w, panel_y + panel_h, true);
    
    // Tutorial text
    if (tutorial_step < 3) {
        draw_set_font(-1);
        draw_set_halign(fa_center);
        draw_set_valign(fa_middle);
        
        var message = tutorial_messages[tutorial_step];
        var text_x = panel_x + panel_w / 2;
        var text_y = panel_y + panel_h / 2;
        
        // Text dengan shadow tipis
        draw_set_color(c_black);
        draw_set_alpha(ui_alpha * 0.5);
        draw_text(text_x + 2, text_y + 2, message);
        
        draw_set_alpha(ui_alpha);
        draw_set_color(c_white);
        draw_text(text_x, text_y, message);
        
        // Progress dots dengan efek glass
        var progress_y = panel_y + panel_h - 20;
        for (var i = 0; i < 3; i++) {
            var dot_x = text_x - 30 + (i * 30);
            
            if (i < tutorial_step) {
                draw_set_color(c_lime);
                draw_circle(dot_x, progress_y, 5, false);
            } else if (i == tutorial_step) {
                draw_set_color(c_yellow);
                draw_circle(dot_x, progress_y, 6, false);
                draw_set_color(c_white);
                draw_circle(dot_x, progress_y, 3, false);
            } else {
                draw_set_alpha(ui_alpha * 0.5);
                draw_set_color(c_gray);
                draw_circle(dot_x, progress_y, 4, false);
                draw_set_alpha(ui_alpha);
            }
        }
    }
}

// Reset
draw_set_alpha(1);
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_color(c_white);
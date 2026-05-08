
// Draw hint sebagai popup floating di atas (bukan fullscreen)
if (show_hint && ui_alpha > 0 && tutorial_step < 3) {
    
    // Posisi popup: tengah atas atau pojok kiri atas
    var popup_w = 400;
    var popup_h = 60;
    var popup_x = (room_width - popup_w) / 2;
    var popup_y = 50; // Di bagian atas layar
    
    // Background popup dengan alpha rendah (bening)
    draw_set_alpha(ui_alpha * 0.85);
    draw_rectangle_color(popup_x, popup_y, popup_x + popup_w, popup_y + popup_h, 
                        c_black, c_black, c_black, c_black, false);
    
    // Border popup
    draw_set_alpha(ui_alpha);
    draw_set_color(c_yellow);
    draw_rectangle(popup_x, popup_y, popup_x + popup_w, popup_y + popup_h, true);
    
    // Text hint
    draw_set_font(-1);
    draw_set_halign(fa_center);
    draw_set_valign(fa_middle);
    
    var message = tutorial_messages[tutorial_step];
    var text_x = popup_x + popup_w / 2;
    var text_y = popup_y + popup_h / 2;
    
    // Text outline
    draw_set_color(c_black);
    draw_text(text_x - 1, text_y - 1, message);
    draw_text(text_x - 1, text_y + 1, message);
    draw_text(text_x + 1, text_y - 1, message);
    draw_text(text_x + 1, text_y + 1, message);
    
    // Main text
    draw_set_color(c_yellow);
    draw_text(text_x, text_y, message);
    
    // Timer bar (menunjukkan hint akan hilang)
    var bar_width = popup_w - 20;
    var bar_height = 3;
    var bar_x = popup_x + 10;
    var bar_y = popup_y + popup_h - 10;
    var bar_percent = 1 - (hint_timer / 300);
    
    draw_set_color(c_gray);
    draw_rectangle(bar_x, bar_y, bar_x + bar_width, bar_y + bar_height, false);
    
    draw_set_color(c_yellow);
    draw_rectangle(bar_x, bar_y, bar_x + (bar_width * bar_percent), bar_y + bar_height, false);
}

// Reset draw settings
draw_set_alpha(1);
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_color(c_white);
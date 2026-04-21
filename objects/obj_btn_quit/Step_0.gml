if (position_meeting(mouse_x, mouse_y, id)) {
    image_xscale = 0.66;
    image_yscale = 0.66;
    window_set_cursor(cr_handpoint);
    
    if (mouse_check_button_pressed(mb_left)) {
        game_end();
    }
} else {
    image_xscale = 0.6;
    image_yscale = 0.6;
    window_set_cursor(cr_default);
}

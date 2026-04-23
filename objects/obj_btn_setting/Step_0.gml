/// STEP EVENT - obj_btn_setting
/// Settings button hover and click handling

if (position_meeting(mouse_x, mouse_y, id)) {
    image_xscale = 0.66;
    image_yscale = 0.66;
    
    if (mouse_check_button_pressed(mb_left)) {
        show_message("Settings coming soon!");
    }
} else {
    image_xscale = 0.6;
    image_yscale = 0.6;
}
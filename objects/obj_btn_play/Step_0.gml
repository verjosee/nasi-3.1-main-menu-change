// Hover effect
if (position_meeting(mouse_x, mouse_y, id)) {
    image_xscale = 0.9;
    image_yscale = 0.9;
    
    if (mouse_check_button_pressed(mb_left)) {
        instance_create_layer(0, 0, "Instances", obj_loading).target_room = room_level_select;
    }
} else {
    image_xscale = 0.8;
    image_yscale = 0.8;
}
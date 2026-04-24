/// STEP EVENT - obj_btn_setting

// Hanya boleh ada di room_menu
if (room != room_menu) {
    instance_destroy();
    exit;
}

// === HOVER EFFECT ===
if (position_meeting(mouse_x, mouse_y, id)) {
    image_xscale = lerp(image_xscale, 0.66, 0.1);
    image_yscale = lerp(image_yscale, 0.66, 0.1);
    
    if (mouse_check_button_pressed(mb_left)) {
        global.prev_room = room; 
        room_goto(room_settings);
    }
} else {
    image_xscale = lerp(image_xscale, 0.6, 0.1);
    image_yscale = lerp(image_yscale, 0.6, 0.1);
}
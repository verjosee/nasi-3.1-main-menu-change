/// Step Event - Volume Slider
var mx = device_mouse_x_to_gui(0);
var my = device_mouse_y_to_gui(0);

// Update hover state
hover = point_in_rectangle(mx, my, slider_x, slider_y - handle_size/2, slider_x + slider_width, slider_y + handle_size/2);

// Handle dragging
if (dragging) {
    if (mouse_check_button(mb_left)) {
        // Calculate new value based on mouse position
        var new_value = (mx - min_x) / (max_x - min_x);
        value = clamp(new_value, 0, 1);
        
        // Update rotation when dragging
        rotation_speed = 8;
        rotation += rotation_speed;
        
        // Update global volume based on slider type
        if (slider_type == "music") {
            global.music_volume = value;
            audio_master_gain(global.music_volume);
        } else if (slider_type == "sfx") {
            global.sfx_volume = value;
        }
    } else {
        dragging = false;
        rotation_speed = max(0, rotation_speed - 0.5);
    }
} else {
    // Start dragging if clicked on handle
    var handle_x = min_x + (max_x - min_x) * value;
    if (hover && mouse_check_button_pressed(mb_left)) {
        dragging = true;
    }
    rotation_speed = max(0, rotation_speed - 0.2);
}

// Apply rotation
rotation += rotation_speed;

// Update cursor
if (hover) {
    window_set_cursor(cr_handpoint);
} else if (!dragging) {
    window_set_cursor(cr_default);
}

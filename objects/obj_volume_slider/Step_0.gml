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
        var old_value = value;
        value = clamp(new_value, 0, 1);
        
        // Calculate sliding speed
        var slide_speed = abs(value - old_value) * 100;
        
        // Play slide sound if value changed
        if (value != old_value) {
            var snd = audio_play_sound(slide, 1, false);
            audio_sound_gain(snd, global.sfx_volume);
        }
        
        // Update rotation based on sliding speed (capped so it doesn't spin like crazy)
        rotation_speed = min(slide_speed * 2, 8);
        
        // Update global volume based on slider type
        if (slider_type == "music") {
            global.music_volume = value;
            // Terapkan ke semua music yang mungkin sedang diputar
            if (audio_exists(music1)) audio_sound_gain(music1, global.music_volume);
            if (audio_exists(music2)) audio_sound_gain(music2, global.music_volume);
            if (audio_exists(music3)) audio_sound_gain(music3, global.music_volume);
        } else if (slider_type == "audio" || slider_type == "sfx") {
            global.audio_volume = value;
            global.sfx_volume = global.audio_volume;
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
rotation = rotation % 360;

// Update cursor
if (hover) {
    window_set_cursor(cr_handpoint);
} else if (!dragging) {
    window_set_cursor(cr_default);
}

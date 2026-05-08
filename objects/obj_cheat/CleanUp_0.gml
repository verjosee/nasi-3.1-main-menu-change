/// ROOM END EVENT - Cleanup saat ganti room

// Reset time stop jika ganti room (opsional)
if (global.time_stop_active) {
    global.time_stop_active = false;
    show_debug_message("Time stop auto-disabled due to room change");
}

// Reset slow motion jika perlu
if (global.game_speed_multiplier != 1.0) {
    // Reset semua image_speed
    with (all) {
        if (variable_instance_exists(id, "image_speed")) {
            if (global.game_speed_multiplier == 0.5) {
                image_speed /= 0.5;
            }
        }
    }
    global.game_speed_multiplier = 1.0;
    show_debug_message("Slow motion auto-disabled due to room change");
}
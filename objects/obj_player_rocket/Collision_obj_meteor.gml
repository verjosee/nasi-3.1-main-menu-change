/// COLLISION EVENT - obj_player_rocket collides with obj_meteor

if (!invincible && !shield_active) {
    global.lives -= 1;
    
    invincible = true;
    invincible_timer = 180;  // 3 detik invincibility
    
    show_debug_message("COLLISION! Lives left: " + string(global.lives));
    
    if (global.lives <= 0) {
        global.lives = 0;
        show_debug_message("GAME OVER - OUT OF LIVES");
        // Signal LOSE condition (not time up)
        global.level_time_left = -2;  // Signal as LOSE
    }
} else if (shield_active) {
    shield_active = false;
    shield_timer = 0;
    show_debug_message("Shield absorbed hit!");
}

// Destroy the meteor
with (other) {
    instance_destroy();
}

/// COLLISION EVENT - obj_player_rocket collides with obj_meteor

if (!invincible && !shield_active) {
    global.lives -= 1;
    
    // Clamp lives to 0
    if (global.lives < 0) global.lives = 0;
    
    invincible = true;
    invincible_timer = 120;  // 2 detik invincibility
    
    // Efek visual kedip
    image_alpha = 0.5;
    
    show_debug_message("COLLISION! Lives left: " + string(global.lives));
    
    if (global.lives <= 0) {
        show_debug_message("GAME OVER - OUT OF LIVES");
        // Signal LOSE condition
        global.level_time_left = -2;
        
        // Buat ledakan player (opsional tapi bagus)
        // instance_create_layer(x, y, "Instances", obj_explosion);
        
        instance_destroy(); // Hancurkan player
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

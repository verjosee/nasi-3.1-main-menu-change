/// Step Event - Meteor Variety System

// Update rotation DAN terapkan ke sprite
rotation += rotation_speed;
image_angle = rotation;

// Move meteor
x += lengthdir_x(speed, direction);
y += lengthdir_y(speed, direction);

// Destroy meteor when it goes off-screen (left side OR right side)
if (x < -200 || x > room_width + 500 || y < -200 || y > room_height + 200) {
    instance_destroy();
}

// Check collision with player bullets
if (place_meeting(x, y, obj_bullet)) {
    var bullet = instance_place(x, y, obj_bullet);
    if (bullet != noone) {  // ← tambahkan validasi
        hp--;
        
        // Create hit effect
        instance_create_layer(bullet.x, bullet.y, "Instances", obj_bullet_trail);
        
        // Destroy bullet
        instance_destroy(bullet);
        
        // Check if meteor is destroyed
        if (hp <= 0) {
            // Add score
            global.score += score_value;
            
            // Create explosion effect
            effect_create_above(ef_explosion, x, y, 2, c_orange);
            
            // Destroy meteor
            instance_destroy();
        }
    }
}

// Check collision with player
if (place_meeting(x, y, obj_player_rocket)) {
    // Damage player
    global.lives--;
    
    // Create explosion effect
    effect_create_above(ef_explosion, x, y, 2, c_red);
    
    // Destroy meteor
    instance_destroy();
    
    // Check game over
    if (global.lives <= 0) {
        global.level_time_left = -1;
    }
}
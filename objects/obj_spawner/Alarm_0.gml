if (!instance_exists(obj_level)) {
    alarm[0] = 30;
    exit;
}

// Spawn meteor with variety system (direct spawning)
var type = irandom(3); // Random 0, 1, 2, or 3 (spr_meteor, 1, 2, 3)

// Create meteor with variety
var meteor = instance_create_layer(0, 0, "Instances", obj_meteor_variety);
meteor.meteor_type = type;

// Spawn from right side, off-screen (far enough so player can't see)
meteor.x = room_width + 600;
meteor.y = random_range(50, room_height - 50);
meteor.direction = 180; // Moving left

alarm[0] = max(15, 45 - (global.level * 4));   // spawn rate
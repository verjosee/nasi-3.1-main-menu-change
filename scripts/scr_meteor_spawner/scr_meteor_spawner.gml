/// scr_meteor_spawner()
/// Enhanced meteor spawner with variety support

function spawn_meteor_variety() {
    // Determine meteor type based on level and random chance
    var type = 0;
    var rand = random(100);
    
    // Level-based variety scaling
    if (global.level <= 2) {
        // Early levels: mostly normal meteors
        if (rand < 70) type = 0;      // Normal
        else if (rand < 85) type = 3; // Small
        else if (rand < 95) type = 1; // Fast
        else type = 4;                // Fragile
    } else if (global.level <= 5) {
        // Mid levels: more variety
        if (rand < 50) type = 0;      // Normal
        else if (rand < 70) type = 1; // Fast
        else if (rand < 80) type = 3; // Small
        else if (rand < 90) type = 2; // Large
        else if (rand < 97) type = 4; // Fragile
        else type = 5;                // Armored
    } else {
        // Late levels: all types available
        if (rand < 30) type = 0;      // Normal
        else if (rand < 50) type = 1; // Fast
        else if (rand < 65) type = 3; // Small
        else if (rand < 75) type = 2; // Large
        else if (rand < 87) type = 4; // Fragile
        else type = 5;                // Armored
    }
    
    // Create meteor with variety
    var meteor = instance_create_layer(0, 0, "Instances", obj_meteor_variety);
    meteor.meteor_type = type;
    
    // Random spawn position (from edges)
    var edge = irandom(3); // 0=top, 1=right, 2=bottom, 3=left
    switch(edge) {
        case 0: // Top
            meteor.x = random(room_width);
            meteor.y = -50;
            meteor.direction = random_range(45, 135);
            break;
        case 1: // Right
            meteor.x = room_width + 50;
            meteor.y = random(room_height);
            meteor.direction = random_range(135, 225);
            break;
        case 2: // Bottom
            meteor.x = random(room_width);
            meteor.y = room_height + 50;
            meteor.direction = random_range(225, 315);
            break;
        case 3: // Left
            meteor.x = -50;
            meteor.y = random(room_height);
            meteor.direction = random_range(-45, 45);
            break;
    }
    
    return meteor;
}

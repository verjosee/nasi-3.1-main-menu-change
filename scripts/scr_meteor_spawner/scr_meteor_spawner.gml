/// scr_meteor_spawner()
/// Enhanced meteor spawner with variety support

function spawn_meteor_variety() {
    // Determine meteor type based on random chance (equal distribution)
    var type = irandom(3); // Random 0, 1, 2, or 3

    // Create meteor with variety
    var meteor = instance_create_layer(0, 0, "Instances", obj_meteor_variety);
    meteor.meteor_type = type;

    // Spawn from right side, off-screen
    meteor.x = room_width + random_range(50, 150);  // variasi posisi spawn
    meteor.y = random_range(30, room_height - 30);
    meteor.direction = 180; // Moving left
    
    // Speed berdasarkan level (makin tinggi level makin cepat)
    var base_speed = 3;
    var level_bonus = min(5, global.level / 10); // maksimal +5 speed
    meteor.speed = random_range(base_speed, base_speed + 2 + level_bonus);
    
    return meteor;
}
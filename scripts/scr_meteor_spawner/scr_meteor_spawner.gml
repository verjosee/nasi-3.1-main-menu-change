/// scr_meteor_spawner()
/// Enhanced meteor spawner with variety support

function spawn_meteor_variety() {
    // Determine meteor type based on random chance (equal distribution)
    var type = irandom(3); // Random 0, 1, 2, or 3

    // Create meteor with variety
    var meteor = instance_create_layer(0, 0, "Instances", obj_meteor_variety);
    meteor.meteor_type = type;

    // Spawn from right side, off-screen
    meteor.x = room_width + 100;  // ← dikurangi dari 600 agar tidak terlalu jauh
    meteor.y = random_range(50, room_height - 50);
    meteor.direction = 180; // Moving left
    meteor.speed = random_range(3, 6); // ← tambahkan speed agar meteor bergerak
    
    return meteor;
}
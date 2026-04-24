if (!instance_exists(obj_level)) {
    alarm[0] = 30;
    exit;
}

// Spawn meteor with variety system
spawn_meteor_variety();

alarm[0] = max(15, 45 - (global.level * 4));   // spawn rate
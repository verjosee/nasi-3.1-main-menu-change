/// ALARM 0 - Spawn meteor

// Cek apakah level manager ada
if (!instance_exists(obj_level_manager)) {
    alarm[0] = 30;
    exit;
}

// Posisi spawn random
var meteor_y = random_range(60, room_height - 60);

// Spawn meteor
var meteor = instance_create_layer(room_width + 80, meteor_y, "Instances", obj_meteor);

// Delay spawn berdasarkan level
var spawn_delay = 45 - (global.current_level * 3);
if (spawn_delay < 20) spawn_delay = 20;

alarm[0] = spawn_delay;
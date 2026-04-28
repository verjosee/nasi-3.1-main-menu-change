/// Alarm 0 - Meteor Spawner

if (!instance_exists(obj_level)) {
    alarm[0] = 30;
    exit;
}

var spawn_rate = max(10, 60 - (global.level * 5));

// Buat meteor dengan tipe langsung di constructor (jika pakai struct)
var meteor_type = irandom(3);
var meteor = instance_create_layer(room_width + random_range(150, 350), 
                                    random_range(40, room_height - 40), 
                                    "Instances", 
                                    obj_meteor_variety);

// Set propertis lainnya
meteor.meteor_type = meteor_type;
meteor.direction = 180;

// Speed berdasarkan level (semakin tinggi level, semakin cepat)
var base_speed = 3;
var level_speed_bonus = (global.level - 1) * 0.5; // +0.5 speed per level
meteor.speed = random_range(base_speed + level_speed_bonus, base_speed + 3 + level_speed_bonus);

alarm[0] = spawn_rate;
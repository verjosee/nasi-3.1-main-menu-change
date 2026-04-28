/// Alarm 0 - Meteor Spawner

if (!instance_exists(obj_level)) {
    alarm[0] = 30;
    exit;
}

var spawn_rate = max(15, 45 - (global.level * 3));

// Buat meteor dengan tipe langsung di constructor (jika pakai struct)
var meteor_type = irandom(3);
var meteor = instance_create_layer(room_width + random_range(150, 350), 
                                    random_range(40, room_height - 40), 
                                    "Instances", 
                                    obj_meteor_variety);

// Set propertis lainnya
meteor.meteor_type = meteor_type;
meteor.direction = 180;
meteor.speed = random_range(3, 7);

alarm[0] = spawn_rate;
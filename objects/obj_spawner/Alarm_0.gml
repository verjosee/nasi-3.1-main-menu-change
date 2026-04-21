if (!instance_exists(obj_level)) {
    alarm[0] = 30;
    exit;
}

var meteor_y = random_range(60, room_height - 60);

var meteor = instance_create_layer(room_width + 80, meteor_y, "Instances", obj_meteor);

alarm[0] = max(15, 45 - (global.level * 4));   // spawn rate
if (!variable_global_exists("score")) global.score = 0;
if (!variable_global_exists("level")) global.level = 1;

if (global.score > global.level * 250) {
    global.level += 1;
    var txt = instance_create_layer(room_width/2, 160, "Instances", obj_levelup_text);
    txt.text = "LEVEL " + string(global.level);
}

if (instance_exists(obj_spawner)) {
    obj_spawner.spawn_rate = max(15, 50 - (global.level * 5));
}
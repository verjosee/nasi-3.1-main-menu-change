/// STEP EVENT - obj_wingman (DIPERBAIKI)

// Muter mengelilingi rocket utama
if (instance_exists(obj_player_rocket)) {
    orbit_angle += orbit_speed;
    
    var center_x = obj_player_rocket.x - 20;
    var center_y = obj_player_rocket.y + 0;
    
    x = center_x + lengthdir_x(orbit_radius, orbit_angle);
    y = center_y + lengthdir_y(orbit_radius, orbit_angle);
}

// Tembak otomatis
timer += 1;
if (timer >= 22) {
    instance_create_layer(x + 35, y, "Instances", obj_bullet);
    
    var snd = audio_play_sound(shoot, 1, false);
    audio_sound_gain(snd, variable_global_exists("sfx_volume") ? global.sfx_volume : 0.8);
    timer = 0;
}

// Durasi wingman
lifespan -= 1;
if (lifespan <= 0) instance_destroy();
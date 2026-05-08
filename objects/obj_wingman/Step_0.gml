/// STEP EVENT - obj_wingman (DIPERBAIKI)

// Muter mengelilingi rocket utama
if (instance_exists(obj_player_rocket)) {
    orbit_angle += orbit_speed;
    
    var center_x = obj_player_rocket.x + 25;
    var center_y = obj_player_rocket.y + 74;
    
    x = center_x + lengthdir_x(orbit_radius, orbit_angle);
    y = center_y + lengthdir_y(orbit_radius, orbit_angle);
}

// Tembak otomatis
timer += 1;
if (timer >= 22) {
    instance_create_layer(x + 35, y, "Instances", obj_bullet);
    
    // === PERBAIKAN: Cek apakah global.sfx_volume sudah ada ===
    var snd = audio_play_sound(shoot, 1, false);
    if (variable_global_exists("sfx_volume")) {
        audio_sound_gain(snd, global.sfx_volume);
    } else {
        // Default volume jika belum diinisialisasi
        audio_sound_gain(snd, 1.0);
    }
    timer = 0;
}

// Durasi wingman
lifespan -= 1;
if (lifespan <= 0) instance_destroy();


/// CREATE EVENT - obj_cheat (tambahkan ini)

// ... kode yang sudah ada ...

// Untuk tracking status di step (tanpa current_time)
frame_counter = 0;

show_debug_message("Cheat system initialized - Debug Mode: OFF");
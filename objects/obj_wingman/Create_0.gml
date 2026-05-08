timer = 0;
lifespan = 600;        // 10 detik
position = "top";      // "top" atau "bottom"

sprite_index = spr_wingman;
image_speed = 0;

// Variabel orbit
orbit_radius = 90;
orbit_angle = 0;
orbit_speed = 2;

// Set sudut awal
if (position == "top") {
    orbit_angle = -90;
} else {
    orbit_angle = 90;
}

/// CREATE EVENT - obj_cheat (tambahkan di bagian inisialisasi)

// === INISIALISASI VOLUME AUDIO ===
if (!variable_global_exists("sfx_volume")) {
    global.sfx_volume = 1.0;  // 1.0 = 100% volume
}

if (!variable_global_exists("music_volume")) {
    global.music_volume = 0.7;  // 70% volume untuk musik
}
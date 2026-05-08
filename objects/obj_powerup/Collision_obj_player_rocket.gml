if (type == "shield") {
    obj_player_rocket.shield_active = true;
    obj_player_rocket.shield_timer = 480;  // 8 detik
    obj_player_rocket.invincible = true;
    obj_player_rocket.invincible_timer = 480;  // 8 detik invincibility
} 
else if (type == "fastup") {
    obj_player_rocket.fastup_active = true;
    obj_player_rocket.fastup_timer = 420;        // 7 detik
    obj_player_rocket.shoot_delay = 6;           // peluru jauh lebih cepat
    
    show_debug_message("POWER-UP: FAST UP AKTIF - Peluru lebih cepat selama 7 detik");
} 
else if (type == "health") {
    global.lives = min(global.lives + 1, 5);   // tambah 1 nyawa, maksimal 5
    show_debug_message("POWER-UP: +1 HEALTH");
    
    // Efek visual ambil health (opsional)
    effect_create_above(ef_ring, x, y, 1, c_lime);
}

else if (type == "wingman") {
    // Set player wingman variables
    obj_player_rocket.wingman_active = true;
    obj_player_rocket.wingman_timer = 600;  // 10 detik
    obj_player_rocket.wingman_spawned = false;
    
    // Spawn 2 Wingman: 1 atas, 1 bawah
    var top = instance_create_layer(0, 0, "Instances", obj_wingman);
    var bottom = instance_create_layer(0, 0, "Instances", obj_wingman);
    
    top.position = "top";
    bottom.position = "bottom";
    
    show_debug_message("WINGMAN AKTIF - 1 Atas + 1 Bawah");
}

instance_destroy();
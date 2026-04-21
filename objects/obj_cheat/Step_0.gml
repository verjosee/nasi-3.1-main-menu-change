// === CHEAT SYSTEM - Hanya aktif di DEBUG MODE ===
// Tekan 1,2,3,4

if (debug_mode) {   // Ini adalah variabel built-in GameMaker
    
    if (keyboard_check_pressed(ord("1"))) {
        // CHEAT SHIELD
        obj_player_rocket.shield_active = true;
        obj_player_rocket.shield_timer = 600;      // 10 detik
        obj_player_rocket.invincible = true;
        obj_player_rocket.invincible_timer = 600;
        show_message("CHEAT 1: SHIELD AKTIF 10 DETIK");
    }

    if (keyboard_check_pressed(ord("2"))) {
        // CHEAT FAST UP
        obj_player_rocket.fastup_active = true;
        obj_player_rocket.fastup_timer = 600;
        obj_player_rocket.shoot_delay = 5;         // peluru sangat cepat
        show_message("CHEAT 2: FAST UP AKTIF 10 DETIK");
    }

    if (keyboard_check_pressed(ord("3"))) {
        // CHEAT HEALTH
        global.lives = min(global.lives + 1, 5);
        show_message("CHEAT 3: +1 NYAWA");
    }

    if (keyboard_check_pressed(ord("4"))) {
        // CHEAT WINGMAN
        var w1 = instance_create_layer(obj_player_rocket.x - 50, obj_player_rocket.y, "Instances", obj_wingman);
        var w2 = instance_create_layer(obj_player_rocket.x + 50, obj_player_rocket.y, "Instances", obj_wingman);
        w1.position = "top";
        w2.position = "bottom";
        show_message("CHEAT 4: WINGMAN AKTIF");
    }
}
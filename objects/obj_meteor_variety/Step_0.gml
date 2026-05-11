/// Step Event - Meteor Variety System

// Update rotation DAN terapkan ke sprite
rotation += rotation_speed;
image_angle = rotation;

// Wrap rotation angle (opsional, mencegah overflow)
if (rotation > 360) rotation -= 360;
if (rotation < 0) rotation += 360;

// Move meteor
x += lengthdir_x(speed, direction);
y += lengthdir_y(speed, direction);

// Destroy meteor when it goes off-screen
if (x < -200 || x > room_width + 500 || y < -200 || y > room_height + 200) {
    instance_destroy();
}

// === CHECK COLLISION WITH PLAYER BULLETS ===
var bullet = instance_place(x, y, obj_bullet);
if (bullet != noone) {
    hp--;
    
    instance_create_layer(bullet.x, bullet.y, "Instances", obj_bullet_trail);
    instance_destroy(bullet);
    
    if (hp > 0) {
        // UPDATE SCALE menggunakan function terpusat
        update_meteor_scale();
        
        image_blend = c_white;
        alarm[0] = 2;
    }
    else {
        global.score += score_value;
        effect_create_above(ef_explosion, x, y, 2, c_orange);
        
        if (audio_exists(explode) && !audio_is_playing(explode)) {
            var snd = audio_play_sound(explode, 1, false);
            audio_sound_gain(snd, variable_global_exists("sfx_volume") ? global.sfx_volume : 0.8);
        }
        
        if (irandom(99) < 30) {
            var pu = instance_create_layer(x, y, "Instances", obj_powerup);
            var rand = irandom(99);
            
            if (rand < 35) {
                pu.type = "shield";
                pu.sprite_index = spr_powerup_shield;
            }
            else if (rand < 60) {
                pu.type = "fastup";
                pu.sprite_index = spr_powerup_fastup;
            }
            else if (rand < 80) {
                pu.type = "health";
                pu.sprite_index = spr_powerup_health;
            }
            else {
                pu.type = "wingman";
                pu.sprite_index = spr_powerup_wingman;
            }
        }
        
        instance_destroy();
    }
}

// === CHECK COLLISION WITH PLAYER ===
if (place_meeting(x, y, obj_player_rocket)) {
    var player = obj_player_rocket;
    
    // Cek shield & invincible
    if (player.shield_active || player.invincible) {
        // Shield atau invincible aktif - meteor hancur, player aman
        effect_create_above(ef_explosion, x, y, 2, c_blue);
        var snd = audio_play_sound(explode, 1, false);
        audio_sound_gain(snd, variable_global_exists("sfx_volume") ? global.sfx_volume : 0.8);
        instance_destroy();
    }
    else if (!player.invincible) {
        // Player kena damage
        global.lives--;
        
        effect_create_above(ef_explosion, x, y, 2, c_red);
        var snd = audio_play_sound(explode, 1, false);
        audio_sound_gain(snd, variable_global_exists("sfx_volume") ? global.sfx_volume : 0.8);
        
        // Activate invincibility frames untuk player
        player.invincible = true;
        player.invincible_timer = 90;
        
        instance_destroy();
        
        if (global.lives <= 0) {
            with (obj_player_rocket) { is_exploding = true; explosion_timer = 120; }
            global.level_time_left = -3;
            if (instance_exists(obj_level_manager)) with (obj_level_manager) wave_active = false;
        }
    }
}



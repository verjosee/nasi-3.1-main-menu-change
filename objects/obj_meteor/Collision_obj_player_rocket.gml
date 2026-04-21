// Meteor nabrak player
if (!obj_player_rocket.invincible && !obj_player_rocket.shield_active) {
    
    instance_destroy();                    // hancurkan meteor
    
    global.lives -= 1;
    
    // Efek ledakan
    effect_create_above(ef_explosion, obj_player_rocket.x, obj_player_rocket.y, 2, c_red);
    
    // Cek nyawa
    if (global.lives > 0) {
        // Masih hidup → kebal sementara
        obj_player_rocket.invincible = true;
        obj_player_rocket.invincible_timer = 60;
        obj_player_rocket.image_alpha = 0.4;
    } 
    else {
        // Nyawa habis → Game Over
        room_goto(room_gameover);
    }
}
// Peluru mengenai meteor
hp -= 1;
instance_destroy(other);     // hancurkan peluru

if (hp > 0) {
    // Meteor masih hidup
    effect_create_above(ef_smoke, x, y, 1, c_gray);
    // Update skala menggunakan function terpusat
    update_meteor_scale();
} 
else {
    // Meteor hancur total
    var points = 10;
    if (image_xscale >= 1.8) points = 30;
    else if (image_xscale >= 1.4) points = 20;
    
    global.score += points;
    
    // Efek ledakan
    effect_create_above(ef_explosion, x, y, 1.8, c_orange);
    
    // Play explode sound
    audio_play_sound(explode, 1, false);
    
    // === SPAWN POWER-UP (30% chance) ===
    if (irandom(99) < 30) {
        
        var pu = instance_create_layer(x, y, "Instances", obj_powerup);
        
        var rand = irandom(99);
        
        if (rand < 35) {
            pu.type = "shield";
        }
        else if (rand < 60) {
            pu.type = "fastup";
        }
        else if (rand < 80) {
            pu.type = "health";
        }
        else {
            pu.type = "wingman";
        }
        
        // GANTI SPRITE SESUAI TYPE (INI YANG PALING PENTING)
        if (pu.type == "shield")      pu.sprite_index = spr_powerup_shield;
        else if (pu.type == "fastup") pu.sprite_index = spr_powerup_fastup;   // kalau belum ada, buat dulu
        else if (pu.type == "health") pu.sprite_index = spr_powerup_health;
        else if (pu.type == "wingman") pu.sprite_index = spr_powerup_wingman;
    }
    
    instance_destroy();   // hancurkan meteor
}
/// scr_apply_level_difficulty()
/// Applies difficulty settings based on current level

// Pastikan variabel global sudah ada
if (!variable_global_exists("current_level")) {
    global.current_level = 1;
}

var level = global.current_level;

// Base spawn rate (lower = more frequent)
var base_spawn_rate = 60;
var spawn_rate_multiplier = 1.0;

// Difficulty increases by level
switch (level) {
    case 1:  
        spawn_rate_multiplier = 1.0;  
        meteor_speed_multiplier = 1.0;
        meteor_hp_multiplier = 1.0;
        break;
    case 2:  
        spawn_rate_multiplier = 0.95; 
        meteor_speed_multiplier = 1.05;
        meteor_hp_multiplier = 1.0;
        break;
    case 3:  
        spawn_rate_multiplier = 0.9;  
        meteor_speed_multiplier = 1.1;
        meteor_hp_multiplier = 1.1;
        break;
    case 4:  
        spawn_rate_multiplier = 0.85; 
        meteor_speed_multiplier = 1.15;
        meteor_hp_multiplier = 1.2;
        break;
    case 5:  
        spawn_rate_multiplier = 0.8;  
        meteor_speed_multiplier = 1.2;
        meteor_hp_multiplier = 1.3;
        break;
    case 6:  
        spawn_rate_multiplier = 0.75; 
        meteor_speed_multiplier = 1.25;
        meteor_hp_multiplier = 1.4;
        break;
    case 7:  
        spawn_rate_multiplier = 0.7;  
        meteor_speed_multiplier = 1.3;
        meteor_hp_multiplier = 1.5;
        break;
    case 8:  
        spawn_rate_multiplier = 0.65; 
        meteor_speed_multiplier = 1.35;
        meteor_hp_multiplier = 1.6;
        break;
    case 9:  
        spawn_rate_multiplier = 0.6;  
        meteor_speed_multiplier = 1.4;
        meteor_hp_multiplier = 1.7;
        break;
    case 10: 
        spawn_rate_multiplier = 0.55; 
        meteor_speed_multiplier = 1.45;
        meteor_hp_multiplier = 1.8;
        break;
    default: 
        spawn_rate_multiplier = 0.5;  
        meteor_speed_multiplier = 1.5;
        meteor_hp_multiplier = 2.0;
        break; // fallback untuk level di atas 10
}

// Simpan hasil ke global
global.level_difficulty = spawn_rate_multiplier;
global.spawn_rate_base = ceil(base_spawn_rate * spawn_rate_multiplier);
global.meteor_speed_multiplier = meteor_speed_multiplier;
global.meteor_hp_multiplier = meteor_hp_multiplier;

// Set spawner difficulty jika ada
if (instance_exists(obj_spawner)) {
    obj_spawner.spawn_rate = global.spawn_rate_base;
}

show_debug_message("Level " + string(level) + 
                   " difficulty set. Spawn rate: " + 
                   string(global.spawn_rate_base));
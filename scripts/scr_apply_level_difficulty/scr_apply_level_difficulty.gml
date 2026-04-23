/// scr_apply_level_difficulty()
/// Applies progressive difficulty multipliers based on current level

function apply_level_difficulty() {
    // Initialize if not exists
    if (!variable_global_exists("current_level")) {
        global.current_level = 1;
    }
    
    var max_level = 10;
    var level = clamp(global.current_level, 1, max_level);
    
    // Base spawn rate
    var base_spawn_rate = 60;
    var spawn_rate_multiplier = 1.0;
    var speed_multiplier = 1.0;
    var hp_multiplier = 1.0;
    
    // Calculate difficulty based on level progression
    var difficulty_percent = (level - 1) / (max_level - 1);
    
    spawn_rate_multiplier = 1.0 - (difficulty_percent * 0.45);
    speed_multiplier = 1.0 + (difficulty_percent * 0.45);
    hp_multiplier = 1.0 + (difficulty_percent * 0.8);
    
    // Ensure valid ranges
    spawn_rate_multiplier = max(0.5, spawn_rate_multiplier);
    speed_multiplier = min(2.0, speed_multiplier);
    hp_multiplier = min(3.0, hp_multiplier);
    
    // Store in globals
    global.level_difficulty = spawn_rate_multiplier;
    global.spawn_rate_base = ceil(base_spawn_rate * spawn_rate_multiplier);
    global.meteor_speed_multiplier = speed_multiplier;
    global.meteor_hp_multiplier = hp_multiplier;
    
    show_debug_message("Level " + string(level) + " difficulty set");
}

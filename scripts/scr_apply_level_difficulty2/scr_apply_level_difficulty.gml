/// scr_apply_level_difficulty()
/// Applies difficulty settings based on current level

if (!variable_global_exists("current_level")) {
    global.current_level = 1;
}

var level = global.current_level;

// Base spawn rate (lower = more frequent)
var base_spawn_rate = 60;
var spawn_rate_multiplier = 1.0;

// Difficulty increases by level
if (level >= 1) spawn_rate_multiplier = 1.0;      // Level 1: Normal
if (level >= 2) spawn_rate_multiplier = 0.95;     // Level 2: Slightly faster
if (level >= 3) spawn_rate_multiplier = 0.9;      // Level 3: Faster
if (level >= 4) spawn_rate_multiplier = 0.85;     // Level 4: Even faster
if (level >= 5) spawn_rate_multiplier = 0.8;      // Level 5: Much faster
if (level >= 6) spawn_rate_multiplier = 0.75;     // Level 6: Very fast
if (level >= 7) spawn_rate_multiplier = 0.7;      // Level 7: Extremely fast
if (level >= 8) spawn_rate_multiplier = 0.65;     // Level 8: Insane
if (level >= 9) spawn_rate_multiplier = 0.6;      // Level 9: Nightmare
if (level >= 10) spawn_rate_multiplier = 0.55;    // Level 10: Impossible

global.level_difficulty = spawn_rate_multiplier;
global.spawn_rate_base = ceil(base_spawn_rate * spawn_rate_multiplier);

// Set spawner difficulty if exists
if (instance_exists(obj_spawner)) {
    obj_spawner.spawn_rate = global.spawn_rate_base;
}

show_debug_message("Level " + string(level) + " difficulty set. Spawn rate: " + string(global.spawn_rate_base));

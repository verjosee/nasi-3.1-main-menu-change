// Level Manager init
wave = 1;
total_waves = 3;
wave_timer = 0;
wave_duration = 30 * room_speed;
countdown_active = true;
countdown_time = 90 * room_speed;
countdown_display = 90;
enemy_spawn_timer = 0;
enemy_spawn_delay = 30;
start_delay_timer = 120;
wave_active = false;

// Tutorial on level 1
if (global.current_level == 1) instance_create_layer(0, 0, "Instances", obj_tutorial);
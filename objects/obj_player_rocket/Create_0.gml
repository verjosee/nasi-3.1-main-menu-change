// ========================
// WINGMAN SPAWN CONTROL
// ========================
wingman_spawned = false;  // Flag agar wingman hanya spawn sekali per power-up

// ========================
// POSISI AWAL
// ========================
x = -200; // Start off-screen left
y = room_height / 2;

// ========================
// ENTRANCE ANIMATION
// ========================
entrance_active = true;
entrance_target_x = 100;
entrance_speed = 8;

// ========================
// VARIABEL TEMBAK
// ========================
shoot_cooldown = 0;
shoot_delay = 10;
normal_shoot_delay = 10;

// ========================
// VARIABEL TRAIL
// ========================
trail_timer = 0;
fastup_trail_timer = 0;

// ========================
// INVINCIBLE
// ========================
invincible = false;
invincible_timer = 0;

// ========================
// POWER-UP SHIELD
// ========================
shield_active = false;
shield_timer = 0;
shield_radius = 55;

// ========================
// POWER-UP FAST UP
// ========================
fastup_active = false;
fastup_timer = 0;

// ========================
// POWER-UP HEALTH
// ========================
health_active = false;
health_timer = 0;

// ========================
// POWER-UP WINGMAN
// ========================
wingman_active = false;
wingman_timer = 0;

// ========================
// VISUAL
// ========================
image_alpha = 1;

// ========================
// LEVEL START TIME
// ========================
level_start_time = current_time;

// ========================
// DEATH EXPLOSION ANIMATION
// ========================
is_exploding = false;
explosion_timer = 0;
explosion_particles = [];
explosion_shake = 0;
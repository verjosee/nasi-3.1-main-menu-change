/// CREATE EVENT - obj_player_rocket

// Posisi awal
x = 100;
y = room_height / 2;

// Variabel tembak
shoot_cooldown = 0;
shoot_delay = 10;              // delay normal
normal_shoot_delay = 10;       // simpan delay normal untuk reset

// Variabel trail
trail_timer = 0;
fastup_trail_timer = 0;        // untuk trail khusus fastup

// Variabel invincible
invincible = false;
invincible_timer = 0;

// Power-up Shield
shield_active = false;
shield_timer = 0;
shield_radius = 55;

// Power-up Fast Up
fastup_active = false;
fastup_timer = 0;

// Power-up Health (tambahan)
health_active = false;
health_timer = 0;

// Power-up Wingman (tambahan)
wingman_active = false;
wingman_timer = 0;

// Visual
image_alpha = 1;

// Di CREATE EVENT player, tambahkan:
level_start_time = current_time;

/// Saat game dimulai (misal di Create Event atau Step Event sekali)

with (obj_level_manager) {
    countdown_active = true;
}
/// STEP EVENT - obj_player_rocket (Versi Bersih - Highscore dihapus dari sini)


// ========================
// 1. GERAKAN ROKET
// ========================
var move_speed = 6;
if (keyboard_check(vk_up) || keyboard_check(ord("W"))) y -= move_speed;
if (keyboard_check(vk_down) || keyboard_check(ord("S"))) y += move_speed;
if (keyboard_check(vk_left) || keyboard_check(ord("A"))) x -= move_speed;
if (keyboard_check(vk_right)|| keyboard_check(ord("D"))) x += move_speed;

// Batas gerak
x = clamp(x, -10, room_width - 160);
y = clamp(y, -50, room_height - 130);

// ========================
// 2. COOLDOWN TEMBAK
// ========================
if (shoot_cooldown > 0) shoot_cooldown -= 1;

if ((keyboard_check(vk_space) || mouse_check_button(mb_left)) && shoot_cooldown <= 0) {
    var bullet_x = x + 85;
    var bullet_y = y + 83;
   
    instance_create_layer(bullet_x, bullet_y, "Instances", obj_bullet);
   
    if (fastup_active) {
        shoot_cooldown = 6;
    } else {
        shoot_cooldown = shoot_delay;
    }
}

// ========================
// 3. INVINCIBILITY & KEDIP
// ========================
if (invincible) {
    invincible_timer -= 1;
    if (invincible_timer > 0) {
        image_alpha = 0.4 + 0.6 * sin(current_time * 0.1);
    } else {
        invincible = false;
        image_alpha = 1;
    }
} else {
    if (global.lives < 3) {
        image_alpha = 0.6 + 0.4 * sin(current_time * 0.08);
    } else {
        image_alpha = 1;
    }
}

// ========================
// 4. ROCKET TRAIL
// ========================
trail_timer += 1;
if (trail_timer >= 3) {
    var trail_x = x - 45;
    var trail_y = y;
    instance_create_layer(trail_x, trail_y, "Instances", obj_trail);
    trail_timer = 0;
}

// ========================
// 5. TIMERS (Shield, Fast Up, dll)
// ========================
if (shield_timer > 0) {
    shield_timer -= 1;
    if (shield_timer <= 0) shield_active = false;
}

if (fastup_timer > 0) {
    fastup_timer -= 1;
    if (fastup_timer <= 0) {
        fastup_active = false;
        shoot_delay = normal_shoot_delay;
    }
}

// ========================
// 6. LEVEL MANAGER
// ========================
if (room == room1) {
    with (obj_level_manager) {
        countdown_active = true;
        wave_active = true;
    }
}

// ========================
// TOGGLE FULLSCREEN (F11)
// ========================
if (keyboard_check_pressed(vk_f11)) {
    window_set_fullscreen(!window_get_fullscreen());
}

/// CREATE EVENT - obj_tutorial

// Tutorial state
tutorial_active = true;
tutorial_step = 0; // 0: movement, 1: shooting, 2: ESC, 3: completed

// Tutorial completion flags
moved_wasd = false;
shot_bullet = false;
pressed_esc = false;

// UI
ui_alpha = 0;
fade_speed = 0.05;
show_hint = true;
hint_timer = 0;

// Tutorial text messages
tutorial_messages[0] = "★ MOVE: Use WASD or Arrow Keys to move";
tutorial_messages[1] = "★ SHOOT: Click Left Mouse or Press Space to shoot";
tutorial_messages[2] = "★ PAUSE: Press ESC to pause the game";

// Only show tutorial on level 1
if (global.current_level != 1) {
    tutorial_active = false;
    instance_destroy();
}
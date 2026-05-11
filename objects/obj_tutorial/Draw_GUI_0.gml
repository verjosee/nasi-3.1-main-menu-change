/// DRAW GUI EVENT - obj_tutorial

if (!tutorial_active) exit;

draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_set_alpha(ui_alpha);

// Background overlay
draw_set_color(c_black);
draw_set_alpha(0.7 * ui_alpha);
draw_rectangle(0, 0, room_width, room_height, false);
draw_set_alpha(ui_alpha);

// Tutorial panel
var panel_w = 500;
var panel_h = 200;
var panel_x = (room_width - panel_w) / 2;
var panel_y = (room_height - panel_h) / 2;

draw_set_color(make_color_rgb(30, 40, 60));
draw_roundrect(panel_x, panel_y, panel_x + panel_w, panel_y + panel_h, false);

// Border
draw_set_color(c_aqua);
draw_set_alpha(0.8 * ui_alpha);
draw_rectangle(panel_x, panel_y, panel_x + panel_w, panel_y + panel_h, false);
draw_set_alpha(ui_alpha);

// Tutorial text based on step
draw_set_color(c_white);
draw_set_font(fnt_main);

switch (tutorial_step) {
    case 0: // Movement
        draw_text_transformed(room_width/2, panel_y + 50, "TUTORIAL: MOVEMENT", 1.5, 1.5, 0);
        draw_set_font(font_default);
        draw_set_color(c_yellow);
        draw_text(room_width/2, panel_y + 100, "Use WASD or Arrow Keys to move");
        draw_set_color(c_ltgray);
        draw_text(room_width/2, panel_y + 140, "Move your ship to continue");
        break;
        
    case 1: // Shooting
        draw_text_transformed(room_width/2, panel_y + 50, "TUTORIAL: SHOOTING", 1.5, 1.5, 0);
        draw_set_font(font_default);
        draw_set_color(c_yellow);
        draw_text(room_width/2, panel_y + 100, "Press SPACE or Click to shoot");
        draw_set_color(c_ltgray);
        draw_text(room_width/2, panel_y + 140, "Fire a bullet to continue");
        break;
        
    case 2: // ESC
        draw_text_transformed(room_width/2, panel_y + 50, "TUTORIAL: PAUSE", 1.5, 1.5, 0);
        draw_set_font(font_default);
        draw_set_color(c_yellow);
        draw_text(room_width/2, panel_y + 100, "Press ESC to pause and access settings");
        draw_set_color(c_ltgray);
        draw_text(room_width/2, panel_y + 140, "Press ESC to continue");
        break;
}

// Progress indicator
draw_set_color(c_aqua);
draw_text(room_width/2, panel_y + panel_h - 20, "Step " + string(tutorial_step + 1) + " of 3");

draw_set_alpha(1);
draw_set_halign(fa_left);
draw_set_valign(fa_top);

// ============ DRAW EVENT ============
// Gambar sprite loading di TENGAH layar
draw_sprite_ext(spr_loading_screen, 0, 
    room_width / 2,     // X tengah
    room_height / 2,    // Y tengah
    1, 1, 0, c_white, alpha);

// Loading bar
var bar_x = room_width / 2 - 200;
var bar_y = room_height / 2 + 450;
var bar_width = 400;
var bar_height = 20;
var fill_width = (loading_progress / total_frames) * bar_width;

// Background bar
draw_set_alpha(alpha * 0.3);
draw_set_color(c_gray);
draw_rectangle(bar_x, bar_y, bar_x + bar_width, bar_y + bar_height, false);

// Fill bar (left to right)
draw_set_alpha(alpha);
draw_set_color(c_aqua);
draw_rectangle(bar_x, bar_y, bar_x + fill_width, bar_y + bar_height, false);

// Border
draw_set_alpha(alpha);
draw_set_color(c_white);
draw_rectangle(bar_x, bar_y, bar_x + bar_width, bar_y + bar_height, true);

// Loading text
draw_set_halign(fa_center);
draw_set_valign(fa_bottom);
draw_set_color(c_white);
draw_set_alpha(alpha * 0.7);
draw_text(room_width/2, room_height - 40, "LOADING...");
draw_set_alpha(1);
draw_set_halign(fa_left);
draw_set_valign(fa_top);
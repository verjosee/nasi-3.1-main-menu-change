draw_set_halign(fa_center);
draw_set_valign(fa_middle);

// Background dasar
draw_set_color(make_color_rgb(5, 10, 35));
draw_rectangle(0, 0, room_width, room_height, false);

// Overlay fade untuk transisi lebih halus
draw_set_alpha(fade_alpha);
draw_set_color(c_black);
draw_rectangle(0, 0, room_width, room_height, false);
draw_set_alpha(1);

// Judul
draw_set_color(c_aqua);
draw_text_transformed(room_width/2, 180, "BEYOND EARTH", 2.0, 2.0, 0);

draw_set_color(c_white);
draw_text(room_width/2, 240, "GOOD GUARDIAN");

// Loading Text Besar
draw_set_color(c_yellow);
draw_text_transformed(room_width/2, room_height/2 - 30, loading_text, 1.6, 1.6, 0);

// Please wait
draw_set_color(c_ltgray);
draw_text(room_width/2, room_height/2 + 40, "PLEASE WAIT...");

// Spinner sederhana
var cx = room_width / 2;
var cy = room_height / 2 + 120;
var radius = 28;
for (var i = 0; i < 12; i++) {
    var a = spin_angle + i * 30;
    var px = cx + lengthdir_x(radius, a);
    var py = cy + lengthdir_y(radius, a);
    draw_set_alpha((i + 1) / 12);
    draw_set_color(c_aqua);
    draw_circle(px, py, 3, false);
}
draw_set_alpha(1);

draw_set_halign(fa_left);
draw_set_valign(fa_top);
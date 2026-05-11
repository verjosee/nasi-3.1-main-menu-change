draw_set_font(font_default);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);

// Background gradasi sederhana
draw_set_color(make_color_rgb(5, 10, 35));
draw_rectangle(0, 0, room_width, room_height, false);

// Tambahan efek vignette redup di tepi
draw_set_color(c_black);
draw_set_alpha(0.3);
draw_rectangle(0, 0, room_width, room_height, false);
draw_set_alpha(1);

// Overlay fade transisi
draw_set_alpha(fade_alpha);
draw_set_color(c_black);
draw_rectangle(0, 0, room_width, room_height, false);
draw_set_alpha(1);

// Loading Text dengan efek pulse
draw_set_font(fnt_main);
var pulse_scale = 1.6 + sin(current_time * 0.008) * 0.05;
var color_mix = 0.5 + sin(current_time * 0.005) * 0.5;
draw_set_color(merge_color(c_yellow, c_orange, color_mix));
draw_text_transformed(room_width/2, room_height/2 - 40, loading_text, pulse_scale, pulse_scale, 0);

// Subtitle "Please wait" dengan efek fade in-out
draw_set_font(font_default);
var alpha_wait = 0.6 + sin(current_time * 0.004) * 0.3;
draw_set_alpha(alpha_wait);
draw_set_color(c_ltgray);
draw_text(room_width/2, room_height/2 + 30, "PLEASE WAIT...");
draw_set_alpha(1);

// Spinner modern dengan efek rotasi halus
var cx = room_width / 2;
var cy = room_height / 2 + 110;
var radius = 32;
var spin = spin_angle + current_time * 0.005;

for (var i = 0; i < 12; i++) {
    var a = spin + i * 30;
    var px = cx + lengthdir_x(radius, a);
    var py = cy + lengthdir_y(radius, a);
    var alpha_circle = 0.4 + (sin(current_time * 0.01 + i) * 0.3);
    draw_set_alpha(alpha_circle);
    
    // Warna gradasi dari cyan ke biru (tanpa map_range)
    var r = 0;
    var g = 100 + (i * 10);
    var b = 200 + (i * 4);
    draw_set_color(make_color_rgb(r, g, b));
    draw_circle(px, py, 4 - (i / 12) * 1.5, false);
}
draw_set_alpha(1);

// Efek partikel kecil di sekitar spinner (tanpa blend mode jika error)
for (var i = 0; i < 6; i++) {
    var a = spin + i * 60 + current_time * 0.02;
    var px = cx + lengthdir_x(radius + 12, a);
    var py = cy + lengthdir_y(radius + 12, a);
    draw_set_alpha(0.4 + sin(current_time * 0.02 + i) * 0.2);
    draw_set_color(c_white);
    draw_circle(px, py, 2, false);
}
draw_set_alpha(1);

// Reset alignment
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_font(-1);
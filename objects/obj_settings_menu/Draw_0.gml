draw_set_halign(fa_center);
draw_set_valign(fa_middle);
var float_y = sin(ui_timer * 0.08) * 4;

for (var i = 0; i <= room_height; i += 4) {
    var t = i / room_height;
    var r = 8 + (t * 16);
    var g = 10 + (t * 14);
    var b = 24 + (t * 45);
    draw_set_color(make_color_rgb(r, g, b));
    draw_rectangle(0, i, room_width, i + 4, false);
}

draw_set_alpha(0.35);
draw_set_color(c_black);
draw_roundrect(panel_x1, panel_y1 + float_y, panel_x2, panel_y2 + float_y, false);
draw_set_alpha(ui_alpha);

// Use default font (smaller)
draw_set_font(font_default);

draw_set_color(c_aqua);
draw_text(room_width * 0.5, title_y + float_y, "SETTINGS");


// Draw sliders manually
var slider_x1 = room_width * 0.4;
var slider_x2 = room_width * 0.6;
var slider_width = slider_x2 - slider_x1;

// Music Volume
draw_set_color(c_white);
draw_text(room_width * 0.5, music_y - 45, "Music Volume: " + string(round(global.music_volume * 100)) + "%");

draw_set_color(make_color_rgb(70, 80, 110));
draw_roundrect(slider_x1, music_y - 12, slider_x2, music_y + 12, 8);

var music_fill_x = lerp(slider_x1, slider_x2, global.music_volume);
draw_set_color(c_lime);
draw_roundrect(slider_x1, music_y - 12, music_fill_x, music_y + 12, 8);

// Draw handle for music
var music_handle_x = music_fill_x;
var meteor_scale = 0.85;
var music_rot = instance_exists(music_slider) ? music_slider.rotation : 0;
var music_sprite = instance_exists(music_slider) ? music_slider.meteor_sprite : spr_meteor;
draw_sprite_ext(music_sprite, 0, music_handle_x, music_y, meteor_scale, meteor_scale, music_rot, c_white, ui_alpha);

// SFX Volume
draw_set_color(c_white);
draw_text(room_width * 0.5, sfx_y - 45, "SFX Volume: " + string(round(global.audio_volume * 100)) + "%");

draw_set_color(make_color_rgb(70, 80, 110));
draw_roundrect(slider_x1, sfx_y - 12, slider_x2, sfx_y + 12, 8);

var sfx_fill_x = lerp(slider_x1, slider_x2, global.audio_volume);
draw_set_color(c_lime);
draw_roundrect(slider_x1, sfx_y - 12, sfx_fill_x, sfx_y + 12, 8);

// Draw handle for sfx
var sfx_handle_x = sfx_fill_x;
var sfx_rot = instance_exists(sfx_slider) ? sfx_slider.rotation : 0;
var sfx_sprite = instance_exists(sfx_slider) ? sfx_slider.meteor_sprite : spr_meteor;
draw_sprite_ext(sfx_sprite, 0, sfx_handle_x, sfx_y, meteor_scale, meteor_scale, sfx_rot, c_white, ui_alpha);

// Back button at bottom
var back_x1 = (room_width - back_w) * 0.5;
var back_x2 = back_x1 + back_w;
var back_y_bottom = room_height - 80;
draw_set_color(hover_id == "back" ? c_yellow : c_aqua);
draw_roundrect(back_x1, back_y_bottom - back_h * 0.5, back_x2, back_y_bottom + back_h * 0.5, false);
draw_set_color(c_black);
draw_text(room_width * 0.5, back_y_bottom, "BACK");

draw_set_alpha(1);
draw_set_color(c_white);
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_font(-1);

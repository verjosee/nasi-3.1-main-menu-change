/// DRAW GUI EVENT - obj_loading_screen

// Gambar sprite loading (pakai sprite_index supaya aman)
draw_sprite_ext(sprite_index, 0, 0, 0, 1, 1, 0, c_white, alpha);

// Teks "LOADING..." di bawah
draw_set_halign(fa_center);
draw_set_valign(fa_bottom);
draw_set_color(c_white);
draw_set_alpha(alpha * 0.7);
draw_text(room_width/2, room_height - 50, "LOADING...");

draw_set_alpha(1);
draw_set_halign(fa_left);
draw_set_valign(fa_top);
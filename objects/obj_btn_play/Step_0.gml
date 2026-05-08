// Hanya boleh ada di room_menu
if (room != room_menu) {
    instance_destroy();
    exit;
}

var is_hovered = position_meeting(mouse_x, mouse_y, id);
var base_scale = 0.6;
var hover_scale = 0.66;
var scale_speed = 0.1;

// Smooth scaling (konsisten dengan tombol lain)
if (is_hovered) {
    image_xscale += (hover_scale - image_xscale) * scale_speed;
    window_set_cursor(cr_handpoint);
} else {
    image_xscale += (base_scale - image_xscale) * scale_speed;
}

image_yscale = image_xscale;

// Klik
if (is_hovered && mouse_check_button_pressed(mb_left)) {
    if (!instance_exists(obj_loading)) {
        var snd = audio_play_sound(click, 1, false);
        audio_sound_gain(snd, global.sfx_volume);
        var _ld = instance_create_layer(0, 0, "Instances", obj_loading);
        _ld.target_room = room_level_select;
    }
}

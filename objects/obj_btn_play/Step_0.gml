/// STEP EVENT - obj_btn_play

// Hanya boleh ada di room_menu
if (room != room_menu) {
    instance_destroy();
    exit;
}

var is_hovered = position_meeting(mouse_x, mouse_y, id);
var base_scale = 0.8;
var hover_scale = 0.9;

image_xscale = lerp(image_xscale, is_hovered ? hover_scale : base_scale, 0.1);
image_yscale = image_xscale;

if (is_hovered) {
    window_set_cursor(cr_handpoint);

    if (mouse_check_button_pressed(mb_left) && !instance_exists(obj_loading)) {
        var _ld = instance_create_layer(0, 0, "Instances", obj_loading);
        _ld.target_room = room_level_select;
    }
}
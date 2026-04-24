/// STEP EVENT - obj_btn_quit

// Hanya boleh ada di room_menu
if (room != room_menu) {
    instance_destroy();
    exit;
}

var is_hovered = position_meeting(mouse_x, mouse_y, id);
var base_scale = 0.6;
var hover_scale = 0.66;

image_xscale = is_hovered ? hover_scale : base_scale;
image_yscale = image_xscale;

if (is_hovered) {
    window_set_cursor(cr_handpoint);

    if (mouse_check_button_pressed(mb_left)) {
        game_end();
    }
}

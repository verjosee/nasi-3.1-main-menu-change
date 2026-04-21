// Pastikan button hanya ada di room_menu
if (room != room_menu) {
    with (obj_btn_play) instance_destroy();
    with (obj_btn_settings) instance_destroy();
    with (obj_btn_quit) instance_destroy();
    instance_destroy();
}
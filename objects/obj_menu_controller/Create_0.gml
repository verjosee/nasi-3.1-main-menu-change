// Hanya aktif di room_menu
if (room != room_menu) {
    instance_destroy();
    exit;
}

// Buat button-button hanya di room_menu
instance_create_layer(683, 260, "UI", obj_btn_play);
instance_create_layer(683, 390, "UI", obj_btn_settings);
instance_create_layer(683, 520, "UI", obj_btn_quit);
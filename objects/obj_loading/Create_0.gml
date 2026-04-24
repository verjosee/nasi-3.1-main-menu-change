loading_text = "LOADING";
timer = 0;
dots = 0;
target_room = room_level_select;
fade_alpha = 0;
switch_started = false;
spin_angle = 0;
persistent = true; // Jadikan persistent agar transisi mulus

// Bersihkan semua instance menu sebelumnya
instance_destroy(obj_main_menu);
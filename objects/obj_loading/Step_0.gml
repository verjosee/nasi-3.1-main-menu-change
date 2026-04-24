timer += 1;
spin_angle += 8;

if (timer mod 15 == 0) {
    dots = (dots + 1) mod 4;
    if (dots == 0) loading_text = "LOADING";
    else if (dots == 1) loading_text = "LOADING.";
    else if (dots == 2) loading_text = "LOADING..";
    else loading_text = "LOADING...";
}

if (!switch_started && timer < 90) {
    fade_alpha = min(1, fade_alpha + 0.04);
}

if (timer >= 90 && !switch_started) {
    switch_started = true;
}

if (switch_started) {
    fade_alpha = min(1, fade_alpha + 0.05);
    if (fade_alpha >= 0.99) {
        if (room != target_room) {
            room_goto(target_room);
        } else {
            // Kita sudah di room target, sekarang fade out atau langsung hancur
            instance_destroy();
        }
    }
}
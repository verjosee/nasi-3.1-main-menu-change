// Ikut roket dengan posisi atas / bawah (sesuai yang kamu atur)
if (position == "top") {
    x = obj_player_rocket.x + 25;
    y = obj_player_rocket.y + 23;   // di atas roket
} else {
    x = obj_player_rocket.x + 25;
    y = obj_player_rocket.y + 125;  // di bawah roket
}

// Tembak otomatis
timer += 1;
if (timer >= 22) {
    instance_create_layer(x + 35, y, "Instances", obj_bullet);
    timer = 0;
}

// Durasi wingman
lifespan -= 1;
if (lifespan <= 0) instance_destroy();
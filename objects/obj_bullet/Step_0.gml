x += speed;

// Trail Laser (diperbaiki)
if (irandom(2) == 0) {   // Random biar tidak terlalu padat
    var trail = instance_create_layer(x - 30, y, "Instances", obj_bullet_trail);
    trail.image_alpha = 0.85;
}

if (x > room_width + 50) instance_destroy();
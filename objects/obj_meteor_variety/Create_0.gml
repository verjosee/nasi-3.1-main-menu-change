/// Create Event - Meteor Variety System (HANYA SPRITE & ROTASI)

// === PENTING: Beri nilai default jika meteor_type belum di-set ===
if (variable_instance_exists(id, "meteor_type")) {
    // Jika variabel sudah ada, gunakan nilainya
} else {
    // Jika belum, set ke random (0-3)
    meteor_type = irandom_range(0, 3);
}

// Set sprite and size based on type
switch(meteor_type) {
    case 0:
        sprite_index = spr_meteor;
        image_xscale = 1;
        image_yscale = 1;
        break;
    case 1:
        sprite_index = spr_meteor_1;
        image_xscale = 0.7;
        image_yscale = 0.7;
        break;
    case 2:
        sprite_index = spr_meteor_2;
        image_xscale = 0.7;
        image_yscale = 0.7;
        break;
    case 3:
        sprite_index = spr_meteor_3;
        image_xscale = 0.7;
        image_yscale = 0.7;
        break;
    default:
        sprite_index = spr_meteor;
        image_xscale = 1;
        image_yscale = 1;
        break;
}

// Gameplay properties (speed di-set oleh spawner)
hp = 1;
score_value = 10;

// Random rotation - untuk efek muter-muter
rotation = random(360);
rotation_speed = random_range(-2, 2);
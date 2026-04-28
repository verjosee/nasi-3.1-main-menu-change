/// Create Event - Meteor Variety System

// Initialize meteor type system - PILIH RANDOM
meteor_type = irandom_range(0, 3);

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
}

// Gameplay properties
speed = random_range(2, 4);
hp = 1;
score_value = 10;

// Random rotation - untuk efek muter-muter
rotation = random(360);
rotation_speed = random_range(-1, 1); // kecepatan putar random (kiri/kanan)

// Random starting position
x = random(room_width);
y = random(room_height);
direction = random(360);
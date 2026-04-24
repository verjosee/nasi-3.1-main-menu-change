/// Create Event - Meteor Variety System
// Initialize meteor type system
meteor_type = 0; // 0=normal, 1=fast, 2=large, 3=small, 4=fragile, 5=armored
sprite_index = spr_meteor; // Default sprite

// Meteor properties based on type
switch(meteor_type) {
    case 0: // Normal meteor
        sprite_index = spr_meteor;
        speed = random_range(2, 4);
        hp = 1;
        score_value = 10;
        break;
    case 1: // Fast meteor
        sprite_index = spr_meteor_fast; // You'll add this sprite
        speed = random_range(5, 8);
        hp = 1;
        score_value = 20;
        break;
    case 2: // Large meteor
        sprite_index = spr_meteor_large; // You'll add this sprite
        speed = random_range(1, 2);
        hp = 3;
        score_value = 30;
        image_xscale = 2;
        image_yscale = 2;
        break;
    case 3: // Small meteor
        sprite_index = spr_meteor_small; // You'll add this sprite
        speed = random_range(3, 6);
        hp = 1;
        score_value = 15;
        image_xscale = 0.5;
        image_yscale = 0.5;
        break;
    case 4: // Fragile meteor (cracks easily)
        sprite_index = spr_meteor_fragile; // You'll add this sprite
        speed = random_range(2, 4);
        hp = 1;
        score_value = 25;
        break;
    case 5: // Armored meteor (takes more hits)
        sprite_index = spr_meteor_armored; // You'll add this sprite
        speed = random_range(1, 3);
        hp = 2;
        score_value = 40;
        break;
}

// Random rotation
rotation = random(360);
rotation_speed = random_range(-2, 2);

// Random starting position
direction = random(360);
speed = speed;

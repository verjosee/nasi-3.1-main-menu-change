/// Create Event - Meteor Variety System

// === Inisialisasi meteor_type jika belum ada ===
if (!variable_instance_exists(id, "meteor_type")) {
    meteor_type = irandom_range(0, 3);
}

// Set sprite based on type (LANGSUNG, tanpa function)
switch(meteor_type) {
    case 0:
        sprite_index = spr_meteor;
        full_scale = 1.0;
        break;
    case 1:
        sprite_index = spr_meteor_1;
        full_scale = 0.7;
        break;
    case 2:
        sprite_index = spr_meteor_2;
        full_scale = 0.7;
        break;
    case 3:
        sprite_index = spr_meteor_3;
        full_scale = 0.7;
        break;
    default:
        sprite_index = spr_meteor;
        full_scale = 1.0;
        break;
}

// === HP System ===
if (!variable_instance_exists(id, "hp")) {
    hp = 1;
}
max_hp = hp;

// === SET SCALE ===
image_xscale = full_scale;
image_yscale = full_scale;

// === Score Value ===
score_value = 10;

// === Rotation System ===
rotation = random(360);
rotation_speed = random_range(-2, 2);
image_angle = rotation;
image_blend = c_white;
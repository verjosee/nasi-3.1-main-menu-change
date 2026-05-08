// Ukuran meteor
full_scale = 0.9 + (global.current_level * 0.13);
image_xscale = full_scale;
image_yscale = full_scale;

// Kecepatan
speed = random_range(5 + global.current_level*0.7, 10 + global.current_level*1.1) * global.meteor_speed_multiplier;
direction = random_range(155, 205);

image_angle = random(360);

// ================== SISTEM HP ==================
var base_hp;
if (full_scale >= 1.85) {
    base_hp = 3;                    // Meteor sangat besar
    image_blend = c_red;
}
else if (full_scale >= 1.45) {
    base_hp = 2;                    // Meteor sedang
    image_blend = c_orange;
}
else {
    base_hp = 1;                    // Meteor kecil
    image_blend = c_white;
}

max_hp = ceil(base_hp * global.meteor_hp_multiplier);
hp = max_hp;
/// CREATE EVENT - obj_meteor

// ========== UKURAN BERDASARKAN LEVEL ==========
if (!variable_global_exists("current_level")) {
    global.current_level = 1;
}

// Ukuran meteor (semakin tinggi level, semakin besar)
image_xscale = 0.8 + (global.current_level * 0.1);
image_yscale = image_xscale;

// Batasi ukuran maksimal
if (image_xscale > 2.2) image_xscale = 2.2;
if (image_xscale < 0.6) image_xscale = 0.6;

// ========== KECEPATAN ==========
var base_speed = random_range(4, 8);
speed = base_speed + (global.current_level * 0.5);
direction = random_range(155, 205);  // ke bawah/kiri

// Rotasi acak
image_angle = random(360);

// ========== SISTEM HP ==========
if (image_xscale >= 1.8) {
    hp = 3;                    // Meteor besar
    image_blend = c_red;
} 
else if (image_xscale >= 1.3) {
    hp = 2;                    // Meteor sedang
    image_blend = c_orange;
} 
else {
    hp = 1;                    // Meteor kecil
    image_blend = c_white;
}

// ========== WARNA BERDASARKAN HP ==========
if (hp == 3) image_blend = c_red;
else if (hp == 2) image_blend = c_orange;
else image_blend = c_white;
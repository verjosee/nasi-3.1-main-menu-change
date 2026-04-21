/// CREATE EVENT

paused = false;
selected = 0;
menu_page = "pause";  // "pause" atau "settings"

// Setting Power-up
global.shield_chance = 35;
global.fastup_chance = 25;
global.health_chance = 20;
global.wingman_chance = 20;

// ========== BINTANG ARRAY UNTUK BACKGROUND ==========
bintang_x = array_create(150);
bintang_y = array_create(150);
bintang_alpha = array_create(150);

randomize();
for (var i = 0; i < 150; i++) {
    bintang_x[i] = random(room_width);
    bintang_y[i] = random(room_height);
    bintang_alpha[i] = 0.3 + random(0.7);
}
/// CREATE EVENT

// Atur depth agar background berada di paling belakang
depth = 200;  // Semakin besar nilai, semakin ke belakang

// Bintang array
bintang_x = array_create(150);
bintang_y = array_create(150);
bintang_alpha = array_create(150);

for (var i = 0; i < 150; i++) {
    bintang_x[i] = random(room_width);
    bintang_y[i] = random(room_height);
    bintang_alpha[i] = 0.3 + random(0.7);
}
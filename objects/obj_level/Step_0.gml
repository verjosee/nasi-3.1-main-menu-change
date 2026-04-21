/// STEP EVENT - obj_level

// Safety check - pastikan semua global variables ada
if (!variable_global_exists("score")) {
    global.score = 0;
}
if (!variable_global_exists("level")) {
    global.level = 1;
}

// Sekarang aman untuk digunakan
if (global.score > global.level * 250) {
    // Naik level
    global.level++;
    
    // Reset score untuk level baru (opsional)
    // global.score = 0;
    
    // Tampilkan pesan level up
    show_debug_message("Level Up! Now at level: " + string(global.level));
    
    // Tambahkan efek visual atau suara
    // audio_play_sound(snd_level_up, 1, false);
}



// Naik level setiap 250 score
if (global.score > global.level * 250) {
    global.level += 1;
    
    // Tampilkan teks level up
    var txt = instance_create_layer(room_width/2, 160, "Instances", obj_levelup_text);
    txt.text = "LEVEL " + string(global.level);
}

// Kirim data kesulitan ke spawner
obj_spawner.spawn_rate = max(15, 50 - (global.level * 5));   // semakin cepat spawn
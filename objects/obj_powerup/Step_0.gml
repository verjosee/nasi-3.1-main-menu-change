// --- HITUNG DURASI ---
timer++;
seconds_left = (total_duration - timer) / 60;

// --- CEK APAKAH SUDAH MASUK FASE KEDIP CEPAT (2 detik terakhir) ---
if (seconds_left <= 2 && !is_blinking) {
    is_blinking = true;
    image_alpha = 1;
}

// --- EFEK KEDIP YANG MAKIN CEPAT (2 detik terakhir) ---
if (is_blinking) {
    // Kecepatan kedip meningkat seiring waktu
    var blink_progress = seconds_left / 2;  // 1 ke 0
    blink_interval = max(3, 4 + (20 * blink_progress));
    
    blink_timer++;
    
    if (blink_timer >= blink_interval) {
        blink_timer = 0;
        if (image_alpha >= 0.9) {
            image_alpha = 0.2;
        } else {
            image_alpha = 1;
        }
    }
} 
else {
    // --- LOGIKA FADE NORMAL (3 detik pertama, kedip pelan) ---
    if (x < room_width - 200) {
        fade_timer++;
        
        if (fade_timer >= 10) {
            fade_timer = 0;
            fade_direction *= -1;
        }
        
        if (fade_direction == -1) {
            image_alpha = max(0.3, image_alpha - 0.05);
        } else {
            image_alpha = min(1.0, image_alpha + 0.05);
        }
    }
}

// --- ROTASI KHUSUS (hanya wingman) ---
if (type == "wingman") {
    image_angle -= 2;
}

// --- DESTROY setelah durasi habis ---
if (timer >= total_duration) {
    instance_destroy();
}

// --- DESTROY jika keluar layar ---
if (x + sprite_width/2 < 0) {
    instance_destroy();
}
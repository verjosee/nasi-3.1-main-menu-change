// --- INISIALISASI GERAK ---
type = "shield";
hspeed = -1.5;  // gerak ke kiri (sesuaikan jika perlu)

// --- INISIALISASI VISUAL ---
image_speed = 0.15;
image_alpha = 1;

// --- INISIALISASI DURASI & FADE ---
total_duration = 300;   // 5 detik (60 FPS: 5*60 = 300)
timer = 0;
fade_timer = 0;
fade_direction = -1;
is_blinking = false;
blink_timer = 0;
blink_interval = 30;
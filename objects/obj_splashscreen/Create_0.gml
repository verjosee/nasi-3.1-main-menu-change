/// CREATE EVENT

// Variabel fade
fade_alpha = 1;        // Mulai dari HITAM (1 = hitam pekat)
fade_duration = 60;    // Durasi fade
fade_state = "wait";    // wait (tunggu), fade_in, hold, fade_out

// Timer untuk hold (menampilkan splash)
hold_timer = 0;
hold_duration = 120;    // 2 detik tampil

// Timer untuk delay sebelum muncul
wait_timer = 0;
wait_duration = 30;     // 0.5 detik hitam dulu sebelum muncul

// Efek scale untuk sprite
sprite_scale = 1;

show_debug_message("=== SPLASH SCREEN CREATED ===");
show_debug_message("Wait " + string(wait_duration) + " frames before showing logo");
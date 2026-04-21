// Timer utama level (90 detik = 5400 frames)
global.level_time_left = 5400;   // 90 detik * 60 fps

// Wave system - setiap gelombang 30 detik
global.current_wave = 1;
global.wave_duration = 1800;     // 30 detik * 60 fps
wave_timer = 1800;               // Timer untuk wave saat ini

// Spawn rate base (akan diupdate berdasarkan level dan wave)
spawn_rate = 60;

// Apply level difficulty
scr_apply_level_difficulty();

show_debug_message("=== LEVEL " + string(global.current_level) + " STARTED (90 SECONDS, 3 WAVES) ===");
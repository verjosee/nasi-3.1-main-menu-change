alpha = 0;
fade_speed = 0.02;
state = "fade_in";     // fade_in → hold → fade_out
hold_timer = 338;      // 5.63 detik diam di tengah (total ~7.3 detik)
target_room = room_menu;

// Loading bar variables
loading_progress = 0;
total_frames = 400;    // Total frames for full loading (7.3 detik)

// Play intro music
audio_stop_all();
audio_play_sound(intro, 1, false);

// ============ STEP EVENT ============
// Update loading progress
loading_progress += 1;
if (loading_progress > total_frames) loading_progress = total_frames;

if (state == "fade_in") {
    alpha += fade_speed;
    if (alpha >= 1) {
        alpha = 1;
        state = "hold";
    }
}
else if (state == "hold") {
    hold_timer -= 1;
    if (hold_timer <= 0) {
        state = "fade_out";
    }
}
else if (state == "fade_out") {
    alpha -= fade_speed;
    if (alpha <= 0) {
        audio_stop_all(); // Stop intro music when leaving loading screen
        room_goto(target_room);
    }
}
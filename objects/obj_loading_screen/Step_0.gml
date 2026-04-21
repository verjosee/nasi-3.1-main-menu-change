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
        room_goto(target_room);
    }
}
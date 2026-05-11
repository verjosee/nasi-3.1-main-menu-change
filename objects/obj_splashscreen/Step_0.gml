/// STEP EVENT

switch (fade_state) {
    case "wait":
        // Tunggu sebentar dalam keadaan hitam
        wait_timer++;
        if (wait_timer >= wait_duration) {
            fade_state = "fade_in";
            show_debug_message("Wait complete, now fading in...");
        }
        break;
        
    case "fade_in":
        // Fade in: dari hitam ke transparan (logo muncul)
        fade_alpha -= 1 / fade_duration;
        if (fade_alpha <= 0) {
            fade_alpha = 0;
            fade_state = "hold";
            show_debug_message("Fade in complete, holding...");
        }
        break;
        
    case "hold":
        // Logo tampil penuh
        hold_timer++;
        
        // Efek zoom halus saat hold
        sprite_scale = 1 + sin(hold_timer * 0.03) * 0.02;
        
        if (hold_timer >= hold_duration) {
            fade_state = "fade_out";
            show_debug_message("Hold complete, fading out...");
        }
        break;
        
    case "fade_out":
        // Fade out: ke hitam
        fade_alpha += 1 / fade_duration;
        if (fade_alpha >= 1) {
            fade_alpha = 1;
            show_debug_message("Fade out complete, transitioning to loading...");
            room_goto(room_loading_screen);
        }
        break;
}

/// STEP EVENT - obj_main_menu

/// Logika interaksi tombol ada di objek tombol masing-masing.

menu_intro_timer += 1;
menu_intro_alpha = min(1, menu_intro_alpha + 0.03);
title_pulse = 1 + sin(menu_intro_timer * 0.06) * 0.03;
window_set_cursor(cr_default);

// Update alpha stars
for (var i = 0; i < 200; i++) {
    bintang_alpha[i] += random_range(-0.01, 0.01);
    bintang_alpha[i] = clamp(bintang_alpha[i], 0.15, 1);
}
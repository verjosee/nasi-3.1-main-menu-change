/// DRAW GUI - obj_lives (Modern UI - Fixed Height)

draw_set_font(fnt_score);
draw_set_halign(fa_right);
draw_set_valign(fa_top);

// Gunakan GUI width agar proporsional
var gui_w = display_get_gui_width();
var gui_h = display_get_gui_height();

// Posisi panel (kotak merah)
var panel_x1 = gui_w - 220;  // kiri panel
var panel_y1 = 20;           // atas panel
var panel_x2 = gui_w - 30;   // kanan panel (beri jarak 30px dari tepi kanan)
var panel_y2 = 150;    // bawah panel (DIPERBESAR dari 90 jadi 110)

// --- PANEL BACKGROUND ---
draw_set_alpha(0.4);
draw_set_color(c_black);
draw_roundrect_ext(panel_x1, panel_y1, panel_x2, panel_y2, 15, 15, false);
draw_set_alpha(0.6);
draw_set_color(c_red);
draw_roundrect_ext(panel_x1, panel_y1, panel_x2, panel_y2, 15, 15, true);
draw_set_alpha(1);

// === TULISAN "LIVES" ===
draw_set_color(c_white);
draw_text_transformed(panel_x2 - 15, panel_y1 + 10, "LIVES", 0.6, 0.6, 0);

// === ANGKA NYAWA ===
var lives_color = c_white;
if (global.lives <= 1) {
    lives_color = (sin(current_time * 0.01) > 0) ? c_red : c_white;
}

draw_set_color(lives_color);
draw_text_transformed(panel_x2 - 15, panel_y1 + 50, string(global.lives), 1.5, 1.5, 0); // Y dari 35 jadi 50

// Reset
draw_set_halign(fa_left);
draw_set_color(c_white);
draw_set_font(-1);
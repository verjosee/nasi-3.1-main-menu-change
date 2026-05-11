var gw = display_get_gui_width();
var gh = display_get_gui_height();

draw_set_font(font_default);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);

// ========== BACKGROUND GRADIEN ==========
for (var i = 0; i <= gh; i += 4) {
    var t = i / gh;
    var r = 10 + (t * 30);
    var g_color = 20;
    var b = 50 + (t * 30);
    draw_set_color(make_color_rgb(r, g_color, b));
    draw_rectangle(0, i, gw, i+4, false);
}

// ========== OVERLAY GELAP ==========
draw_set_color(c_black);
draw_set_alpha(0.7);
draw_rectangle(0, 0, gw, gh, false);

// ========== ANIMASI ALPHA ==========
draw_set_alpha(ui_alpha);

// ========== JUDUL (WIN/LOSE) ==========
draw_set_font(fnt_main);
var title_scale = 2.5 + sin(ui_timer * 0.08) * 0.05;
var title_text = (level_status == "WIN") ? "LEVEL COMPLETE" : "GAME OVER";
var title_color = (level_status == "WIN") ? c_lime : c_red;

// Bayangan
draw_set_color(c_black);
draw_set_alpha(0.5 * ui_alpha);
draw_text_transformed(gw/2 + 4, gh/2 - 120 + 4, title_text, title_scale, title_scale, 0);

// Teks utama
draw_set_alpha(ui_alpha);
draw_set_color(title_color);
draw_text_transformed(gw/2, gh/2 - 120, title_text, title_scale, title_scale, 0);

// Garis bawah neon
draw_set_color(c_white);
draw_set_alpha(0.7 * ui_alpha);
draw_line(gw/2 - 180, gh/2 - 80, gw/2 + 180, gh/2 - 80);
draw_set_alpha(ui_alpha);
draw_set_font(font_default);

// ========== PANEL INFO ==========
var panel_y = gh/2 - 20;
draw_set_color(make_color_rgb(30, 40, 60));
draw_set_alpha(0.8 * ui_alpha);

// PERBAIKAN: Ganti draw_roundrect dengan draw_rectangle (biar tidak error)
draw_rectangle(gw/2 - 200, panel_y - 10, gw/2 + 200, panel_y + 180, false);

draw_set_alpha(ui_alpha);

// ========== SKOR ==========
draw_set_color(c_yellow);
draw_text(gw/2, panel_y + 20, "YOUR SCORE");
draw_set_color(c_white);
draw_text_transformed(gw/2, panel_y + 55, string(final_score), 1.3, 1.3, 0);

// ========== HIGHSCORE ==========
draw_set_color(c_yellow);
draw_text(gw/2, panel_y + 90, "HIGH SCORE");
draw_set_color(c_white);
draw_text_transformed(gw/2, panel_y + 125, string(global.highscore), 1.3, 1.3, 0);

// ========== LEVEL INFO ==========
if (variable_global_exists("current_level")) {
    draw_set_color(c_yellow);
    draw_text(gw/2, panel_y + 160, "LEVEL " + string(global.current_level));
}

// ========== PESAN STATUS ==========
if (level_status == "WIN") {
    draw_set_color(c_lime);
    draw_text_transformed(gw/2, gh/2 + 200, " LEVEL SOLVED! ", 1.2, 1.2, 0);
} else {
    draw_set_color(c_red);
    draw_text_transformed(gw/2, gh/2 + 200, " YOU DIED ", 1.2, 1.2, 0);
}

// ========== PETUNJUK ==========
draw_set_color(c_white);
draw_set_alpha(0.7 + 0.3 * sin(current_time * 0.003) * ui_alpha);
draw_text(gw/2, gh/2 + 280, "PRESS ENTER TO CONTINUE");
draw_text(gw/2, gh/2 + 320, "PRESS ESC TO QUIT");

draw_set_alpha(1);
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_font(-1);
/// DRAW GUI EVENT - obj_gameover

var gw = display_get_gui_width();
var gh = display_get_gui_height();

draw_set_halign(fa_center);
draw_set_valign(fa_middle);

// ========== BACKGROUND GRADIEN ==========
for (var i = 0; i <= gh; i += 4) {
    var t = i / gh;
    var r = 10 + (t * 30);
    var g = 20;
    var b = 50 + (t * 30);
    draw_set_color(make_color_rgb(r, g, b));
    draw_rectangle(0, i, gw, i+4, false);
}

// ========== OVERLAY GELAP ==========
draw_set_color(c_black);
draw_set_alpha(0.7);
draw_rectangle(0, 0, gw, gh, false);

// ========== ANIMASI ALPHA ==========
draw_set_alpha(ui_alpha);

// ========== JUDUL (WIN/LOSE) ==========
var title_scale = 2 + sin(ui_timer * 0.08) * 0.05;
var title_text = (level_status == "WIN") ? "LEVEL COMPLETE" : "GAME OVER";
var title_color = (level_status == "WIN") ? c_lime : c_red;

draw_set_color(title_color);
draw_text_transformed(gw/2, gh/2 - 120, title_text, title_scale, title_scale, 0);

// ========== GARIS BAWAH ==========
draw_set_color(c_white);
draw_set_alpha(0.5);
draw_line(gw/2 - 150, gh/2 - 80, gw/2 + 150, gh/2 - 80);

// ========== SKOR ==========
draw_set_color(c_yellow);
draw_text(gw/2, gh/2 - 30, "YOUR SCORE");
draw_set_color(c_white);
draw_text(gw/2, gh/2 + 10, string(final_score));

// ========== HIGHSCORE ==========
draw_set_color(c_yellow);
draw_text(gw/2, gh/2 + 60, "HIGH SCORE");
draw_set_color(c_white);
draw_text(gw/2, gh/2 + 100, string(global.highscore));

// ========== LEVEL INFO ==========
if (variable_global_exists("current_level")) {
    draw_set_color(c_yellow);
    draw_text(gw/2, gh/2 + 150, "LEVEL REACHED");
    draw_set_color(c_white);
    draw_text(gw/2, gh/2 + 190, string(global.current_level));
}

// ========== PESAN STATUS ==========
if (level_status == "WIN") {
    draw_set_color(c_lime);
    draw_text(gw/2, gh/2 + 250, " Level Solved! ");
} else {
    draw_set_color(c_red);
    draw_text(gw/2, gh/2 + 250, " YOU DIED ");
}

// ========== PETUNJUK ==========
draw_set_color(c_gray);
draw_set_alpha(0.7 + 0.3 * sin(current_time * 0.003));
draw_text(gw/2, gh/2 + 320, "PRESS ENTER TO CONTINUE");

draw_set_alpha(1);
draw_set_halign(fa_left);
draw_set_valign(fa_top);
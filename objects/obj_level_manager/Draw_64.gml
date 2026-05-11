/// DRAW EVENT - obj_select_level (Versi tanpa font custom)

// ========================
// BACKGROUND GRADIEN
// ========================
for (var i = 0; i <= room_height; i += 4) {
    var t = i / room_height;
    var r = 10 + (t * 25);
    var g = 15 + (t * 15);
    var b = 45 + (t * 35);
    draw_set_color(make_color_rgb(r, g, b));
    draw_rectangle(0, i, room_width, i+4, false);
}

// ========================
// BINTANG LATAR
// ========================
draw_set_color(c_white);
for (var i = 0; i < 200; i++) {
    draw_set_alpha(bintang_alpha[i]);
    draw_point(bintang_x[i], bintang_y[i]);
    
    if (i mod 25 == 0) {
        draw_set_alpha(bintang_alpha[i] * 0.5);
        draw_rectangle(bintang_x[i]-1, bintang_y[i]-1, bintang_x[i]+1, bintang_y[i]+1, false);
    }
}
draw_set_alpha(1);

// ========================
// EFEK NEBULA
// ========================
draw_set_alpha(0.15);
for (var i = 0; i < 30; i++) {
    draw_set_color(choose(c_blue, c_aqua, c_purple));
    var px = room_width/2 + sin(anim_timer * 0.001 + i) * 300;
    var py = room_height/2 + cos(anim_timer * 0.002 + i) * 150;
    draw_circle(px, py, 80 + sin(anim_timer * 0.003 + i) * 20, false);
}
draw_set_alpha(1);

// ========================
// JUDUL
// ========================
draw_set_font(fnt_main);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);

// Shadow judul
draw_set_color(c_black);
draw_set_alpha(0.5);
draw_text_transformed(room_width/2 + 4, 64, "SELECT YOUR DESTINY", 1.2, 1.2, 0);

// Judul utama
draw_set_alpha(1);
draw_set_color(c_aqua);
draw_text_transformed(room_width/2, 60, "SELECT YOUR DESTINY", 1.2, 1.2, 0);

draw_set_font(font_default);

// Garis dekorasi
draw_set_color(c_yellow);
draw_set_alpha(0.6);
draw_line(room_width/2 - 200, 90, room_width/2 - 80, 90);
draw_line(room_width/2 + 80, 90, room_width/2 + 200, 90);
draw_set_color(c_white);
draw_circle(room_width/2 - 80, 90, 3, false);
draw_circle(room_width/2 + 80, 90, 3, false);
draw_set_alpha(1);

// ========================
// LEVEL SELECTOR (1-10)
// ========================
var start_x = room_width/2 - 495;
var start_y = room_height/2 - 30;
var spacing = 110;
var row1_y = start_y - 60;
var row2_y = start_y + 70;

for (var i = 0; i < total_levels; i++) {
    var level_x, level_y;
    if (i < 5) {
        level_x = start_x + (i * spacing);
        level_y = row1_y;
    } else {
        level_x = start_x + ((i - 5) * spacing);
        level_y = row2_y;
    }
    
    var is_unlocked = global.level_unlocked[i];
    var is_selected = (i == selected_level);
    var level_num = i + 1;
    var scale = hover_scale[i];
    
    // GLOW EFFECT
    if (is_selected && is_unlocked) {
        draw_set_alpha(0.3 + sin(anim_timer * 0.1) * 0.1);
        draw_set_color(c_yellow);
        draw_circle(level_x, level_y, 55 * scale, false);
        draw_set_alpha(1);
    }
    
    // BACKGROUND CIRCLE
    if (is_unlocked) {
        draw_set_alpha(0.9);
        draw_set_color(c_blue);
        draw_circle(level_x, level_y, 48 * scale, false);
        
        draw_set_alpha(0.4);
        draw_set_color(c_aqua);
        draw_circle(level_x, level_y, 42 * scale, true);
        
        draw_set_alpha(0.6);
        draw_set_color(c_teal);
        draw_circle(level_x, level_y, 35 * scale, false);
    } else {
        draw_set_alpha(0.7);
        draw_set_color(c_gray);
        draw_circle(level_x, level_y, 48 * scale, false);
        
        draw_set_alpha(0.3);
        draw_set_color(c_black);
        draw_circle(level_x, level_y, 42 * scale, true);
    }
    
    // NOMOR LEVEL ATAU TANDA TANYA (TANPA FONT CUSTOM)
    draw_set_alpha(1);
    draw_set_halign(fa_center);
    draw_set_valign(fa_middle);
    
    if (is_unlocked) {
        draw_set_color(c_white);
        draw_text_transformed(level_x, level_y, string(level_num), 1.8 * scale, 1.8 * scale, 0);
        
        if (variable_global_exists("level_completed") && global.level_completed[i]) {
            draw_set_color(c_yellow);
            draw_text(level_x + 30, level_y - 30, "★");
        }
    } else {
        draw_set_color(c_silver);
        draw_text_transformed(level_x, level_y, "?", 2.2 * scale, 2.2 * scale, 0);
        
        draw_set_color(c_red);
        draw_set_alpha(0.8);
        draw_text(level_x, level_y + 35, "🔒");
        draw_set_alpha(1);
    }
    
    // OUTLINE UNTUK YANG DIPILIH
    if (is_selected && is_unlocked) {
        draw_set_alpha(0.8);
        draw_set_color(c_yellow);
        draw_circle(level_x, level_y, 52 * scale, false);
        draw_set_alpha(1);
    }
    
    // LABEL LEVEL (TANPA FONT CUSTOM)
    draw_set_alpha(0.7);
    draw_set_color(c_white);
    
    if (level_num <= 5) {
        draw_text(level_x, level_y + 55, "LEVEL " + string(level_num));
    } else {
        draw_text(level_x, level_y - 55, "LEVEL " + string(level_num));
    }
    
    // PANAH HUBUNG
    if (level_num == 5) {
        draw_set_color(c_yellow);
        draw_set_alpha(0.5);
        draw_text(level_x + 55, level_y - 20, "▼");
        draw_text(level_x + 55, level_y + 5, "▼");
        draw_set_alpha(0.7);
    }
    
    if (level_num == 6) {
        draw_set_color(c_yellow);
        draw_set_alpha(0.5);
        draw_text(level_x - 55, level_y - 20, "▲");
        draw_text(level_x - 55, level_y + 5, "▲");
        draw_set_alpha(0.7);
    }
}

// ========================
// INFO PANEL
// ========================
var panel_y = room_height - 120;

draw_set_alpha(0.3);
draw_set_color(c_black);
draw_rectangle(room_width/2 - 250, panel_y - 50, room_width/2 + 250, panel_y + 40, false);
draw_set_alpha(0.5);
draw_rectangle(room_width/2 - 248, panel_y - 48, room_width/2 + 248, panel_y + 38, true);

draw_set_alpha(1);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);

if (global.level_unlocked[selected_level]) {
    draw_set_color(c_lime);
    draw_text(room_width/2, panel_y - 20, "✓ UNLOCKED");
    
    draw_set_color(c_white);
    draw_set_alpha(0.8);
    draw_text(room_width/2, panel_y + 5, "PRESS ENTER TO START");
} else {
    draw_set_color(c_red);
    draw_text(room_width/2, panel_y - 20, "🔒 LOCKED");
    
    draw_set_color(c_orange);
    draw_set_alpha(0.8);
    draw_text(room_width/2, panel_y + 5, "COMPLETE LEVEL " + string(selected_level) + " TO UNLOCK");
}

// ========================
// PROGRESS BAR
// ========================
var unlocked_count = 0;
for (var i = 0; i < total_levels; i++) {
    if (global.level_unlocked[i]) unlocked_count++;
}

var progress = unlocked_count / total_levels;
var bar_width = 400;
var bar_x = room_width/2 - bar_width/2;
var bar_y = room_height - 40;

draw_set_alpha(0.3);
draw_set_color(c_gray);
draw_rectangle(bar_x, bar_y, bar_x + bar_width, bar_y + 8, false);

draw_set_alpha(0.8);
draw_set_color(c_aqua);
draw_rectangle(bar_x, bar_y, bar_x + (bar_width * progress), bar_y + 8, false);

draw_set_alpha(1);
draw_set_color(c_white);
draw_text(room_width/2, bar_y - 10, "PROGRESS: " + string(unlocked_count) + "/" + string(total_levels) + " LEVELS");

// ========================
// RESET SETTINGS
// ========================
draw_set_alpha(1);
draw_set_color(c_white);
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_font(-1);
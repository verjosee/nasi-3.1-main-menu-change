/// DRAW GUI EVENT - obj_level_select (X MERAH DIHAPUS, TEKS PANEL DIKECILKAN)

draw_set_halign(fa_center);
draw_set_valign(fa_middle);

// Background Gradien
for (var i = 0; i <= room_height; i += 4) {
    var t = i / room_height;
    var r = 10 + (t * 25);
    var g = 15 + (t * 15);
    var b = 45 + (t * 35);
    draw_set_color(make_color_rgb(r, g, b));
    draw_rectangle(0, i, room_width, i+4, false);
}

// Bintang Latar
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

// Nebula
draw_set_alpha(0.15);
for (var i = 0; i < 30; i++) {
    draw_set_color(choose(c_blue, c_aqua, c_purple));
    var px = room_width/2 + sin(anim_timer * 0.001 + i) * 300;
    var py = room_height/2 + cos(anim_timer * 0.002 + i) * 150;
    draw_circle(px, py, 80 + sin(anim_timer * 0.003 + i) * 20, false);
}
draw_set_alpha(1);

// Judul
draw_set_color(c_aqua);
draw_text_transformed(room_width/2, 60, "Level Select", 1.25, 1.25, 0);

draw_set_color(c_yellow);
draw_set_alpha(0.6);
draw_line(room_width/2 - 230, 92, room_width/2 - 90, 92);
draw_line(room_width/2 + 90, 92, room_width/2 + 230, 92);
draw_set_alpha(1);

// ========================
// LEVEL SELECTOR - TANPA X MERAH
// ========================
var start_x = room_width/2 - 440;
var start_y = room_height/2 - 50;
var spacing = 220;

for (var i = 0; i < total_levels; i++) {
    var level_x, level_y;
    
    if (i < 5) {
        level_x = start_x + (i * spacing);
        level_y = start_y - 90;
    } else {
        level_x = start_x + ((i - 5) * spacing);
        level_y = start_y + 100;
    }
   
    var is_unlocked = global.level_unlocked[i] || (variable_global_exists("debug_unlock_all") && global.debug_unlock_all);
    var is_selected = (i == selected_level);
    var level_num = i + 1;
    var scale = hover_scale[i];

    // Glow
    if (is_selected && is_unlocked) {
        draw_set_alpha(0.35 + sin(anim_timer * 0.1) * 0.1);
        draw_set_color(c_yellow);
        draw_circle(level_x, level_y, 58 * scale, false);
        draw_set_alpha(1);
    }

    // Lingkaran utama
    if (is_unlocked) {
        draw_set_alpha(0.95);
        draw_set_color(c_blue);
        draw_circle(level_x, level_y, 48 * scale, false);
        
        draw_set_alpha(0.45);
        draw_set_color(c_aqua);
        draw_circle(level_x, level_y, 42 * scale, true);
    } else {
        draw_set_alpha(0.75);
        draw_set_color(c_dkgray);
        draw_circle(level_x, level_y, 48 * scale, false);
    }

    // Isi
    draw_set_alpha(1);
    if (is_unlocked) {
        draw_set_color(c_white);
        draw_text_transformed(level_x, level_y, string(level_num), 2.0 * scale, 2.0 * scale, 0);
        
        // Bintang completed
        if (variable_global_exists("level_completed") && array_length(global.level_completed) > i && global.level_completed[i]) {
            draw_set_color(c_yellow);
            draw_text_transformed(level_x + 35, level_y - 35, "*", 1.5, 1.5, 0);
        }
    } else {
        draw_set_color(c_ltgray);
        draw_text_transformed(level_x, level_y, "?", 2.5 * scale, 2.5 * scale, 0);
        // X MERAH DIHAPUS - tidak ada lagi teks di bawahnya
    }

    // Outline selected
    if (is_selected) {
        draw_set_alpha(0.85);
        draw_set_color(c_yellow);
        draw_circle(level_x, level_y, 55 * scale, false);
        draw_set_alpha(1);
    }

    // Label LEVEL
    draw_set_alpha(0.75);
    draw_set_color(c_white);
    draw_text(level_x, level_y + 80, "LEVEL " + string(level_num));
}

// ========================
// INFO PANEL - TEKS DIKECILKAN
// ========================
var panel_y = room_height - 125;
draw_set_alpha(0.35);
draw_set_color(c_black);
draw_rectangle(room_width/2 - 270, panel_y - 48, room_width/2 + 270, panel_y + 48, false);
draw_set_alpha(0.55);
draw_rectangle(room_width/2 - 268, panel_y - 46, room_width/2 + 268, panel_y + 46, true);
draw_set_alpha(1);

var selected_unlocked = global.level_unlocked[selected_level] || (variable_global_exists("debug_unlock_all") && global.debug_unlock_all);
if (selected_unlocked) {
    draw_set_color(c_lime);
    draw_text_transformed(room_width/2, panel_y - 15, "UNLOCKED", 0.9, 0.9, 0);
    draw_set_color(c_white);
    draw_text_transformed(room_width/2, panel_y + 18, "PRESS ENTER TO START", 0.8, 0.8, 0);
} else {
    draw_set_color(c_red);
    draw_text_transformed(room_width/2, panel_y - 15, "LOCKED", 0.9, 0.9, 0);
    draw_set_color(c_orange);
    draw_text_transformed(room_width/2, panel_y + 18, "COMPLETE PREVIOUS LEVEL TO UNLOCK", 0.7, 0.7, 0);
}

if (variable_global_exists("level_highscores") && array_length(global.level_highscores) > selected_level) {
    draw_set_halign(fa_right);
    draw_set_valign(fa_top);
    draw_set_color(c_yellow);
    draw_text_transformed(room_width - 30, 30, "HIGHSCORE LV " + string(selected_level + 1) + ": " + string(global.level_highscores[selected_level]), 0.85, 0.85, 0);
}

// Reset alignment
draw_set_halign(fa_center);
draw_set_valign(fa_middle);

// Progress Bar
var unlocked_count = 0;
for (var i = 0; i < total_levels; i++) {
    if (global.level_unlocked[i]) unlocked_count++;
}
var progress = unlocked_count / total_levels;

draw_set_alpha(0.3);
draw_set_color(c_gray);
draw_rectangle(room_width/2 - 200, room_height - 45, room_width/2 + 200, room_height - 35, false);

draw_set_alpha(0.85);
draw_set_color(c_aqua);
draw_rectangle(room_width/2 - 200, room_height - 45, room_width/2 - 200 + (400 * progress), room_height - 35, false);

draw_set_alpha(1);
draw_set_color(c_white);
draw_text_transformed(room_width/2, room_height - 65, "PROGRESS: " + string(unlocked_count) + "/" + string(total_levels) + " LEVELS", 0.9, 0.9, 0);

// Reset
draw_set_alpha(1);
draw_set_color(c_white);
draw_set_halign(fa_left);
draw_set_valign(fa_top);
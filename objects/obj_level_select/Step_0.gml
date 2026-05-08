/// STEP EVENT - obj_level_select (Hitbox + Room Level 1-10)

anim_timer += 1;

// Update hover scale
for (var i = 0; i < total_levels; i++) {
    if (hover_scale[i] > 1) {
        hover_scale[i] = max(1, hover_scale[i] - 0.05);
    }
}

// ========================
// BACK BUTTON
// ========================
var back_x = 30;
var back_y = 30;
var back_w = 100;
var back_h = 40;

hover_back = false;

if (mouse_x >= back_x && mouse_x <= back_x + back_w && mouse_y >= back_y && mouse_y <= back_y + back_h) {
    hover_back = true;
    window_set_cursor(cr_handpoint);
    
    if (mouse_check_button_pressed(mb_left)) {
        var snd = audio_play_sound(click, 1, false);
        audio_sound_gain(snd, global.sfx_volume);
        room_goto(room_menu);
    }
}

// ========================
// KEYBOARD SELECT
// ========================
if (keyboard_check_pressed(vk_enter) || keyboard_check_pressed(vk_space)) {
    if (global.level_unlocked[selected_level]) {
        global.current_level = selected_level + 1;
        
        // Pilih room berdasarkan level
        var target_room = asset_get_index("room_level" + string(global.current_level));
        
        if (room_exists(target_room)) {
            room_goto(target_room);
        } else {
            show_message("Room level " + string(global.current_level) + " belum dibuat!");
        }
    } else {
        show_message("🔒 Level " + string(selected_level + 1) + " is locked!");
    }
}

// ========================
// ESC TO GO BACK
// ========================
if (keyboard_check_pressed(vk_escape)) {
    room_goto(room_menu);
}

// ========================
// MOUSE HITBOX & SELECT
// ========================
var m_x = mouse_x;
var m_y = mouse_y;

// Calculate responsive spacing based on room width (same as Draw event)
var total_width_needed = 5 * 200;
var available_width = room_width - 100;
var spacing = min(200, available_width / 5);
var start_x = room_width/2 - (spacing * 4) / 2;
var start_y = room_height/2 - 50;
var radius = 55;

var is_hovering = false;

for (var i = 0; i < total_levels; i++) {
    var level_x = (i < 5) ? start_x + (i * spacing) : start_x + ((i - 5) * spacing);
    var level_y = (i < 5) ? start_y - 90 : start_y + 100;
    
    if (point_distance(m_x, m_y, level_x, level_y) < radius) {
        selected_level = i;
        hover_scale[i] = min(1.15, hover_scale[i] + 0.08);
        is_hovering = true;
        window_set_cursor(cr_handpoint);
        
        if (mouse_check_button_pressed(mb_left)) {
            var snd = audio_play_sound(click, 1, false);
            audio_sound_gain(snd, global.sfx_volume);
            if (global.level_unlocked[selected_level]) {
                global.current_level = selected_level + 1;
                
                // Pilih room berdasarkan level (room_level1, room_level2, ...)
                var target_room_name = "room_level" + string(global.current_level);
                var target_room = asset_get_index(target_room_name);
                
                if (room_exists(target_room)) {
                    room_goto(target_room);
                } else {
                    show_message("Room " + target_room_name + " belum dibuat!");
                }
            } else {
                show_message("🔒 Level " + string(selected_level + 1) + " is locked!");
            }
        }
    }
}

if (!is_hovering && !hover_back) {
    window_set_cursor(cr_default);
}

// Animasi bintang
for (var i = 0; i < 200; i++) {
    bintang_alpha[i] += 0.003 * (irandom(2) - 1);
    if (bintang_alpha[i] > 0.9) bintang_alpha[i] = 0.9;
    if (bintang_alpha[i] < 0.1) bintang_alpha[i] = 0.1;
}

// F11 Fullscreen
if (keyboard_check_pressed(vk_f11)) {
    window_set_fullscreen(!window_get_fullscreen());
}
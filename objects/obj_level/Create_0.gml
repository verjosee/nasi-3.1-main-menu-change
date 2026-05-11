// Set level based on room name
var room_name = room_get_name(room);
if (string_pos("room_level", room_name) == 1) {
    var level_num = real(string_delete(room_name, 1, 10)); // Remove "room_level" prefix
    global.level = clamp(level_num, 1, 10);
} else {
    global.level = 1; // Default level
}

// Play background music based on level (no intro music in game levels)
audio_stop_all(); // Stop any currently playing music

var sound_index = 0;
if (global.level <= 2) sound_index = Sound1;
else if (global.level <= 4) sound_index = Sound2;
else if (global.level <= 6) sound_index = Sound3;
else if (global.level <= 8) sound_index = Sound4;
else sound_index = Sound5;

if (audio_exists(sound_index)) {
    audio_play_sound(sound_index, 1, true); // Loop the background music
    var vol = variable_global_exists("music_volume") ? global.music_volume : 0.7;
    audio_sound_gain(sound_index, vol);
    global.current_music = sound_index; // Simpan musik saat ini
}

spawn_rate = 45;
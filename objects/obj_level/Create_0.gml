// Set level based on room name
var room_name = room_get_name(room);
if (string_pos("room_level", room_name) == 1) {
    var level_num = real(string_delete(room_name, 1, 10)); // Remove "room_level" prefix
    global.level = clamp(level_num, 1, 10);
} else {
    global.level = 1; // Default level
}

spawn_rate = 45;           // mulai agak sering
alarm[0] = 10;
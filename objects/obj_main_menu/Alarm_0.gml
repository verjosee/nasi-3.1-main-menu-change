/// ALARM 0 EVENT
switch (selected) {
    case 0: 
        global.current_level = 1;
        room_goto(rm_game); 
        break;
    case 1: 
        room_goto(rm_select_level); 
        break;
    case 2: 
        game_end(); 
        break;
}
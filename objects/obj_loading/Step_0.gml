timer += 1;

if (timer mod 15 == 0) {
    dots = (dots + 1) mod 4;
    if (dots == 0) loading_text = "LOADING";
    else if (dots == 1) loading_text = "LOADING.";
    else if (dots == 2) loading_text = "LOADING..";
    else loading_text = "LOADING...";
}

// Pindah setelah 2 detik
if (timer >= 120) {
    room_goto(target_room);
}
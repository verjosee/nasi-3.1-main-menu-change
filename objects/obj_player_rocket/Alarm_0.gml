// ========================
// SPAWN WINGMAN (HANYA SEKALI)
// ========================
if (!wingman_spawned) {
    // Spawn wingman atas
    var wingman_top = instance_create_layer(x, y, "Instances", obj_wingman);
    wingman_top.position = "top";
    wingman_top.orbit_angle = -90;
    
    // Spawn wingman bawah
    var wingman_bottom = instance_create_layer(x, y, "Instances", obj_wingman);
    wingman_bottom.position = "bottom";
    wingman_bottom.orbit_angle = 90;
    
    wingman_spawned = true;
}
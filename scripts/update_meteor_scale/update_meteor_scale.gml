// Function terpusat untuk update skala meteor
function update_meteor_scale() {
    // Pastikan full_scale sudah ada (harus di-set di Create Event)
    if (!variable_instance_exists(id, "full_scale")) {
        show_debug_message("ERROR: full_scale not set for meteor!");
        return;
    }

    // Pastikan max_hp valid dan tidak nol
    if (!variable_instance_exists(id, "max_hp") || max_hp <= 0) {
        show_debug_message("ERROR: max_hp invalid for meteor!");
        return;
    }

    // Jumlah hit yang sudah diterima
    var hits_taken = max_hp - hp;
    if (hits_taken < 0) hits_taken = 0;

    // Penurunan skala setiap hit, tidak langsung proporsional
    var shrink_step = full_scale * 0.1;
    var new_scale = full_scale - (hits_taken * shrink_step);

    // Pastikan skala tidak terlalu kecil
    if (new_scale < full_scale * 0.4) new_scale = full_scale * 0.4;

    image_xscale = new_scale;
    image_yscale = new_scale;
}
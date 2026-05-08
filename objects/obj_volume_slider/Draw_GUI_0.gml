/// Draw GUI Event - Volume Slider
draw_set_halign(fa_center);
draw_set_valign(fa_middle);

// Draw slider track
draw_set_alpha(0.8);
draw_set_color(make_color_rgb(70, 80, 110));
draw_roundrect(slider_x, slider_y - slider_height/2, slider_x + slider_width, slider_y + slider_height/2, 8);

// Draw filled portion
var fill_x = slider_x + slider_width * value;
draw_set_alpha(1);
draw_set_color(c_lime);
draw_roundrect(slider_x, slider_y - slider_height/2, fill_x, slider_y + slider_height/2, 8);

// Calculate handle position
var handle_x = slider_x + slider_width * value;

// Draw meteor handle
draw_set_alpha(1);
var meteor_scale = 0.6;

if (sprite_exists(spr_meteor)) {
    draw_sprite_ext(spr_meteor, 0, handle_x, slider_y, meteor_scale, meteor_scale, rotation, c_white, 1);
} else {
    // Fallback: draw circle if sprite doesn't exist
    draw_set_color(dragging ? c_yellow : (hover ? c_white : c_ltgray));
    draw_circle(handle_x, slider_y, handle_size/2, false);
    
    // Add rotation indicator lines
    draw_set_color(c_orange);
    for (var i = 0; i < 4; i++) {
        var angle = degtorad(rotation + i * 90);
        var x1 = handle_x + cos(angle) * (handle_size/2 - 4);
        var y1 = slider_y + sin(angle) * (handle_size/2 - 4);
        var x2 = handle_x + cos(angle) * (handle_size/2 + 2);
        var y2 = slider_y + sin(angle) * (handle_size/2 + 2);
        draw_line(x1, y1, x2, y2);
    }
}

// Draw percentage text
draw_set_font(fnt_score);
draw_set_color(c_white);
draw_set_halign(fa_center);
draw_set_alpha(0.9);
var label = slider_type == "music" ? "MUSIC" : "SFX";
draw_text_transformed(slider_x + slider_width/2, slider_y - 40, label + ": " + string(round(value * 100)) + "%", 0.8, 0.8, 0);

// Reset alignment
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_alpha(1);
draw_set_color(c_white);

image_alpha -= fade_speed;
image_xscale -= 0.12;

if (image_alpha <= 0) instance_destroy();
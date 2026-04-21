alpha -= 0.018;
scale = 1.2 + (1 - alpha) * 0.8;   // membesar sedikit lalu menghilang

if (alpha <= 0) instance_destroy();
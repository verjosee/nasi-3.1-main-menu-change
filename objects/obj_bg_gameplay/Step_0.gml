/// STEP EVENT

// Bintang berkedip
for (var i = 0; i < 150; i++) {
    bintang_alpha[i] += 0.003 * (irandom(2) - 1);
    if (bintang_alpha[i] > 0.9) bintang_alpha[i] = 0.9;
    if (bintang_alpha[i] < 0.2) bintang_alpha[i] = 0.2;
}
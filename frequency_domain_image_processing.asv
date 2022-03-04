figure,
img_path = "img/peppers.tif";

img = imread(img_path);
subplot(2, 2, 1);
imshow(img);
title('Original Image');

img_ilpf = ilpf(img);
subplot(2, 2, 2);
imshow(img_ilpf);
title('Ideal Low Pass Filtered');

img_glpf = glpf(img);
subplot(2, 2, 3);
imshow(img_glpf);
title('Gaussian Low Pass Filtered');

img_blpf = blpf(img);
subplot(2, 2, 4);
imshow(img_blpf);
title('Butterworth Low Pass Filtered');

figure,
img = imread(img_path);
subplot(2, 2, 1);
imshow(img);
title('Original Image');

img_ihpf = ihpf(img);
subplot(2, 2, 2);
imshow(img_ihpf);
title('Ideal High Pass Filtered');

img_ghpf = ghpf(img);
subplot(2, 2, 3);
imshow(img_ghpf);
title('Gaussian High Pass Filtered');

img_bhpf = bhpf(img);
subplot(2, 2, 4);
imshow(img_bhpf);
title('Butterworth High Pass Filtered');

figure,
img_path = "img/dark_image.png";
img = imread(img_path);
subplot(1, 4, 1); imshow(img); title('Original Image');

[M,N] = size(img);
[img_out, spectrum_i, spectrum_f] = frequency_domain_image_brightening(img, 2.3);
subplot(1,4,2); imshow(spectrum_i,[]); title('Spectrum Initial');
subplot(1,4,3); imshow(spectrum_f,[]); title('Spectrum Final');
subplot(1,4,4); imshow(img_out); title('Final Image');

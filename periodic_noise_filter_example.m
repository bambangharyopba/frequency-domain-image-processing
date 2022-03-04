
img_path = "img/lena-distorted-left.JPG";

img = imread(img_path);
img = rgb2gray(img);

% figure,
% subplot(1, 5, 1); imshow(img); title('Original Image');
% 
% % specified excluded area
[M,N] = size(img);
% [img_out, spectrum_i, filter, spectrum_f] = filter_periodic_noise(img, 5.2, 1, M, round(N/2)-13, round(N/2)+13, round(M/2)-13, round(M/2)+13, 1, N);
% subplot(1,5,2); imshow(spectrum_i,[]); title('Spectrum Initial');
% subplot(1,5,3); imshow(filter); title('Filter');
% subplot(1,5,4); imshow(spectrum_f,[]); title('Spectrum Final');
% subplot(1,5,5); imshow(img_out); title('Final Image');
% 
% figure,
% subplot(1, 5, 1); imshow(img); title('Original Image');
% 
% % specified excluded area
% [M,N] = size(img);
% [img_out, spectrum_i, filter, spectrum_f] = filter_periodic_noise(img, 5.2, 1, M, round(N/2)-13, round(N/2)+13);
% subplot(1,5,2); imshow(spectrum_i,[]); title('Spectrum Initial');
% subplot(1,5,3); imshow(filter); title('Filter');
% subplot(1,5,4); imshow(spectrum_f,[]); title('Spectrum Final');
% subplot(1,5,5); imshow(img_out); title('Final Image');

figure,
subplot(1, 5, 1); imshow(img); title('Original Image');

% default excluded area
[img_out, spectrum_i, filter, spectrum_f] = filter_periodic_noise(img, 5.2);
subplot(1,5,2); imshow(spectrum_i,[]); title('Spectrum Initial');
subplot(1,5,3); imshow(filter); title('Filter');
subplot(1,5,4); imshow(spectrum_f,[]); title('Spectrum Final');
subplot(1,5,5); imshow(img_out); title('Final Image');
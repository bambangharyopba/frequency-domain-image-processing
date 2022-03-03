function [img_out, filter, spectrum] = ihpf(img)
    [M, N] = size(img);
    P = 2 * M;
    Q = 2 * N;

    imgp = pad_image(img);
    F = fft2(double(imgp));

    D0 = 50;
    D = mask(P, Q);
    H = double(D > D0);
    filter = H;

    img_out = H.*F;
    img_out = real(ifft2(img_out));
    img_out = img_out(1:M, 1:N);

    Fc = fftshift(fft2(imgp));
    S2 = log(1+abs(Fc));
    spectrum = S2;
end

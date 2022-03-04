function [img_out, filter, spectrum] = glpf(img, D0)
    if ~exist('D0','var')
        D0 = 50;
    end

    [M, N] = size(img);
    P = 2 * M;
    Q = 2 * N;

    imgp = pad_image(img);
    F = fft2(double(imgp));

    D = mask(P, Q);
    H = exp(-(D.^2)./(2*(D0^2)));
    filter = fftshift(H);

    img_out = H.*F;
    img_out = real(ifft2(img_out));
    img_out = img_out(1:M, 1:N);

    Fc = fftshift(fft2(imgp));
    S2 = log(1+abs(Fc));
    spectrum = S2;
end 

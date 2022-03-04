function [img_out, filter, spectrum] = glpf(img, D0)
    if ~exist('D0','var')
        D0 = 50;
    end

    [row, column, channel] = size(img);
    P = 2 * row;
    Q = 2 * column;
    imgp = pad_image(img);
    img_out = zeros(row, column, channel);
    spectrum = zeros(P, Q, channel);

    for k = 1:channel
        imgp_channel = imgp(:,:,k);
        F = fft2(double(imgp_channel));
        D = mask(P, Q);
        H = exp(-(D.^2)./(2*(D0^2)));
        filter = fftshift(H);

        LPF_f = H.*F;
        LPF_f = real(ifft2(LPF_f));
        img_out(:,:,k) = LPF_f(1:row, 1:column);

        Fc = fftshift(fft2(imgp_channel));
        S2 = log(1+abs(Fc));
        spectrum(:,:,k) = S2;
    end
end

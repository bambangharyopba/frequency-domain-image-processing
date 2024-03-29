function [img_out, filter, spectrum] = blpf(img, D0, n)
    if ~exist('n','var')
        n = 1;
    end

    if ~exist('D0','var')
        D0 = 50;
    end

    [row, column, channel] = size(img);
    P = 2 * row;
    Q = 2 * column;
    imgp = pad_image(img);
    img_out = zeros(row, column, channel);
    spectrum = log(abs(fftshift(fft2(imgp))));

    for k = 1:channel
        imgp_channel = imgp(:,:,k);
        F = fft2(double(imgp_channel));
        D = mask(P, Q);
        H = 1./(1 + (D./D0).^(2*n));
        filter = fftshift(H);

        LPF_f = H.*F;
        LPF_f = real(ifft2(LPF_f));
        img_out(:,:,k) = LPF_f(1:row, 1:column);
    end
end

function [img_out, filter, spectrum] = ghpf(img, D0)
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
        H = 1 - exp(-(D.^2)./(2*(D0^2)));
        filter = fftshift(H);

        HPF_f = H.*F;
        HPF_f = real(ifft2(HPF_f));
        img_out(:,:,k) = HPF_f(1:row, 1:column);
    end
end

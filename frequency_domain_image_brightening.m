function [img_out, spectrum_i, spectrum_f] = frequency_domain_image_brightening(img, factor)
    if ~exist('factor','var')
        factor = 2.3;
    end

    F = fft2(im2double(img));
    spectrum_i = log(abs(fftshift(F)));

    fourier_out = F * factor;
    spectrum_f = log(abs(fftshift(fourier_out)));
    img_out = real(ifft2(fourier_out));
end

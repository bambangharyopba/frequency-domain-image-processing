function [img_out, spectrum_i, filter, spectrum_f] = filter_periodic_noise(img, amplitude_threshold, r1_i, r1_f, c1_i, c1_f, r2_i, r2_f, c2_i, c2_f)
%filter_periodic_noise Restore image with periodic noise
%   img                     : image
%   amplitude_threshold     : maximum spectrum value
%   excluded spectrum area
%   r                       : spectrum area row
%   c                       : spectrum area column
    % Change to frequency domain
    F = fft2(im2double(img));
    F2 = fftshift(F); % move origin to center of frequency rectangle
    S = log(abs(F2)); % compute magnitude and brighten display

    % Create filter
    filter = S > amplitude_threshold;
    excluded_area = false;
    
    % if excluded area 1 exist
    if exist('r1_i','var') && exist('r1_f','var') && exist('c1_i','var') && exist('c1_f','var')
        filter(r1_i:r1_f, c1_i:c1_f) = 0; % excluded area
        excluded_area = true;
    end
    
    % if excluded area 2 exist
    if exist('r2_i','var') && exist('r2_f','var') && exist('c2_i','var') && exist('c2_f','var')
        filter(r2_i:r2_f, c2_i:c2_f) = 0; % excluded area
        excluded_area = true;
    end

    % default excluded spectrum
    if ~excluded_area
        [M,N] = size(img);
        filter(round(M/2)-round(M/60):round(M/2)+round(M/60), round(N/2)-round(N/60):round(N/2)+round(N/60)) = 0;
    end

    % Filter frequency
    F2(filter) = 0;

    % Change to spatial domain
    img_out = real(ifft2(ifftshift(F2)));
    spectrum_i = S;
    spectrum_f = log(abs(F2));
end
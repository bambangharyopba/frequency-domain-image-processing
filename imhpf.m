function [img_out, filter, spectrum] = imhpf(img, D0, option, n)
    options = ['ideal', 'butterworth', 'gaussian'];

    if ~exist('option','var')
        option = 'ideal';
    end
    
    if ~ismember(option, options)
        return;
    end

    [M,N] = size(img);
    P = 2*M;
    Q = 2*N;

    img = im2double(img);
    imgp = zeros(P,Q);
    for i = 1:P
        for j = 1:Q
            if i <= M && j <= N
                imgp(i,j) = img(i,j);
            else
                imgp(i,j) = 0;
            end
        end
    end

    F = fft2(double(imgp));

    u = 0:(P-1);
    v = 0:(Q-1);
    
    idx = find(u > P/2);
    u(idx) = u(idx) - P;
    idy = find(v > Q/2);
    v(idy) = v(idy) - Q;
    
    [V, U] = meshgrid(v, u);
    D = sqrt(U.^2 + V.^2);
    
    if(strcmp(option,'ideal'))
        H = D > D0;
    elseif(strcmp(option, 'butterworth'))
        H = 1./(1+(D0./D).^(2*n));
    elseif(strcmp(option, 'gaussian'))
        H = 1 - exp(-(D.^2)./(2*(D0^2)));
    end
    
    HPF_f = H.*F;
    
    HPF_f2 = real(ifft2(HPF_f));   
    HPF_f2 = HPF_f2(1:M, 1:N);
    
    Fc = fftshift(fft2(imgp));
    S2 = log(1+abs(Fc));
    
    img_out = HPF_f2;
    filter = H;
    spectrum = S2;
end
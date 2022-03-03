function [imgp, P, Q] = pad_image(img)
    [M, N] = size(img);
    P = 2 * M;
    Q = 2 * N;

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
end


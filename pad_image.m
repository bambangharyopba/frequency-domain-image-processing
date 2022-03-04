function [imgp, P, Q] = pad_image(img)
    [row, column, channel] = size(img);
    P = 2 * row;
    Q = 2 * column;

    img = im2double(img);
    imgp = zeros(P, Q, channel);
    for k = 1:channel
        for i = 1:P
            for j = 1:Q
                if i <= row && j <= column
                    imgp(i,j,k) = img(i,j,k);
                else
                    imgp(i,j,k) = 0;
                end
            end
        end
    end
end

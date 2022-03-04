function D = mask(P, Q)
    u = 0:(P-1);
    v = 0:(Q-1);

    idx = find(u > P/2);
    u(idx) = u(idx) - P;
    idy = find(v > Q/2);
    v(idy) = v(idy) - Q;

    [V, U] = meshgrid(v, u);
    D = sqrt(U.^2 + V.^2);
end

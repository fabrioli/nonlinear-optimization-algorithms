function [x, z] = miFR(f, grad_f, x1, epsilon)
    y = x1;
    k = 1;
    d = -grad_f(y);
    n = length(x1);

    while norm(grad_f(y)) >= epsilon
        for j = 1:n
            phi = @(lambda) f(y + lambda * d);
            lambda_j = fminbnd(phi, 0, 1);
            y = y + lambda_j * d;
            if j < n
                alpha_j = (norm(grad_f(y))^2) / (norm(grad_f(y - lambda_j * d))^2);
                d = -grad_f(y) + alpha_j * d;
            else
                x1 = y;
                k = k + 1;
            end
        end
    end
    
    x = x1;
    z = f(x);
end

function [x,z]= miHJ(f,x0,eps)
x=x0;
y=x;
error= 2*eps;
n= size(x0,1);

while error>=eps
    for i = 1:n
        ei= zeros(n,1);
        ei(i)=1;
        g=@(L)(f(y+L*ei));
        L_i= fminbnd(g,-20,20);
        y= y + ei*L_i;
    end
    if norm(x-y)<eps
        x=y;
        z= f(x);
        error= norm(x-y);
        
    else
        d= y-x;
        h= @(L)f(y+L*d);
        L_i= fminbnd(h,-20,20);
        y= y+L_i*d;
        error= norm(x-y);
        x=y;
        z=f(x);
    end
end

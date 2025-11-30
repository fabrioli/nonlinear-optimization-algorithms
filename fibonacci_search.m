function y = minfib(f,x,eps)
L= x(2)-x(1);
Fn = L/eps;
n=1;
while fibonacci(n)<Fn
    n=n+1;
end
an= (fibonacci(n-1)/fibonacci(n))*(x(1)-x(2))+x(2);
bn= (fibonacci(n-1)/fibonacci(n))*(x(2)-x(1))+x(1);
fa= f(an);
fb= f(bn);
for k=1:n-2
    if fa<=fb
        x(2)= bn;
        bn = an;
        an= (fibonacci(n-k-1)/fibonacci(n-k))*(x(1)-x(2))+x(2);

        fb=fa;
        fa= f(an);
    else
        x(1)=an;
        an = bn;
        bn = (fibonacci(n-k-1)/fibonacci(n-k))*(x(2)-x(1))+x(1);
        fa=fb;
        fb=f(bn);
    end
end
y= [x(1),x(2)];

function F= fibonacci(n) % este fibonacci empieza como fibonacci(1)=1, fibonacci(2)= 2... y por defecto muestra que fibonacci(0)= 1
F0=1 ; F1=1;
for k = 2:n
    a=F1;
    F1=F0+F1;
    F0=a;
end
F= F1;


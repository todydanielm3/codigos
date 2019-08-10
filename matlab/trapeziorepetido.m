function trapeziorepetido(a,b,n)

h = (b-a)/n;
soma = 0;

soma = soma + f(a);
soma = soma + f(b);

for i = 1:(n-1)
    soma = soma + 2*f(a+i*h);
end

integral = (h/2) * soma;
disp(integral);

function y = f(x)
y = sin(x);
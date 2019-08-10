function simpsonrepetido(a,b,n)

h = (b-a)/n;
soma = 0;

soma = soma + f(a);
soma = soma + f(b);

for i = 1:(n-1)
    if mod(i,2) == 0
       soma = soma + 2*f(a+i*h);
    elseif mod(i,2) == 1
       soma = soma + 4*f(a+i*h);
    end
end

integral = (h/3) * soma;
disp(integral);

function y = f(x)
y = sin(x);
function Newton(x,precisao);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Programa para calcular um zero de funcao com o Metodo de Newton-Raphson %
% Criterio de Parada:     (modulo(f(novo_x)) <= precisao)                 %
%                     ou (modulo(novo_x - x) <= precisao)                 % 
% Parametros de entrada:        x = aproximacao inicial                   %
%                        precisao = limite para o erro de aproximacao     %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

aux    = 1; 
cont   = 0;

disp(sprintf('%s','              x           f(x)           erro           erro'));
disp(sprintf('%s','                                       |f(x)|     |novo_x-x|'));

while aux == 1
    novo_x = x - f(x) / df(x);
    cont   = cont + 1;
    disp([sprintf('%15f',novo_x),sprintf('%15f',f(novo_x)),sprintf('%15f',abs(f(novo_x))),sprintf('%15f',abs(novo_x - x))]);
    if (abs(f(novo_x)) <= precisao) | (abs(novo_x - x) <= precisao)
        break;
    end
    x = novo_x;
end

disp (['O valor aproximado da raiz da funcao e: ',num2str(novo_x,16)]);
disp (['Aconteceram ',num2str(cont,16),' iteracoes.']);

% Entrada das funcoes %
function y=f(x)
y = (900*x^2/64+x^2)*(64+((30*x/sqrt(64+x^2))-x)^2)-400*((30*x/sqrt(64+x^2))-x)^2;
% Nao Altere | Nao Altere | Nao Altere | Nao Altere | Nao Altere | Nao Altere %
% Aproximacao para a derivada:                                                %
% A derivada de f(x) eh limite de (f(x+delta)-f(x))/delta, quando delta -> 0  %
function y=df(x)
delta = 0.001;
y     = (f(x+delta) - f(x)) / delta;
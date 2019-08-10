function Bisseccao(a, b, precisao);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Programa para calcular um zero de funcao com o Metodo da Bisseccao  %
% Calculo do erro: (b - a)/2                                          %
% Criterio de Parada: (erro <= precisao) ou (modulo(f(x)) <= precisao)% 
% Parametros de entrada:        a = limite inferior do intervalo      %
%                               b = limite superior do intervalo      %
%                        precisao = limite para o erro de aproximacao %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

aux  = 1; cont = 0;
fa   = f(a);
fb   = f(b);

if fa*fb > 0
    disp(' Nao podemos afirmar que exista raiz no intervalo ');
else
disp(sprintf('%s','              a              x              b           erro           erro'));
disp(sprintf('%s','                       (a+b)/2                       (b-a)/2         |f(x)|'));
    while aux == 1
        x    = (a + b)/2;
        fx   = f(x);
        erro = (b - a)/2;
        cont = cont + 1;
        disp([sprintf('%15f',a),sprintf('%15f',x),sprintf('%15f',b),sprintf('%15f',erro),sprintf('%15f',abs(fx))]);
        if fa*fx < 0
            b  = x;
            fb = fx;
        else
            a  = x;
            fa = fx;
        end
        if (erro <= precisao) | (abs(fx) <= precisao)
           break;
        end
    end
end

disp (['O valor aproximado da raiz da funcao e: ',num2str(x,16)]);
disp (['Aconteceram ',num2str(cont,16),' iteracoes.']);

% Entrada da funcao %
function y = f(x)
y = (900*x^2/64+x^2)*(64+((30*x/sqrt(64+x^2))-x)^2)-400*((30*x/sqrt(64+x^2))-x)^2;
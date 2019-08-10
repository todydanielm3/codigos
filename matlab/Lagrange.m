function lagrange(x,y)

if size(x) == size(y)
   [m,n] = size(x);
   
   %copias as abcissas x nas n linhas da matriz
   for cont = 1:n
       matrizx(cont,:) = x;
   end
   
   %toma as abcissas com excessao da diagonal principal
   %e joga em outra matriz
   coluna = 1;
   for i=1:n
       for j=1:n
           if i~=j
              novamatrizx(i,coluna) = matrizx(i,j);
              coluna = coluna + 1;
           end
       end
       coluna = 1;
   end
   disp(novamatrizx);
   
  %transforma cada linha da nova matriz em polinomio
   for linha = 1:n
       polinomios(linha,:) = poly(novamatrizx(linha,:));
   end
   disp(polinomios);
   
   %avalia cada polinomio
   for linha = 1:n
       avaliacoes(linha) = polyval(polinomios(linha,:),x(linha));
   end
   disp(avaliacoes);
   
   %multiplica cada polinomio
   for linha = 1:n
       polinomios(linha,:) = y(linha) * (1/avaliacoes(linha)) * polinomios(linha,:);
   end
   disp(polinomios);
   
   final = sum(polinomios);
   disp(final);
   
else
   disp('as matrizes devem ter a mesma dimensao')
   
end
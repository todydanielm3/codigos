function gauss_pivo(A,B)

[n,m] = size(A);

if n ~= m
    disp('Erro na entrada dos dados: A matriz dos coeficientes deve ser quadrada!!!');
    elseif length(B) ~= n
           disp(['Erro na entrada dos dados: Devem existir ',num2str(n),' termos independentes!!!']);
       elseif det(A) == 0
              disp('O sistema nao eh possivel determinado!!!');
else
    E=[A,B];
    mostra(E);
    pause;

    %pivoteamento
    for fila = 1:(n-1)
        [pivo,posicao] = max(abs(E(fila:end,fila)));
     
        troca = E(fila,:);
        E(fila,:) = E(posicao+(fila-1),:);
        E(posicao+(fila-1),:) = troca;
        
        mostra(E);
        pause;
               
        %escalonamento
        for lin = (fila+1):n
            multiplicador = E(lin,fila)/E(fila,fila);
            E(lin,:) = E(lin,:) - multiplicador * E(fila,:);
        end
     
        mostra(E);
        pause;
    end

    %resolucao
    X    = zeros(n,1);
    X(n) = E(n,n+1)/E(n,n);
    for lin = (n-1):-1:1
        soma = 0;
        for col = (lin+1):n
            soma = soma + E(lin,col)*X(col);
        end
        X(lin) = (E(lin,n+1) - soma) / E(lin,lin);
    end
    
    %apresentacao da solucao
    disp('A solucao eh: ');
    for i=1:n
        disp([sprintf('%s','x'),sprintf('%g',i),sprintf('%s',' = '),sprintf('%f',X(i))]);
    end    
end

function mostra(E);

[n,m]=size(E);

for lin=1:n
    for col=1:n
        if E(lin,col) > 0
           fprintf(1,'  +  %5.2f  x%g',abs(E(lin,col)),col);
        elseif E(lin,col) < 0
           fprintf(1,'  -  %5.2f  x%g',abs(E(lin,col)),col);
        else
           fprintf(1,'              ');
        end
    end
    fprintf(1,'  =  %5.2f',E(lin,m));
    fprintf(1,'\n');
end
fprintf(1,'\n');
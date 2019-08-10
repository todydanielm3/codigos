%Trabalho Introdução a processamento de Imagem%
%Aluno: Daniel Moraes - 180112333%

%-- Questão 2 --%

MRGB = imread('Mars.bmp'); %carregando a imagem
imshow(MRGB)%mostrando a imagem
cinza = rgb2gray (MRGB); %equalizando
imshow(cinza);
cinza_eq = histeq(cinza);%equalizando
imshow(cinza);
figure, cinza_eq = histeq(cinza); imshow(cinza_eq); %abrindo imagem equalizada 

Did you mean:
 eq(260,415)

ans =


     0

eq(815,1000)

ans =

     0


clear all
close all
clc
file='The White Stripes - Seven Nation Army.ogg';
[x1,fs]=audioread(file);  %lê o som do arquivo e salva em x1 e a frequencia de apostragem em fs
x=x1(:,1); % considera somente um canal do som (mono)
Ns = length(x); % pega o comprimento do sinal
t = (1/fs)*(1:Ns);  % descobre a duracao do sinal e normaliza o numero de pontos pela fs 

sound(x,fs)%escutar o som
pause(max(t))%espera o som tocar

Xk = abs(fft(x));  % calcula a DFT e utiliza somente a amplitude com abs()
Xk = Xk(1:Ns/2);   % pega somente a metade da transformada devido a simetria em relação ao zero
f = fs*(0:Ns/2-1)/Ns;  % gera o vetor de frequencia a partir de fs 

% Mostrando o sinal no dominio do tempo
figure('color','white')
subplot(2,1,1),plot(t, x,'color','blue')
xlabel('Tempo (s)')
ylabel('Amplitude')

% mostra o sinal no dominio da frequencia
subplot(2,1,2),plot(f, Xk/max(Xk))
xlim([0 500]) %seleciona regiao de interesse do grafico
xlabel('Frequencia (Hz)')
ylabel('Amplitude')



% UNIVERSIDADE ESTADUAL DE FEIRA DE SANTANA
% LARA ESQUIVEL DE BRITO SANTOS
% PROF ARMANDO SANCA SANCA
% PROCESSAMENTO DIGITAL DE SINAIS

% --- Parâmetros ---
fs = 2500;              % Frequência de amostragem (Hz)
T = 1;                  % Duração do sinal (segundos)
t = 0:1/fs:T-1/fs;      % Vetor de tempo

% --- Sinal ---
x = janela(1024);  %Professor caso queira executar outra janela, trocar o valor

%Descomentar para adicionar zeros a direita do sinal

x = [x,zeros(1,1024)];
N = length(x);

% --- Minha DFT e FFT ---

[my_dft, multiplicacao, somas] = Mydft(x,false);

%Comentar código abaixo para execução em casos cujo o vetor não é base de 2

[my_fft,somas_fft, multiplicacao_fft] = Myfft(x,false,0,0);

% --- FFT nativa para comparação ---
octave_fft = fft(x);

% --- Escalas ---
f = (0:N-1) * (fs / N);

% --- Gráficos ---
figure;

% DFT manual (discreto)
subplot(3,1,1);
stem(f, abs(my_dft), 'LineWidth', 1.5);
xlabel('Frequência (Hz)');
ylabel('|X(f)|');
title('DFT Manual (Discreto)');
grid on;

% FFT personalizada, comentar para observar execução futuras em casos de não potencia de 2
subplot(3,1,2);
stem(f, abs(my_fft), 'LineWidth', 1.5);
xlabel('Frequência (Hz)');
ylabel('|X(f)|');
title('FFT Manual (Discreto)');
grid on;

% FFT nativa (discreto)
subplot(3,1,3);
stem(f, abs(octave_fft), 'LineWidth', 1.5);
xlabel('Frequência (Hz)');
ylabel('|X(f)|');
title('FFT Nativa (Discreto)');
grid on;

xlim([0 2500]);

disp(['Tamanho de f: ', num2str(length(f))]);
disp(['Tamanho de my_dft: ', num2str(length(my_dft))]);
disp(['Tamanho de x: ', num2str(length(x))]);






% --- Figura para sinal original e reconstruções ---
figure;
x_orignal = cos(2*pi*100*t) + 3*cos(2*pi*250*t) + 5*cos(2*pi*750*t) + 7*cos(2*pi*1000*t);

t_j = (0 : N - 1)/fs

% Sinal original
subplot(2,1,1);
plot(t, x_orignal, 'LineWidth', 1.5);
xlabel('Tempo (s)');
ylabel('Amplitude');
title('Sinal Original');
grid on;

subplot(2,1,2);
plot(t_j, x, 'LineWidth', 1.5);
xlabel('Tempo (s)');
ylabel('Amplitude');
title('Sinal Original Janelado');
grid on;

xlim([0, max(t_j)]);
% Transformada inversa da DFT

figure;

[x_reconstructed_dft,inv_multiplicao_dft, inv_soma_dft] = Mydft(my_dft, true);  % Reconstrução usando DFT manual (se implementado)

subplot(3,1,1);
plot(t_j, real(x_reconstructed_dft), 'LineWidth', 1.5);
xlabel('Tempo (s)');
ylabel('Amplitude');
title('Reconstrução com DFT Manual (Contínuo)');
grid on;


% Reconstrução com MYFFF, comentar para execução em casos menores de 2



[my_fft_inverse, sum_inv_count, mult_inv_count] = Myfft(my_fft,true,0,0)
t_j = (0 : length(my_fft_inverse) - 1)/fs
subplot(3,1,2);
plot(t_j, real(my_fft_inverse), 'LineWidth', 1.5);
xlabel('Tempo (s)');
ylabel('Amplitude');
title('Reconstrução com FFT Manual(Contínuo)');
grid on;


subplot(3,1,3);
plot((0 : length(ifft(octave_fft)) -1)/fs, real(ifft(octave_fft)), 'LineWidth', 1.5);
xlabel('Tempo (s)');
ylabel('Amplitude');
title('Reconstrução com FFT NATIVA (Contínuo)');
grid on;

% Exibe o número de multiplicações e somas realizadas
fprintf('MYDFT Número de multiplicações: %d\n', multiplicacao);
fprintf('MYDFT Número de somas: %d\n', somas);

% Exibe o número de multiplicações e somas realizadas
fprintf('MYFFT Número de multiplicações: %d\n', multiplicacao_fft);
fprintf('MYFFT Número de somas: %d\n', somas_fft);%}

fprintf('MYIFFTDFT Número de multiplicações: %d\n', inv_multiplicao_dft);
fprintf('MYIDFT Número de somas: %d\n', inv_soma_dft);

printf('MYIFFT Número de multiplicações: %d\n', mult_inv_count);
fprintf('MYIFFT Número de somas: %d\n', sum_inv_count);
disp(length(my_fft_inverse))





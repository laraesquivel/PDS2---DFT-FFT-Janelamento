% UNIVERSIDADE ESTADUAL DE FEIRA DE SANTANA
% LARA ESQUIVEL DE BRITO SANTOS
% PROF ARMANDO SANCA SANCA
% PROCESSAMENTO DIGITAL DE SINAIS


function x_janelado = janela(j)
  fs = 2500;              % Frequência de amostragem (Hz)
  T = 1;                % Duração do sinal (segundos)
  t = 0:1/fs:T-1/fs;      % Vetor de tempo

  % --- Sinal ---
  x = cos(2*pi*100*t) + 3*cos(2*pi*250*t) + 5*cos(2*pi*750*t) + 7*cos(2*pi*1000*t);
  N = length(x);          % Comprimento do sinal




  % --- Janela Quadrada (Retangular) ---
  window = ones(1, j);  % Janela quadrada (vetor de uns)

  if N >= j
    x_janelado = x(1:j) .* window;  % Aplica a janela quadrada ao sinal

  else
    % Caso o sinal seja menor que a janela, apenas multiplica o sinal original por uns
    x_janelado = x .* window(1:N(x));


end



% UNIVERSIDADE ESTADUAL DE FEIRA DE SANTANA
% LARA ESQUIVEL DE BRITO SANTOS
% PROF ARMANDO SANCA SANCA
% PROCESSAMENTO DIGITAL DE SINAIS


function [X, somas, multiplicacao] = Myfft(x, inverse, somas, multiplicacao)
  % Inicializa os contadores na primeira chamada
  if nargin < 3
    somas = 0;
    multiplicacao = 0;
  end
  if nargin < 2
    inverse = false;
  end

  % Tamanho do vetor
  N = length(x);

  % Caso base: vetor unitário
  if N == 1
    X = x;
    return;
  end
  % Verifica se N é potência de 2
  if mod(N, 2) ~= 0
    error('O tamanho do vetor deve ser potência de 2., não implementei tratamento');
  end

  % Chamada recursiva para partes par (even) e ímpar (odd)
  [even, somas, multiplicacao] = Myfft(x(1:2:end), inverse, somas, multiplicacao);
  [odd, somas, multiplicacao] = Myfft(x(2:2:end), inverse, somas, multiplicacao);

  % Fator exponencial
  if inverse
    exp_factor = exp(2j * pi * (0:N/2-1) / N); % +2j pi para IFFT
  else
    exp_factor = exp(-2j * pi * (0:N/2-1) / N); % -2j pi para FFT
  end

  % Combinação das partes par e ímpar
  X = zeros(1, N); % Vetor de saída com tamanho correto
  for k = 1:N/2
    % Multiplicação pelo fator exponencial
    t = exp_factor(k) * odd(k);
    multiplicacao = multiplicacao + 1; % Contabiliza a multiplicação

    % Soma e subtração
    X(k) = even(k) + t;
    X(k + N/2) = even(k) - t;
    somas = somas + 2; % Contabiliza duas somas
  end

  % Normalização na IFFT
  if inverse
    X = X / N;
    multiplicacao = multiplicacao + N; % Cada divisão é uma multiplicação
  end
end



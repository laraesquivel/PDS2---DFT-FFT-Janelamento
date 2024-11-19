% UNIVERSIDADE ESTADUAL DE FEIRA DE SANTANA
% LARA ESQUIVEL DE BRITO SANTOS
% PROF ARMANDO SANCA SANCA
% PROCESSAMENTO DIGITAL DE SINAIS


function [X,multiplicacao,somas] = Mydft(x, inverse)

N = length(x);           % Comprimento do sinal
X = zeros(1, N);         % Inicializa a DFT manual
n = 0:N-1;               % Índices do tempo
k = 0:N-1;               % Índices da frequência

multiplicacao = 0;
somas = 0;

if inverse
    for kk = 1:N
        W = 0;  % Variável para armazenar o resultado da soma
        for nn = 1:N
            W_n = x(nn) * exp(1i * 2 * pi * (kk-1) * (nn-1) / N);
            W = W + W_n
            multiplicacao = multiplicacao + 1;  % Contador de multiplicações
        end
        X(kk) = W / N; % Finaliza o valor para a DFT
        somas = somas + (N - 1); % Contador de somas (N-1 por iteração)
    end

else
    for kk = 1:N
        W = 0;  % Variável para armazenar o resultado da soma
        for nn = 1:N
            % Multiplicação (x .* exp(...) )
            W_n = x(nn) * exp(-1i * 2 * pi * (kk-1) * (nn-1) / N);
            W = W + W_n; % Soma
            multiplicacao = multiplicacao + 1;  % Contador de multiplicações
        end
        X(kk) = W;  % Finaliza o valor para a DFT direta
        somas = somas + (N - 1); % Contador de somas (N-1 por iteração)
    end
end

end


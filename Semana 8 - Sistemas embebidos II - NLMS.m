clc;
clear all;
close all;


% Parámetros
mu = 0.01;  % Tasa de aprendizaje
N = 32;     % Orden del filtro
nIter = 10000; % Número de iteraciones
delta = 1e-3; % Pequeño valor para evitar divisiones por cero

% Señal de entrada
x = randn(nIter, 1);  % Señal de entrada aleatoria
d = filter([0.5 1.5], 1, x) + 0.1*randn(nIter, 1);  % Señal deseada con ruido

% Inicialización
w = zeros(N, 1);  % Coeficientes del filtro
y = zeros(nIter, 1);  % Salida del filtro
e = zeros(nIter, 1);  % Error

% Algoritmo NLMS
for n = N:nIter
    x_vec = x(n:-1:n-N+1);  % Vector de entrada al filtro
    y(n) = w' * x_vec;  % Salida del filtro
    e(n) = d(n) - y(n);  % Error
    w = w + (mu / (delta + x_vec' * x_vec)) * e(n) * x_vec;  % Actualización de coeficientes
end

% Gráfica del error
plot(e);
title('Error del algoritmo NLMS');
xlabel('Iteración');
ylabel('Error');

% Gráficas de la señal original y la señal filtrada
figure;
subplot(2, 1, 1);
plot(d);
title('Señal Deseada (Original)');
xlabel('Muestras');
ylabel('Amplitud');

subplot(2, 1, 2);
plot(y);
title('Señal Filtrada (Salida del LMS)');
xlabel('Muestras');
ylabel('Amplitud');
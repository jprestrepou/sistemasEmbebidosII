clc;
clear all;
close all;


% Parámetros
mu = 0.000001;  % Tasa de aprendizaje
N = 32;     % Orden del filtro
nIter = 100; % Número de iteraciones

% Señal de entrada
x = randn(nIter, 1);  % Señal de entrada aleatoria
d = filter([0.5 1.5], 1, x) + 0.1*randn(nIter, 1);  % Señal deseada con ruido

% Inicialización
w = zeros(N, 1);  % Coeficientes del filtro
y = zeros(nIter, 1);  % Salida del filtro
e = zeros(nIter, 1);  % Error

% Algoritmo LMS
for n = N:nIter
    x_vec = x(n:-1:n-N+1);  % Vector de entrada al filtro
    y(n) = w' * x_vec;  % Salida del filtro
    e(n) = d(n) - y(n);  % Error
    w = w + mu * e(n) * x_vec;  % Actualización de coeficientes
end

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

% Gráfica del error
figure;
plot(e);
title('Error del algoritmo LMS');
xlabel('Iteración');
ylabel('Error');

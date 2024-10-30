% Parámetros
lambda = 0.8;  % Factor de olvido
delta = 1e-2;  % Parámetro de regularización
N = 32;  % Orden del filtro
nIter = 1000;  % Número de iteraciones

% Señal de entrada
x = randn(nIter, 1);  % Señal de entrada aleatoria
d = filter([0.5 1.5], 1, x); %+ 0.1*randn(nIter, 1);  % Señal deseada con ruido

% Inicialización
w = zeros(N, 1);  % Coeficientes del filtro
P = delta * eye(N);  % Matriz de correlación inversa
y = zeros(nIter, 1);  % Salida del filtro
e = zeros(nIter, 1);  % Error

% Algoritmo RLS
for n = N:nIter
    x_vec = x(n:-1:n-N+1);  % Vector de entrada al filtro
    k = (P * x_vec) / (lambda + x_vec' * P * x_vec);  % Ganancia de Kalman
    y(n) = w' * x_vec;  % Salida del filtro
    e(n) = d(n) - y(n);  % Error
    w = w + k * e(n);  % Actualización de coeficientes
    P = (P - k * x_vec' * P) / lambda;  % Actualización de la matriz de correlación inversa
end

% Gráfica del error
plot(e);
title('Error del algoritmo RLS');
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

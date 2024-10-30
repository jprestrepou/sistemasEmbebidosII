% Parámetros
Fs = 1000;  % Frecuencia de muestreo original
t = 0:1/Fs:1;  % Tiempo
f = 50;  % Frecuencia de la señal

% Señal original
x = sin(2 * pi * f * t);

% Undersampling
M = 6;  % Factor de undersampling
y_downsampled = downsample(x, M);

% Gráfica
subplot(2,1,1);
plot(t, x);
title('Señal original');
xlabel('Tiempo [s]');
ylabel('Amplitud');

subplot(2,1,2);
t_downsampled = t(1:M:end);
plot(t_downsampled, y_downsampled);
title(['Señal downsampled (factor ', num2str(M), ')']);
xlabel('Tiempo [s]');
ylabel('Amplitud');

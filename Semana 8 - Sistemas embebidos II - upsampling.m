% Parámetros
Fs = 1000;  % Frecuencia de muestreo original
t = 0:1/Fs:1;  % Tiempo
f = 50;  % Frecuencia de la señal

% Señal original
x = sin(2 * pi * f * t);

% Upsampling
L = 2;  % Factor de upsampling
y_upsampled = upsample(x, L);

% Vector de tiempo ajustado para la señal upsampled
t_upsampled = 0:1/(Fs*L):(length(y_upsampled)-1)/(Fs*L);

% Gráfica
subplot(2,1,1);
plot(t, x);
title('Señal original');
xlabel('Tiempo [s]');
ylabel('Amplitud');

subplot(2,1,2);
plot(t_upsampled, y_upsampled);
title(['Señal upsampled (factor ', num2str(L), ')']);
xlabel('Tiempo [s]');
ylabel('Amplitud');

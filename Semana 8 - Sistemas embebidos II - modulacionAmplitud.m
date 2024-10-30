% Parámetros
Fs = 10000;  % Frecuencia de muestreo
t = 0:1/Fs:1;  % Tiempo
fc = 1000;  % Frecuencia de la portadora
fm = 100;  % Frecuencia de la señal de mensaje
Am = 1;  % Amplitud de la señal de mensaje
Ac = 1;  % Amplitud de la portadora

% Señal de mensaje
m = Am * cos(2 * pi * fm * t);

% Señal modulada AM
s = (Ac + m) .* cos(2 * pi * fc * t);  % Modulación AM

% Gráfica
subplot(2,1,1);
plot(t, m);
title('Señal de mensaje');
xlabel('Tiempo [s]');
ylabel('Amplitud');

subplot(2,1,2);
plot(t, s);
title('Señal modulada AM');
xlabel('Tiempo [s]');
ylabel('Amplitud');

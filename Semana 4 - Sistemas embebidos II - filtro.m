clc;
clear all;
close all;

% Parámetros de la señal
Fs = 1000;              % Frecuencia de muestreo (Hz)
T = 1/Fs;               % Periodo de muestreo
L = 200;               % Longitud de la señal
t = (0:L-1)*T;          % Vector de tiempo

% Frecuencias de las componentes
f1 = 50;  % Frecuencia 1 en Hz
f2 = 150; % Frecuencia 2 en Hz
f3 = 300; % Frecuencia 3 en Hz

% Crear la señal
signal = sin(2*pi*f1*t) + sin(2*pi*f2*t) + sin(2*pi*f3*t);
% Calcular la FFT de la señal
Y = fft(signal);

% Calcular la amplitud de la FFT
P2 = abs(Y/L);             % Amplitud de dos lados
P1 = P2(1:L/2+1);          % Amplitud de un solo lado
P1(2:end-1) = 2*P1(2:end-1);

% Definir el eje de frecuencias
f = Fs*(0:(L/2))/L;

% Graficar la FFT de la señal
plot(f, P1);
title('Transformada de Fourier de la señal');
xlabel('Frecuencia (Hz)');
ylabel('Amplitud');

% Visualizar la señal original
figure;
plot(t, signal);
title('Señal Original');
xlabel('Tiempo (s)');
ylabel('Amplitud');
orden = 100
% Filtro pasa bajos
Fc_low = 100; % Frecuencia de corte del filtro pasa bajos en Hz
[b_low, a_low] = butter(orden, Fc_low / (Fs / 2), 'low');

% Filtro pasa altos
Fc_high = 200; % Frecuencia de corte del filtro pasa altos en Hz
[b_high, a_high] = butter(orden, Fc_high / (Fs / 2), 'high');

% Filtro pasa banda
Fc_band = [100 250]; % Frecuencias de corte del filtro pasa banda en Hz
[b_band, a_band] = butter(orden, Fc_band / (Fs / 2), 'bandpass');


% Filtrar la señal
signal_low = filter(b_low, a_low, signal);
signal_high = filter(b_high, a_high, signal);
signal_band = filter(b_band, a_band, signal);

% Visualizar las señales filtradas
figure;
subplot(3,1,1);
plot(t, signal_low);
title('Señal Filtrada con Pasa Bajos');
xlabel('Tiempo (s)');
ylabel('Amplitud');

subplot(3,1,2);
plot(t, signal_high);
title('Señal Filtrada con Pasa Altos');
xlabel('Tiempo (s)');
ylabel('Amplitud');

subplot(3,1,3);
plot(t, signal_band);
title('Señal Filtrada con Pasa Banda');
xlabel('Tiempo (s)');
ylabel('Amplitud');


% Calcular la FFT de la señal
Y = fft(signal_band);

% Calcular la amplitud de la FFT
P2 = abs(Y/L);             % Amplitud de dos lados
P1 = P2(1:L/2+1);          % Amplitud de un solo lado
P1(2:end-1) = 2*P1(2:end-1);

% Definir el eje de frecuencias
f = Fs*(0:(L/2))/L;
% Graficar la FFT de la señal
figure;
subplot(3,1,1);
plot(f, P1);
title('bandas');
xlabel('Frecuencia (Hz)');
ylabel('Amplitud');

% Calcular la FFT de la señal
Y = fft(signal_low);

% Calcular la amplitud de la FFT
P2 = abs(Y/L);             % Amplitud de dos lados
P1 = P2(1:L/2+1);          % Amplitud de un solo lado
P1(2:end-1) = 2*P1(2:end-1);

% Definir el eje de frecuencias
f = Fs*(0:(L/2))/L;
% Graficar la FFT de la señal
subplot(3,1,2);
plot(f, P1);
title('bajas');
xlabel('Frecuencia (Hz)');
ylabel('Amplitud');

% Calcular la FFT de la señal
Y = fft(signal_high);

% Calcular la amplitud de la FFT
P2 = abs(Y/L);             % Amplitud de dos lados
P1 = P2(1:L/2+1);          % Amplitud de un solo lado
P1(2:end-1) = 2*P1(2:end-1);

% Definir el eje de frecuencias
f = Fs*(0:(L/2))/L;
% Graficar la FFT de la señal
subplot(3,1,3);
plot(f, P1);
title('ALTAS');
xlabel('Frecuencia (Hz)');
ylabel('Amplitud');

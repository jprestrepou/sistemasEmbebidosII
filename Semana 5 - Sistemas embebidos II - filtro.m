clc;
clear all;
close all;

%signal = readtable("C:\Users\jupa_\Desktop\archive\accelerometer.csv");
%signal = signal.x;

[signal,Fs] = audioread("01. Ground Theme.mp3");
signal = signal(:,1);
% Parámetros de la señal
%Fs = 1000;              % Frecuencia de muestreo (Hz)
T = 1/Fs;               % Periodo de muestreo
L = length(signal);               % Longitud de la señal
t = (0:L-1)*T;          % Vector de tiempo



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




orden = 3;
% Filtro pasa bajos
Fc_low = 500; % Frecuencia de corte del filtro pasa bajos en Hz
[b_low, a_low] = butter(orden, Fc_low / (Fs / 2), 'low');

% Filtro pasa altos
Fc_high = 10000; % Frecuencia de corte del filtro pasa altos en Hz
[b_high, a_high] = butter(orden, Fc_high / (Fs / 2), 'high');

% Filtro pasa banda
Fc_band = [1000 5000]; % Frecuencias de corte del filtro pasa banda en Hz
[b_band, a_band] = butter(orden, Fc_band / (Fs / 2), 'bandpass');

audiowrite("original.mp3", signal, Fs)
% Filtrar la señal
signal_low = filter(b_low, a_low, signal);
audiowrite("bajosEx3.mp3",signal_low, Fs)

signal_high = filter(b_high, a_high, signal);
audiowrite("altosEx3.mp3", signal_high, Fs)

signal_band = filter(b_band, a_band, signal);
audiowrite("bandasEx3.mp3",signal_band, Fs)






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

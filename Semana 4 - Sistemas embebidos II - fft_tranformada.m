% Parámetros de la señal
Fs = 1000;              % Frecuencia de muestreo (Hz)
T = 1/Fs;               % Periodo de muestreo
L = 1000;               % Longitud de la señal
t = (0:L-1)*T;          % Vector de tiempo

% Crear una señal con múltiples componentes frecuenciales
f1 = 50;                % Frecuencia 1 (Hz)
f2 = 120;               % Frecuencia 2 (Hz)
f3 = 200;               % Frecuencia 3 (Hz)

% Señal compuesta de tres componentes sinusoidales
S = 0.7*sin(2*pi*f1*t) + 1.0*sin(2*pi*f2*t) + 0.5*sin(2*pi*f3*t);

% Añadir ruido aleatorio a la señal
S = S + 2*randn(size(t));

% Graficar la señal en el dominio del tiempo
figure;
subplot(2,1,1);
plot(t, S);
title('Señal en el dominio del tiempo');
xlabel('Tiempo (s)');
ylabel('Amplitud');

% Calcular la FFT de la señal
Y = fft(S);

% Calcular la amplitud de la FFT
P2 = abs(Y/L);             % Amplitud de dos lados
P1 = P2(1:L/2+1);          % Amplitud de un solo lado
P1(2:end-1) = 2*P1(2:end-1);

% Definir el eje de frecuencias
f = Fs*(0:(L/2))/L;

% Graficar la FFT de la señal
subplot(2,1,2);
plot(f, P1);
title('Transformada de Fourier de la señal');
xlabel('Frecuencia (Hz)');
ylabel('Amplitud');

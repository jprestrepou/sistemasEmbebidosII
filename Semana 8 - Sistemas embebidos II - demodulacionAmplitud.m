% Demodulación (multiplicación por la portadora y filtro paso bajo)
r = s .* cos(2 * pi * fc * t);  % Señal demodulada (multiplicada por la portadora)

% Aplicamos un filtro paso bajo
[b, a] = butter(5, fm/(Fs/2));  % Filtro paso bajo con frecuencia de corte fm
demod_signal = filter(b, a, r);  % Señal demodulada filtrada

% Gráfica
subplot(2,1,1);
plot(t, s);
title('Señal modulada AM');
xlabel('Tiempo [s]');
ylabel('Amplitud');

subplot(2,1,2);
plot(t, demod_signal);
title('Señal demodulada AM');
xlabel('Tiempo [s]');
ylabel('Amplitud');

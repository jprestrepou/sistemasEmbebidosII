% Parámetros
kf = 160;  % Índice de modulación de frecuencia

% Señal modulada FM
s_fm = cos(2 * pi * fc * t + kf * cumsum(m) / Fs);

% Gráfica
subplot(2,1,1);
plot(t, m);
title('Señal de mensaje');
xlabel('Tiempo [s]');
ylabel('Amplitud');

subplot(2,1,2);
plot(t, s_fm);
title('Señal modulada FM');
xlabel('Tiempo [s]');
ylabel('Amplitud');

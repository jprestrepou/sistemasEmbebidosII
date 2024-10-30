% Derivar la señal modulada para la demodulación FM
demod_fm = diff([0 s_fm]) * Fs / (2 * pi * kf);

% Gráfica
subplot(2,1,1);
plot(t, s_fm);
title('Señal modulada FM');
xlabel('Tiempo [s]');
ylabel('Amplitud');

subplot(2,1,2);
plot(t, demod_fm);
title('Señal demodulada FM');
xlabel('Tiempo [s]');
ylabel('Amplitud');

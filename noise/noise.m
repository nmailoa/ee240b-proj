data = csvread('noisespec11_1p_18m.csv');

freqs = data(:,1);
Ts = 1/250e6;
resp = 2*(exp(j*freqs*2*pi*Ts)-1);

input_referred = sqrt(data(:,2)).*abs(resp);

semilogx(freqs, input_referred)
xlabel('Frequency (Hz)')
ylabel('Noise Density (V/sqrt(Hz))')
title('Input-referred Noise Density of Single Stage Integrator 1')
grid on

int = sqrt(trapz(freqs(2:end)-freqs(1:end-1), (input_referred(1:end-1)).^2))
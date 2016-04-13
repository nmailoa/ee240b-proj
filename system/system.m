A = 0.5;
Ts = 1/250e6;

STF = tf([A/2],[1, A-2, 1+A+A/2], Ts)

N11TF = STF

N12TF = tf([A, -A],[1, A-2, 1+A+A/2], Ts)

N21TF = N12TF

N22TF = tf([1, -2, 1],[1, A-2, 1+A+A/2], Ts)

IRN11 = N11TF/STF
IRN12 = N12TF/STF
IRN21 = IRN12
IRN22 = N22TF/STF


bode(IRN11, IRN12,IRN22)
%xlim([2*pi*1e2,2*pi*500e3])
title('Input-Referred Noise Transfer Functions')
legend('N11', 'N12 & N21', 'N22')
grid on


%%

bode(N11TF, N12TF, N22TF)
%xlim([2*pi*1e2,2*pi*500e3])
title('Signal and Noise Transfer Functions')
legend('STF & N11 TF', 'N12 & N21 TF', 'N22 TF')
grid on

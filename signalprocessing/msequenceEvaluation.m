msequence = rot90(mseq(2,10,2));

figure

subplot(2,3,1);
plot(xcorr(msequence,msequence));
title('Subplot 1: xcorr with itself')

temp = randn(1023,1);
subplot(2,3,2);
plot(xcorr(msequence,temp));
title('Subplot 2: xcorr with random')

Fs = 44100;
dt = 1/Fs;          %chirp sample rate
tmax = 0.0232;
t= 0:dt:tmax;                       % 0.1 second @ 44100Hz sample rate
f0 = 14000;
f1=18000;
audio2 = chirp(t,f0,tmax,f1);

subplot(2,3,3);
plot(xcorr(msequence,audio2));
title('Subplot 3: xcorr with chirps')


noisewithmsequence = [randn(200,1)*10; mseq(2,10,2); randn(300,1)*10];
subplot(2,3,4);
plot(xcorr(msequence,noisewithmsequence));
title('Subplot 4: xcorr with noise with msequence')



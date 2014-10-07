Fs = 44100;
dt = 1/Fs;          %chirp sample rate
tmax = 0.0232;
t= 0:dt:tmax;                       % 0.1 second @ 44100Hz sample rate
f0 = 14000;
f1=18000;
audio2 = chirp(t,f0,tmax,f1);

temp = randn(1024,1);

audio3 = chirp(t,f1,tmax,f0);

f2=10000;
audio1 = chirp(t,f2,tmax,f0);

audio4 = chirp(t,f0,tmax,f1, 'quadratic');


audio5_1 = [randn(200,1); audio2(:); randn(300,1)];
audio5_2 = [randn(300,1); audio3(:); randn(200,1)];
audio5 = audio5_1 + audio5_2;

figure

subplot(2,3,1);
plot(xcorr(audio2,audio2));
title('Subplot 1: xcorr with itself')

subplot(2,3,2);
plot(xcorr(audio2,temp));
title('Subplot 2: xcorr with random')

subplot(2,3,3);
plot(xcorr(audio1,audio2));
title('Subplot 3: xcorr with different frequency')

subplot(2,3,4);
plot(xcorr(audio2,audio3));
title('Subplot 4: xcorr with up/down chirp')

subplot(2,3,5);
plot(xcorr(audio2,audio4));
title('Subplot 5: xcorr with chirp rate')


subplot(2,3,6);
plot(xcorr(audio3,audio5));
title('Subplot 5: xcorr with overlapped up_down chirp')


y = remote4beeps;


%%% FFT transform http://www.mathworks.com/help/matlab/ref/fft.html
Fs = 44100;                    % Sampling frequency
T = 1/Fs;                     % Sample time
[L placeholder] = size(y);                     % Length of signal
t = (0:L-1)*T;                % Time vector

NFFT = 2^nextpow2(L); % Next power of 2 from length of y
Y = fft(y,NFFT)/L;
f = Fs/2*linspace(0,1,NFFT/2+1);


[b,a] = butter(9,0.4,'high');
filt=filter(b,a,y);
figure();
plot(filt);

filted_Y = fft(filt,NFFT)/L;
figure
% plot(f,2*abs(filted_Y(1:NFFT/2+1)), 'o-'); 
plot(f,2*abs(filted_Y(1:NFFT/2+1)), 'o-', f,2*abs(Y(1:NFFT/2+1)) ,'r-'); 
legend('high pass filter','original')
title('Single-Sided Amplitude Spectrum of y(t)')
xlabel('Frequency (Hz)')
ylabel('|Y(f)|')
disp('Start speaking.')
sound(filt, 44100);

Fs = 44100;
dt = 1/Fs;          %chirp sample rate
tmax = 0.0232;
t= 0:dt:tmax;                       % 0.1 second @ 44100Hz sample rate
f0 = 18000;
f1=21000;
template = chirp(t,f0,tmax,f1);
figure
subplot(2,1,1)
plot(xcorr(template,y));
subplot(2,1,2)
plot(xcorr(template,filt));

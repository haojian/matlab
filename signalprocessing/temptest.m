y = leftchirpandright;

%%% FFT transform http://www.mathworks.com/help/matlab/ref/fft.html
Fs = 44100;                    % Sampling frequency
T = 1/Fs;                     % Sample time
[L placeholder] = size(y);                     % Length of signal
t = (0:L-1)*T;                % Time vector

NFFT = 2^nextpow2(L); % Next power of 2 from length of y
Y = fft(y,NFFT)/L;
f = Fs/2*linspace(0,1,NFFT/2+1);


[b,a] = butter(9,0.7,'high');
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


f_start = 17000;
f_step  = 1000;

Fs = 44100;
dt = 1/Fs;          %chirp sample rate
tmax = 1080/44100;
t= 0:dt:tmax;                       % 0.1 second @ 44100Hz sample rate
f0 = f_start;
f1= f_start+f_step;
f2 = f_start+f_step*2;
template = chirp(t,f0,tmax,f1);
figure
subplot(3,1,1)
plot(xcorr(template,filt));
title('leftchirp');
subplot(3,1,2)
template2 = chirp(t,f2,tmax,f1);
plot(xcorr(template2,filt));
title('rightchirp');
subplot(3,1,3)
template3 = chirp(t,19500,tmax,21500);
plot(xcorr(template3,filt));
title('encodingchirp');


figure();
template2 = chirp(t,19000,tmax,18000);
plot(xcorr(template,filt));

figure
subplot(3,1,1)
cache1 = xcorr(template,filt);
n = 10;
cache1 = cache1.^2;
moving_average1 = filter(ones(1,n)/n,1, cache1);
plot(moving_average1);
title('leftchirp');
subplot(3,1,2)
cache2 = xcorr(template2,filt);
n = 10;
cache2 = cache2.^2;
moving_average2 = filter(ones(1,n)/n,1, cache2);
plot(moving_average2);
title('rightchirp');

[val1 idx1] = max(moving_average1);
[val2 idx2] = max(moving_average2);
disp(idx1-idx2);
disp(val1);
disp(val2);


% subplot(4,1,3)
% msequence = rot90(mseq(2,10,2));
% plot(xcorr(msequence, filt));
% subplot(4,1,4)
% plot(xcorr(msequence, y));



leftchirpandright = csvread('matlabfile.txt');
y = leftchirpandright;

%%% FFT transform http://www.mathworks.com/help/matlab/ref/fft.html
Fs = 48000;                    % Sampling frequency
T = 1/Fs;                     % Sample time
[L placeholder] = size(y);                     % Length of signal
t = (0:L-1)*T;                % Time vector

NFFT = 2^nextpow2(L); % Next power of 2 from length of y
Y = fft(y,NFFT)/L;
f = Fs/2*linspace(0,1,NFFT/2+1);

[b,a] = butter(9,0.1,'high');
filt=filter(b,a,y);
% figure();
% plot(filt);

filted_Y = fft(filt,NFFT)/L;
figure
% plot(f,2*abs(filted_Y(1:NFFT/2+1)), 'o-'); 
plot(f,2*abs(filted_Y(1:NFFT/2+1)), 'o-', f,2*abs(Y(1:NFFT/2+1)) ,'r-'); 
legend('high pass filter','original')
title('Single-Sided Amplitude Spectrum of y(t)')
xlabel('Frequency (Hz)')
ylabel('|Y(f)|')
disp('Start speaking.')


f_start = 18000;
f_step  = 4000;

dt = 1/Fs;          %chirp sample rate
tmax = 2080/Fs;
t= 0:dt:tmax;                      
f0 = f_start;
f1= f_start+f_step;

%matchfilter for left chirp (upchirp)
upchirp = chirp(t,f0,tmax,f1);
mf_left = flipud(upchirp(:));
left = abs(hilbert( filter(mf_left, 1, filt) )) ;
figure()
plot(left)

%matchfilter for right chirp (downchirp)
downchirp = chirp(t,f1,tmax,f0);
mf_right = flipud(downchirp(:));
right =  abs(hilbert( filter(mf_right, 1, filt) ));
figure()
plot(right)

myfile = fopen('/Users/haojian/tracko/TrackoEvaluation/python/left.txt','w');
fprintf(myfile, '%g\n', left)
fclose(myfile)

myfile = fopen('/Users/haojian/tracko/TrackoEvaluation/python/right.txt','w');
fprintf(myfile, '%g\n', right)
fclose(myfile)

%verify code
%i = find(left> 150)
% founded= 2682523;
% c = dot(filt(founded-length(template)+1: 1: founded),template)

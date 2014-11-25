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
% sound(filt, Fs);

f_start = 18000;
f_step  = 4000;

dt = 1/Fs;          %chirp sample rate
tmax = 2080/Fs;
t= 0:dt:tmax;                      
f0 = f_start;
f1= f_start+f_step;
% f2 = f_start+f_step*2;
template = chirp(t,f0,tmax,f1);

left = abs(hilbert( xcorr(template, filt) )) ;
template2 = chirp(t,f1,tmax,f0);
right =  abs(hilbert( xcorr(template2, filt) ));
myfile = fopen('/Users/haojian/tracko/TrackoEvaluation/python/left.txt','w');
fprintf(myfile, '%g\n', left)
fclose(myfile)
myfile = fopen('/Users/haojian/tracko/TrackoEvaluation/python/right.txt','w');
fprintf(myfile, '%g\n', right)
fclose(myfile)
% csvwrite('/Users/haojian/tracko/TrackoEvaluation/python/left.txt',left)
% csvwrite('/Users/haojian/tracko/TrackoEvaluation/python/right.txt',right)

figure
y2D = [left; right]';
% plot(left)
plot(y2D, 'LineWidth', 1);
legend('left', 'right');

[val1 idx1] = max(left);
[val2 idx2] = max(right);
disp(idx1-idx2);
disp(val1);
disp(val2);

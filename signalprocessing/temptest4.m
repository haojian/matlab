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


% myfile = fopen('/Users/haojian/tracko/TrackoEvaluation/python/filt.txt','w');
% fprintf(myfile, '%g\n', filt)
% fclose(myfile)


% left = abs(hilbert( xcorr(template, filt) )) ;
% left = abs(hilbert( filter(template, 1, filt) )) ;
b = flipud(template(:));
left = abs(hilbert( filter(b, 1, filt) )) ;
plot(left)
i = find(left> 20)
figure()
left_cpy = abs(hilbert( filter(template, 1, filt) )) ;
plot(left_cpy)

template2 = chirp(t,f1,tmax,f0);
b_right = flipud(template2(:));
right =  abs(hilbert( filter(b_right, 1, filt) ));
figure()
plot(right)

% founded= 1696412;
% c = dot(filt(founded-length(template)+1: 1: founded),template)


% i = find(left> 150)

% matches = n(left>thresh*u);

% dot(filt(1701276:1:1701276+2080), template)

% template2 = chirp(t,f1,tmax,f0);
% right =  abs(hilbert( filter(template2, 1, filt) ));
% myfile = fopen('/Users/haojian/tracko/TrackoEvaluation/python/left.txt','w');
% fprintf(myfile, '%g\n', left)
% fclose(myfile)
% myfile = fopen('/Users/haojian/tracko/TrackoEvaluation/python/right.txt','w');
% fprintf(myfile, '%g\n', right)
% fclose(myfile)
% 
% figure
% y2D = [left; right]';
% % plot(left)
% plot(y2D, 'LineWidth', 1);
% legend('left', 'right');
% 
% [val1 idx1] = max(left);
% [val2 idx2] = max(right);
% disp(idx1-idx2);
% disp(val1);
% disp(val2);

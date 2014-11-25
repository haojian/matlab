outputdir = '/Users/haojian/tracko/TrackoEvaluation/python/sundaynight/2k-6k-uni-2000frame';
downchirp = csvread('downchirp.txt');
upchirp = csvread('upchirp.txt');
upchirp = upchirp(1:2080);
mf_left = flipud(upchirp(:));
mf_right = flipud(downchirp(:));



%for dev1
leftchirpandright = csvread('dev1_matlabfile.txt');

y = leftchirpandright;

%high pass filter
Fs = 48000;                    % Sampling frequency
T = 1/Fs;                     % Sample time
[L placeholder] = size(y);                     % Length of signal
t = (0:L-1)*T;                % Time vector

NFFT = 2^nextpow2(L); % Next power of 2 from length of y
Y = fft(y,NFFT)/L;
f = Fs/2*linspace(0,1,NFFT/2+1);

% [b,a] = butter(9,0.09,'high');
[b,a] = butter(10,[2000 6000]/24000);
filt=filter(b,a,y);

filted_Y = fft(filt,NFFT)/L;
figure
plot(f,2*abs(filted_Y(1:NFFT/2+1)), 'o-', f,2*abs(Y(1:NFFT/2+1)) ,'r-'); 
legend('high pass filter','original')
title('Single-Sided Amplitude Spectrum of y(t)')
xlabel('Frequency (Hz)')
ylabel('|Y(f)|')


leftchirpandright = filt;

left = abs(hilbert( filter(mf_left, 1, leftchirpandright ) )) ;
% figure()
% plot(left)

right =  abs(hilbert( filter(mf_right, 1, filt) ));
% figure()
% plot(right)

myfile = fopen( strcat(outputdir, '/dev1/left.txt'), 'w');
fprintf(myfile, '%g\n', left)
fclose(myfile)

myfile = fopen( strcat(outputdir, '/dev1/right.txt'), 'w');
fprintf(myfile, '%g\n', right)
fclose(myfile)

%for dev2
leftchirpandright = csvread('dev2_matlabfile.txt');

left = abs(hilbert( filter(mf_left, 1, leftchirpandright ) )) ;
% figure()
% plot(left)

right =  abs(hilbert( filter(mf_right, 1, filt) ));
% figure()
% plot(right)

myfile = fopen( strcat(outputdir, '/dev2/left.txt'), 'w');
fprintf(myfile, '%g\n', left)
fclose(myfile)

myfile = fopen( strcat(outputdir, '/dev2/right.txt'), 'w');
fprintf(myfile, '%g\n', right)
fclose(myfile)

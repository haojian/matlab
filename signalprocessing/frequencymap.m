% Record your voice for 5 seconds.
recObj = audiorecorder(44100, 16, 1);
disp('Start speaking.')
recordblocking(recObj, 5);
disp('End of Recording.');
% 
% % Play back the recording.
play(recObj);
% 
% % Store data in double-precision array.
myRecording = getaudiodata(recObj);
% 
% % Plot the samples.
figure
subplot(2,3,1);
plot(myRecording);
title('original audio wave in time domain');

y = myRecording;

%%% FFT transform http://www.mathworks.com/help/matlab/ref/fft.html
Fs = 44100;                    % Sampling frequency
T = 1/Fs;                     % Sample time
L = 44100*5;                     % Length of signal
t = (0:L-1)*T;                % Time vector

NFFT = 2^nextpow2(L); % Next power of 2 from length of y
Y = fft(y,NFFT)/L;
f = Fs/2*linspace(0,1,NFFT/2+1);

% Plot single-sided amplitude spectrum.
% subplot(2,3,2);
figure
plot(f,2*abs(Y(1:NFFT/2+1))) 
title('Single-Sided Amplitude Spectrum of y(t)')
xlabel('Frequency (Hz)')
ylabel('|Y(f)|')

%right speaker
%Recorder part. only need to run at the first time.

recObj = audiorecorder(44100, 16, 1)

disp('Start speaking.')
recordblocking(recObj, 2);
disp('End of Recording.');

%play(recObj);

y = getaudiodata(recObj);

% plot(y);





Fs = 44100;
dt = 1/Fs;          %chirp sample rate
%tmax = 0.0232;
t= 0:1/Fs:11024/Fs; %dt:tmax;                       % 0.1 second @ 44100Hz sample rate
f0 = 14000;
f1=18000;
audio_up = sin(2 * pi * 8000 * t); %chirp(t,4000,tmax,4000);
%soundsc(audio_up, Fs);

audio_down = sin(2 * pi * 3000 * t); %chirp(t,4000,tmax,4000);

subplot(2,1,1);
plot(xcorr(y, audio_up));
subplot(2,1,2);
plot(xcorr(y, audio_down));


[val1 idx1] = max(xcorr(y, audio_up));
[val2 idx2] = max(xcorr(y, audio_down));
diff = idx1 - idx2
% 
% Fs = 44100;
% dt = 1/Fs;          %chirp sample rate
% tmax = 0.0232;
% t= 0:dt:tmax;                       % 0.1 second @ 44100Hz sample rate
% f0 = 14000;
% f1=18000;
% audio_up = chirp(t,14000,tmax,18000);
% audio_down = chirp(t,18000,tmax,14000);
% 
% plot(xcorr(y, audio_up), 'b-');
% hold on
% plot (xcorr(y, audio_down), 'r-')
% hold off
% title('original signal with upchirp');
% 
% x_moving_average = filter(ones(1,50),1,(xcorr(y, audio_up)).^2);
% x_moving_average2 = filter(ones(1,50),1,(xcorr(y, audio_down)).^2);
% [val1 idx1] = max(x_moving_average);
% [val2 idx2] = max(x_moving_average2);
% diff = idx1 - idx2

% 
% 
% tmax = 0.0232;
% 
% t2= 0:dt:tmax;                       % 0.1 second @ 44100Hz sample rate
% audio_down = chirp(t2,18000,tmax,14000);
% % audio_down = randn(1024,1);
% 
% subplot(2,2,1);
% plot(y);
% title('original signal');
% 
% 
% subplot(2,2,2);
% plot(xcorr(y, audio_up));
% title('original signal with upchirp');
% 
% subplot(2,2,3);
% plot(xcorr(y, audio_down));
% title('original signal with downchirp');
% 
% 
% subplot(2,2,4);
% plot(xcorr(y, audio_up), 'b-')
% hold on
% plot (xcorr(y, audio_down), 'r-')
% hold off
% 
% title('original signal with up-downchirp');
% 
% th = 0.2;
% [peaks1 locs1] = findpeaks(xcorr(audio_down, y),'MINPEAKHEIGHT',th)
% th = 0.2;
% [peaks2 locs2] = findpeaks(xcorr(audio_up, y),'MINPEAKHEIGHT',th)
% 
% figure;
% subplot(2,2,1);
% x_moving_average = filter(ones(1,100),1,(xcorr(audio_down, y)).^2);
% plot(x_moving_average);
% 
% subplot(2,2,2);
% x_moving_average2 = filter(ones(1,100),1,(xcorr(audio_up, y)).^2);
% plot(x_moving_average2);
% 
% subplot(2,2,3);
% plot(x_moving_average, 'b-');
% hold on
% plot(x_moving_average2, 'r-');
% hold off
% 
% subplot(2,2,4);
% plot(xcorr(audio_down, audio_up));
% 
% 
% 
% [val1 idx1] = max(x_moving_average);
% [val2 idx2] = max(x_moving_average2);
% diff = idx1 - idx2

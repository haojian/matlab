
%{
====================================
spectrogram of linear chirp
====================================
%}

% t = 0:0.001:2;            % 2 secs @ 1kHz sample rate
% y = chirp(t,0,1,150);     % Start @ DC, cross 150Hz at t=1 sec    
% figure
% spectrogram(y,256,250,256,1E3,'yaxis') 



%{
====================================
spectrogram of recording audio
====================================
%}

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

subplot(2,3,2);
spectrogram(myRecording,256,250,256,44100,'yaxis') 

subplot(2,3,3);
[counts, bins] = hist(myRecording);
plot(bins, counts);


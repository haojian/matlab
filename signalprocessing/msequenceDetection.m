%{
    produce msequence sound
%}
msequence = rot90(mseq(2,8,2));
% sound(msequence, 44100);
% wavwrite(msequence, 44100, 16, 'msequence.wav'); 

%%%%%%%%%%Record audio, play the audio file generated before at the same
%%%%%%%%%%time.
recObj = audiorecorder(44100, 16, 1)
disp('Start recording.')
recordblocking(recObj, 5);
disp('End of Recording.');

% play(recObj);
y = getaudiodata(recObj);
plot(y);

[b,a] = butter(9,0.3,'high')
filt=filter(b,a,y);
sound(filt, 44100);
figure();
subplot(2,1,1)
plot(xcorr(y, msequence));
subplot(2,1,2)
plot(xcorr(filt, msequence));

function [ recObj ] = func_audiorecording(  )
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here
%audio recording
% Record your voice for 5 seconds.
recObj = audiorecorder(44100, 16, 1);
disp('Start speaking.')
recordblocking(recObj, 10);
disp('End of Recording.');
% 
% % Play back the recording.
play(recObj);
% 
% % Store data in double-precision array.
myRecording = getaudiodata(recObj);
% 
% % Plot the samples.
plot(myRecording);
%wavwrite(myRecording, 44100, 16,'sample01_6k');

end


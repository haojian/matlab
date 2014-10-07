% Compute the spectrogram of a chirp with linear instantaneous frequency deviation:



%t = 0:0.001:2;            % 2 secs @ 1kHz sample rate
%y = chirp(t,0,1,150);     % Start @ DC, 
                          %   cross 150Hz at t=1 sec
% spectrogram(y,256,250,256,1E3,'yaxis') 

%sound(y, 44100)
%binarycode = y


Fs = 22050;
dt = 1/Fs;          %chirp sample rate 
tmax = 0.1;          %chirp duration

t= 0:dt:tmax;                       % 0.1 second @ 44100Hz sample rate
f0=4000;f1=6000;                      % Start at 4000Hz, go up to 6000Hz
audio = chirp(t,f0,tmax,f1);

sound(audio, Fs);

% goldennumber = [1,-1];
% tmp = audio(:,4410) * goldennumber;

% dec_nr = 2.1507;
% bin = dec2bin(dec_nr);

% bin = dec2bin(typecast(int32(dec_nr),'uint16'))

 n = length(audio);
 encode = [];
 
 goldennumber = [1,-1];
 
 for k = 1:n
     tmp = audio(:,k) * goldennumber;
     encode = [encode tmp];
 end

 sound(encode, 44100);
 
% decode

decode =[];
for k = 1:n
    tmp = encode(:,2*k-1: 2*k) * rot90(goldennumber, 3) / 2;
    decode = [decode tmp];
end

 
 
%audio recording
% Record your voice for 5 seconds.
% recObj = audiorecorder(44100, 16, 1);
% disp('Start speaking.')
% recordblocking(recObj, 5);
% disp('End of Recording.');
% 
% % Play back the recording.
% play(recObj);
% 
% % Store data in double-precision array.
% myRecording = getaudiodata(recObj);
% 
% % Plot the samples.
% plot(myRecording);
%wavwrite(myRecording, 44100, 16,'sample01_6k');




%decode part.



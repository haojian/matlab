startFrequence = 10000;
bandwidth = 4000;

audio1  = [];
Fs = 44100;
dt = 1/Fs;          %chirp sample rate 
tmax = 0.02;          %chirp duration

t= 0:dt:tmax;                       % 0.1 second @ 44100Hz sample rate
f0=startFrequence;f1=startFrequence + bandwidth/5;                      % Start at 4000Hz, go up to 6000Hz
part_audio = chirp(t,f0,tmax,f1);

audio1 = [audio1 part_audio];

sound(audio1, 44100);

% chirp modulation.

audio1  = [];
Fs = 44100;
dt = 1/Fs;          %chirp sample rate 
tmax = 0.02;          %chirp duration

t= 0:dt:tmax;                       % 0.1 second @ 44100Hz sample rate
f0=6000;f1=6200;                      % Start at 4000Hz, go up to 6000Hz
part_audio = chirp(t,f0,tmax,f1);

audio1 = [audio1 part_audio];


t= 0:dt:tmax;                       % 0.1 second @ 44100Hz sample rate
f0=6200;f1=6600;                      % Start at 4000Hz, go up to 6000Hz
part_audio = chirp(t,f0,tmax,f1);

audio1 = [audio1 part_audio];

t= 0:dt:tmax;                       % 0.1 second @ 44100Hz sample rate
f0=6600;f1=7200;                      % Start at 4000Hz, go up to 6000Hz
part_audio = chirp(t,f0,tmax,f1);

audio1 = [audio1 part_audio];


t= 0:dt:tmax;                       % 0.1 second @ 44100Hz sample rate
f0=7200;f1=7300;                      % Start at 4000Hz, go up to 6000Hz
part_audio = chirp(t,f0,tmax,f1);

audio1 = [audio1 part_audio];


sound(audio1, 44100);






audio2  = [];
Fs = 44100;
dt = 1/Fs;          %chirp sample rate 
tmax = 0.02;          %chirp duration

t= 0:dt:tmax;                       % 0.1 second @ 44100Hz sample rate
f0=6000;f1=6400;                      % Start at 4000Hz, go up to 6000Hz
part_audio = chirp(t,f0,tmax,f1);

audio2 = [audio2 part_audio];


t= 0:dt:tmax;                       % 0.1 second @ 44100Hz sample rate
f0=6400;f1=6500;                      % Start at 4000Hz, go up to 6000Hz
part_audio = chirp(t,f0,tmax,f1);

audio2 = [audio2 part_audio];

t= 0:dt:tmax;                       % 0.1 second @ 44100Hz sample rate
f0=6500;f1=6900;                      % Start at 4000Hz, go up to 6000Hz
part_audio = chirp(t,f0,tmax,f1);

audio2 = [audio2 part_audio];


t= 0:dt:tmax;                       % 0.1 second @ 44100Hz sample rate
f0=6900;f1=7300;                      % Start at 4000Hz, go up to 6000Hz
part_audio = chirp(t,f0,tmax,f1);

audio2 = [audio2 part_audio];


sound(audio2, 44100);



c = xcorr(audio1, audio2);
plot(c);



function [ audio ] = func_cdma_chirp(  )
%UNTITLED8 Summary of this function goes here
%   Detailed explanation goes here


% generate a lower rate original chirp first.

% Fs = 44100;
% dt = 1/Fs;          %chirp sample rate 
% tmax = 0.1;          %chirp duration
% 
% t= 0:dt:tmax;                       % 0.1 second @ 44100Hz sample rate
% f0=4000;f1=6000;                      % Start at 4000Hz, go up to 6000Hz
% audio = chirp(t,f0,tmax,f1);



Fs = 44100;
dt = 1/Fs;          %chirp sample rate 
tmax = 0.08;          %chirp duration

t= 0:dt:tmax;                       % 0.1 second @ 44100Hz sample rate
f0=12000;f1=16000;                      % Start at 4000Hz, go up to 6000Hz
audio = chirp(t,f0,tmax,f1);
sound(audio, 44100);

end


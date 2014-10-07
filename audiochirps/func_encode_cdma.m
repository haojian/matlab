function [ encode ] = func_encode_cdma( audio )
%UNTITLED9 Summary of this function goes here
%   Detailed explanation goes here

    n = length(audio);
    encode = [];
 
    goldennumber = [1,-1];
 
    for k = 1:n
        tmp = audio(:,k) * goldennumber;
        encode = [encode tmp];
    end

    sound(encode, 44100);
end


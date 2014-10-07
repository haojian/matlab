function [ decoded ] = func_decode_cdma( myrecording)
%UNTITLED6 Summary of this function goes here
%   Detailed explanation goes here
    
    n = length(myrecording)/2;
    decoded = zeros(n,1);
    goldennumber = [1, -1];
    for k = 1:n
        tmp = goldennumber * myrecording(2*k-1: 2*k,:) / 2;
        decoded(k,:) = tmp;
    end
    
end


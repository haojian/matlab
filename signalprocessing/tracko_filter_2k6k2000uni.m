leftchirpandright = csvread('matlabfile.txt');
downchirp = csvread('downchirp.txt');
upchirp = csvread('upchirp.txt');

upchirp = upchirp(1:2080)
mf_left = flipud(upchirp(:));
left = abs(hilbert( filter(mf_left, 1, leftchirpandright ) )) ;
figure()
plot(left)

mf_right = flipud(downchirp(:));
right =  abs(hilbert( filter(mf_right, 1, filt) ));
figure()
plot(right)

myfile = fopen('/Users/haojian/tracko/TrackoEvaluation/python/left.txt','w');
fprintf(myfile, '%g\n', left)
fclose(myfile)

myfile = fopen('/Users/haojian/tracko/TrackoEvaluation/python/right.txt','w');
fprintf(myfile, '%g\n', right)
fclose(myfile)


% y = leftchirpandright;
% filt = y;
% 
% f_start = 2000;
% f_step  = 4000;
% 
% dt = 1/Fs;          %chirp sample rate
% tmax = 2080/Fs;
% t= 0:dt:tmax;                      
% f0 = f_start;
% f1= f_start+f_step;

%matchfilter for left chirp (upchirp)
% upchirp = chirp(t,f0,tmax,f1);
% mf_left = flipud(upchirp(:));
% left = abs(hilbert( filter(mf_left, 1, filt) )) ;
% figure()
% plot(left)

%matchfilter for right chirp (downchirp)
% downchirp = chirp(t,f1,tmax,f0);
% mf_right = flipud(downchirp(:));
% right =  abs(hilbert( filter(mf_right, 1, filt) ));
% figure()
% plot(right)
% 
% myfile = fopen('/Users/haojian/tracko/TrackoEvaluation/python/left.txt','w');
% fprintf(myfile, '%g\n', left)
% fclose(myfile)
% 
% myfile = fopen('/Users/haojian/tracko/TrackoEvaluation/python/right.txt','w');
% fprintf(myfile, '%g\n', right)
% fclose(myfile)

%verify code
%i = find(left> 150)
% founded= 2682523;
% c = dot(filt(founded-length(template)+1: 1: founded),template)

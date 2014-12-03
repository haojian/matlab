% upchirp = csvread('upchirp.txt');
% figure()
% spectrogram(upchirp,256,250,256,48000,'yaxis') 
% figure()
% downchirp = csvread('downchirp.txt');
% spectrogram(downchirp,256,250,256,48000,'yaxis') 
% 

% upchirp = csvread('upchirp.txt');
% figure()
% spectrogram(upchirp,128,250,128,48000,'yaxis') 
% figure()
% downchirp = csvread('downchirp.txt');
% spectrogram(downchirp,128,250,128,48000,'yaxis') 


% [x,t] = simplefit_dataset;
% net = feedforwardnet(20);
% net = train(net,x,t);
% y = net(x);
% e = t - y;
% ploterrhist(e,'bins',30

% r1 = rand(1000,1);
% % r2 = rand(1000,1);
% e = r1-100;
% ploterrhist(e, 'bins',30);

% figure()
% title('Error distribution of audible sound (2000 frame)')

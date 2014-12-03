outputdir = '/Users/haojian/tracko/TrackoEvaluation/python/sundaynight/18k-22k-uni-2000frame';
downchirp = csvread('downchirp.txt');
upchirp = csvread('upchirp.txt');
upchirp = upchirp(1:2080);
mf_left = flipud(upchirp(:));
mf_right = flipud(downchirp(:));


%for dev1
leftchirpandright = csvread('dev1_matlabfile.txt');

% Wp = [18000 22000]/24000;
% Ws = [15000 23000]/24000;
% Rp = 3;
% Rs = 15;
% [n,Wn] = buttord(Wp,Ws,Rp,Rs);
% [b,a] = butter(n, Wn);

% [b,a] = butter(20,0.5,'high');
% filt=filter(b,a,leftchirpandright);
% leftchirpandright = filt;

% [b,a] = butter(20,0.7,'high');
% filt=filter(b,a,leftchirpandright);
% leftchirpandright = filt;


% [b,a] = butter(15,0.7,'high');
% filt=filter(b,a,leftchirpandright);
% leftchirpandright = filt;

left = abs(hilbert( filter(mf_left, 1, leftchirpandright ) )) ;
% figure()
% plot(left)

right =  abs(hilbert( filter(mf_right, 1, leftchirpandright) ));
% figure()
% plot(right)

myfile = fopen( strcat(outputdir, '/dev1/filtered.txt'), 'w');
fprintf(myfile, '%g\n', leftchirpandright);
fclose(myfile);

myfile = fopen( strcat(outputdir, '/dev1/left.txt'), 'w');
fprintf(myfile, '%g\n', left);
fclose(myfile);

myfile = fopen( strcat(outputdir, '/dev1/right.txt'), 'w');
fprintf(myfile, '%g\n', right);
fclose(myfile);

%for dev2
leftchirpandright = csvread('dev2_matlabfile.txt');

% [b,a] = butter(20,0.4,'high');
% filt=filter(b,a,leftchirpandright);
% leftchirpandright = filt;

% [b,a] = butter(9,0.5,'high');
% [b,a] = butter(n, Wn);
% filt=filter(b,a,leftchirpandright);
% leftchirpandright = filt;

% [b,a] = butter(15,0.7,'high');
% filt=filter(b,a,leftchirpandright);
% leftchirpandright = filt;

left = abs(hilbert( filter(mf_left, 1, leftchirpandright ) )) ;
% figure()
% plot(left)

right =  abs(hilbert( filter(mf_right, 1, leftchirpandright) ));
% figure()
% plot(right)

myfile = fopen( strcat(outputdir, '/dev2/filtered.txt'), 'w');
fprintf(myfile, '%g\n', leftchirpandright);
fclose(myfile);

myfile = fopen( strcat(outputdir, '/dev2/left.txt'), 'w');
fprintf(myfile, '%g\n', left);
fclose(myfile);

myfile = fopen( strcat(outputdir, '/dev2/right.txt'), 'w');
fprintf(myfile, '%g\n', right);
fclose(myfile);

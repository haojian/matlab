outputdir = '/Users/haojian/tracko/TrackoEvaluation/python/sundaynight/2k-6k-uni-2000frame';
downchirp = csvread('downchirp.txt');
upchirp = csvread('upchirp.txt');
upchirp = upchirp(1:2080);
mf_left = flipud(upchirp(:));
mf_right = flipud(downchirp(:));


%for dev1
leftchirpandright = csvread('dev1_matlabfile.txt');

left = abs(hilbert( filter(mf_left, 1, leftchirpandright ) )) ;
figure()
plot(left)

right =  abs(hilbert( filter(mf_right, 1, leftchirpandright) ));
figure()
plot(right)


myfile = fopen( strcat(outputdir, '/dev1/left.txt'), 'w');
fprintf(myfile, '%g\n', left);
fclose(myfile);

myfile = fopen( strcat(outputdir, '/dev1/right.txt'), 'w');
fprintf(myfile, '%g\n', right);
fclose(myfile);

%for dev2
leftchirpandright = csvread('dev2_matlabfile.txt');

left = abs(hilbert( filter(mf_left, 1, leftchirpandright ) )) ;
% figure()
% plot(left)

right =  abs(hilbert( filter(mf_right, 1, leftchirpandright) ));
% figure()
% plot(right)

myfile = fopen( strcat(outputdir, '/dev2/left.txt'), 'w');
fprintf(myfile, '%g\n', left);
fclose(myfile);

myfile = fopen( strcat(outputdir, '/dev2/right.txt'), 'w');
fprintf(myfile, '%g\n', right);
fclose(myfile);

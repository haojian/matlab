

% A template is given
temp = randn(2080,1);

% Create a matched filter based on the template
b = flipud(temp(:));

% For testing the matched filter, create a random signal which
% contains a match for the template at some time index
x = [randn(1000,1); temp(:); randn(1000,1)];
n = 1:length(x);

% Process the signal with the matched filter
% y = abs(hilbert(filter(b,1,x)));
y = (filter(b,1,x));
% plot(y)
% figure()
% y = xcorr(x, b);


% Set a detection threshold (exmaple used is 90% of template)
thresh = 0.9

% Compute normalizing factor
u = temp.'*temp;

% Find matches
matches = n(y>thresh*u);

disp(size(u))

% Plot the results
plot(n,y,'b', n(matches), y(matches), 'ro');
% plot(y)

% Print the results to the console
display(matches);


% c = dot(x(1111111+1: 1: 1111111+length(temp)),temp);
% disp(c)
% c = dot(x(1111111: 1: 1111111+length(temp))-1,temp);
% disp(c)
% c = dot(x(500: 1: 1049),temp);
% disp(c)
% c = dot(x(501: 1: 1050),temp);
% disp(c)
% 
% c = dot(x(20: 1: 569),temp);
% disp(c)
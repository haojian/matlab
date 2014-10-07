

% A template is given
temp = randn(100,1);

% Create a matched filter based on the template
b = flipud(temp(:));

% For testing the matched filter, create a random signal which
% contains a match for the template at some time index
x = [randn(200,1); temp(:); randn(300,1)];
n = 1:length(x);

% Process the signal with the matched filter
y = filter(b,1,x);

% Set a detection threshold (exmaple used is 90% of template)
thresh = 0.9

% Compute normalizing factor
u = temp.'*temp;

% Find matches
matches = n(y>thresh*u);

% Plot the results
plot(n,y,'b', n(matches), y(matches), 'ro');

% Print the results to the console
display(matches);
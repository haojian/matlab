function [] = func_matchfilter( audio, template )
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
    % Create a matched filter based on the template
    [rows columns] = size(template);
    if rows == 1
        temp = rot90(template, 3);
    else
        temp = template;
    end
    b = flipud(temp(:));
    
    
    [rows columns] = size(audio);
    if rows == 1
        x = rot90(audio,3);
    else
        x = audio;
    end
        
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
end


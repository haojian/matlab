% Error distribution - 2000 frame - 2k ~ 6k
% ncount =csvread('error_hist.csv');
% 
% figure
% hist(ncount)
% colormap summer
% 
% % Add a legend
% legend('dLL', 'dLR', 'dRL', 'dRR')
% 
% % Add title and axis labels
% title('Error distribution - 2000 frame - 2k ~ 6k')
% xlabel('Errors(cm)')
% ylabel('Number of instances')

% Error distribution - 2000 frame - 18k ~ 22k - uni
% ncount =csvread('error_hist.csv');
% figure
% hist(ncount)
% colormap summer
% % Add a legend
% legend('dLL', 'dLR', 'dRL', 'dRR')
% % Add title and axis labels
% title('Error distribution - 2000 frame - 18k ~ 22k - uni')
% xlabel('Errors(cm)')
% ylabel('Number of instances')

% Error distribution - 2000 frame - 18k ~ 22k - mix
ncount =csvread('18k-22k-2000-mix.csv');
figure
[counts, binValues] = hist(ncount);
total = sum(counts)
normalizedCounts = 100 * counts / total(1);
bar(binValues, normalizedCounts, 'barwidth', 1);

colormap summer
% Add a legend
legend('dLL', 'dLR', 'dRL', 'dRR')
% Add title and axis labels
title('Error distribution - 2000 frame - 18k ~ 22k - mix')
xlabel('Errors(cm)')
ylabel('Percentage of distribution (%)')
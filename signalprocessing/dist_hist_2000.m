figure
colormap summer
xbins1 = [-8:1:8]; 
% Error distribution - 2000 frame - 2k ~ 6k
ax1 = subplot(3,1,1);
ncount1 =csvread('2k-6k-2000-uni.csv');
hist(ax1, ncount1, xbins1)
% Add a legend
legend('dLL', 'dLR', 'dRL', 'dRR')
% Add title and axis labels
title('Error distribution - 2000 frame - 2k ~ 6k')
xlabel('Errors(cm)')
ylabel('Number of instances')

% Error distribution - 2000 frame - 18k ~ 22k
ncount2 =csvread('18k-22k-2000-uni.csv');
xbins2 = [-14:1:14]; 
ax2 = subplot(3,1,2);
hist(ax2, ncount2, xbins2)
% Add a legend
legend('dLL', 'dLR', 'dRL', 'dRR')
% Add title and axis labels
title('Error distribution - 2000 frame - 18k ~ 22k - uni')
xlabel('Errors(cm)')
ylabel('Number of instances')



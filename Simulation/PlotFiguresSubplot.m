h1 = openfig('AbortLow.fig','reuse'); % open figure
ax1 = gca; % get handle to axes of figure
h2 = openfig('AbortHigh.fig','reuse');
ax2 = gca;
% test1.fig and test2.fig are the names of the figure files which you would % like to copy into multiple subplots
h3 = figure; %create new figure
set(h3, 'Color', [1,1,1]);
s1 = subplot(1,2,1); %create and get handle to the subplot axes
ylabel('True load mass ($m_p$)', 'interpreter', 'latex');
set(s1,'xtick',[2,3],'xticklabel',{'Raise';'Abort Low'});
axis([1 4 0.85 0.95]);
box on;
s2 = subplot(1,2,2);
ylabel('True load mass ($m_p$)', 'interpreter', 'latex');
set(s2,'xtick',[2,3],'xticklabel',{'Raise';'Abort High'});
axis([1 4 1.95 2.05]);
box on;
fig1 = get(ax1,'children'); %get handle to all the children in the figure
fig2 = get(ax2,'children');
copyobj(fig1,s1); %copy children to new parent axes i.e. the subplot axes
copyobj(fig2,s2);



runs = 1:100;

fig = figure;
set(fig, 'Color', [1,1,1])
hold on;
box on;
axis([1 4 1.95 2.05]);
%title('Varying $m_p$ around the switching point of Raise and Abort High', 'interpreter', 'latex');
ylabel('True load mass ($m_p$)', 'interpreter', 'latex');
%xlabel('mode', 'interpreter', 'latex');
set(gca,'xtick',[2,3],'xticklabel',{'Raise';'Abort High'})

xs = zeros(numel(runs),1);
ys = zeros(numel(runs),1);

for i = runs
    xs(i) = out(1,i).mode.Data(end);
    ys(i) = out(1,i).mass.Data(1);
 
    %plot(xs(i),ys(i), 'r.', 'MarkerSize', 6);
end

ys_Raise = ys(xs==2);
ys_Abort = ys(xs==4);

max_ys_Raise = max(ys_Raise);
max_ys_Abort = max(ys_Abort);
min_ys_Raise = min(ys_Raise);
min_ys_Abort = min(ys_Abort);
median_ys_Raise = median(ys_Raise);
median_ys_Abort = median(ys_Abort);
Q1_ys_Raise = (median_ys_Raise+max_ys_Raise)/2;
Q1_ys_Abort = (median_ys_Abort+max_ys_Abort)/2;
Q2_ys_Raise = (median_ys_Raise+min_ys_Raise)/2;
Q2_ys_Abort = (median_ys_Abort+min_ys_Abort)/2;


% PLOT FIRST BOX PLOT
plot([2,2],[max_ys_Raise,Q1_ys_Raise],'k-');
plot([2,2],[min_ys_Raise,Q2_ys_Raise],'k-');

plot([1.95,2.05],repmat(max_ys_Raise,1,2),'k-');
plot([1.95,2.05],repmat(min_ys_Raise,1,2),'k-');

plot([1.95,2.05],repmat(median_ys_Raise,1,2),'r-');

plot([1.95,2.05],repmat(Q1_ys_Raise,1,2),'b-');
plot([1.95,2.05],repmat(Q2_ys_Raise,1,2),'b-');
plot([1.95,1.95],[Q1_ys_Raise,Q2_ys_Raise],'b-');
plot([2.05,2.05],[Q1_ys_Raise,Q2_ys_Raise],'b-');
%

% PLOT SECOND BOX PLOT
plot([3,3],[max_ys_Abort,Q1_ys_Abort],'k-');
plot([3,3],[min_ys_Abort,Q2_ys_Abort],'k-');

plot([2.95,3.05],repmat(max_ys_Abort,1,2),'k-');
plot([2.95,3.05],repmat(min_ys_Abort,1,2),'k-');

plot([2.95,3.05],repmat(median_ys_Abort,1,2),'r-');

plot([2.95,3.05],repmat(Q1_ys_Abort,1,2),'b-');
plot([2.95,3.05],repmat(Q2_ys_Abort,1,2),'b-');
plot([2.95,2.95],[Q1_ys_Abort,Q2_ys_Abort],'b-');
plot([3.05,3.05],[Q1_ys_Abort,Q2_ys_Abort],'b-');
%









runs = 1:5;

fig = figure;
set(fig, 'Color', [1,1,1])
hold on;
grid on;
box on;
axis([12,30,0,2e-11]);
title('$|| (e_{x,p},~e_{y,p}) ||$ at different $m_p$ with $m_p^*=1 kg$', 'interpreter', 'latex');
ylabel('$|| (e_{x,p},~e_{y,p}) ||$', 'interpreter', 'latex');
xlabel('$time~[s]$', 'interpreter', 'latex');

Legend = {};
for i = runs
    
    firstIndex = find(out(1,i).mode.Data > 1, 1) - 5;
    
    x = out(1,i).offsetXY.Time(firstIndex:end);
    y = out(1,i).offsetXY.Data(firstIndex:end);
 
    plot(x,y, 'Color', [1/(i),0,1-1/(i), 1-abs((i - 3)/3)]);
    Legend{end+1} = cellstr(strcat('$m_p=',num2str(out(1,i).mass.Data(1)),'$'));
end

legend(string(Legend),'interpreter', 'latex');
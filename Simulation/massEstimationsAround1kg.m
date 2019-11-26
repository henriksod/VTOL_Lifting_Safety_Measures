
runs = 1:5;

fig = figure;
set(fig, 'Color', [1,1,1])
hold on;
grid on;
box on;
axis tight;
title('$m_p-\hat{m}_p$ at different $m_p$ with $m_p^*=1 kg$', 'interpreter', 'latex');
ylabel('$m_p-\hat{m}_p$', 'interpreter', 'latex');
xlabel('$time~[s]$', 'interpreter', 'latex');

data = ["--";"-.";"-";"-.";"--"];
style = cellstr(data);

Legend = {};
for i = runs
    
    firstIndex = find(out(1,i).mode.Data > 1, 1) - 5;
    
    t = out(1,i).massError.Time(firstIndex:end);
    y = out(1,i).massError.Data(firstIndex:end);
 
    plot(t,y, string(style(i)),'Color', [1/(i),0,1-1/(i), 1-abs((i - 3)/3)*0.8], 'LineWidth',2);
    Legend{end+1} = cellstr(strcat('$m_p=',num2str(out(1,i).mass.Data(1)),'$'));
end

legend(string(Legend),'interpreter', 'latex');
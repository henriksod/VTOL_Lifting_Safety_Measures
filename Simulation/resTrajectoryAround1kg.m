
runs = 1:5;

fig = figure;
set(fig, 'Color', [1,1,1])
hold on;
grid on;
box on;
axis([12.46 40 0 0.35]);
title('$|\tilde{\rho}_q|$ at different $m_p$ with $m_p^*=1 kg$', 'interpreter', 'latex');
ylabel('$|\tilde{\rho}_q|$', 'interpreter', 'latex');
xlabel('$time~[s]$', 'interpreter', 'latex');

data = ["--";"-.";"-";"-.";"--"];
style = cellstr(data);

Legend = {};
for i = runs
    
    firstIndex = find(out(1,i).mode.Data > 1, 1) - 5;
    
    t = out(1,i).resTrajectory.Time(firstIndex:end);
    y = out(1,i).resTrajectory.Data(firstIndex:end,:);
    normy = zeros(numel(y(:,1)),1);
    for j = 1:numel(y(:,1))
        normy(j) = norm(y(j,:));
    end
 
    %plot(t,g, 'k--');
    plot(t,normy, string(style(i)),'Color', [1/(i),0,1-1/(i), 1-abs((i - 3)/3)*0.8], 'LineWidth',2);
    Legend{end+1} = cellstr(strcat('$m_p=',num2str(out(1,i).mass.Data(1)),'$'));
end

legend(string(Legend),'interpreter', 'latex');
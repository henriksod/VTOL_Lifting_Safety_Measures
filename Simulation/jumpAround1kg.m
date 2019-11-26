
runs = 1:5;

fig = figure;
set(fig, 'Color', [1,1,1]);

subplot(4,2,[3,5,7]);
hold on;
grid on;
box on;
axis([12.46,40,4.07,4.1]);
%title('$|| \rho_q-\rho_q ||$ at different $m_p$ with $m_p^*=1 kg$', 'interpreter', 'latex');
ylabel('$||\rho_q-\rho_q ||$', 'interpreter', 'latex');
xlabel('$time~[s]$', 'interpreter', 'latex');

data = ["--";"-.";"-";"-.";"--"];
style = cellstr(data);

%Legend = {};
for i = runs
    
    firstIndex = find(out(1,i).mode.Data > 1, 1);
    
    t = out(1,i).distZ.Time(firstIndex:end);
    y = out(1,i).distZ.Data(firstIndex:end);
 
    plot(t,y, 'Color', [1/(i),0,1-1/(i), 1-abs((i - 3)/3)]);
    plot(t,y, string(style(i)),'Color', [1/(i),0,1-1/(i), 1-abs((i - 3)/3)*0.8], 'LineWidth',2);
    %Legend{end+1} = cellstr(strcat('$m_p=',num2str(out(1,i).mass.Data(1)),'$'));
end

%legend(string(Legend),'Location','northeastoutside','interpreter', 'latex');

subplot(4,2,[4,6,8]);
hold on;
grid on;
box on;
axis tight;
axis([12.46,40,0,7e-12]);
ylabel('$|| (e_{x,p},~e_{y,p}) ||$', 'interpreter', 'latex');
xlabel('$time~[s]$', 'interpreter', 'latex');

Legend = {};
for i = runs
    
    firstIndex = find(out(1,i).mode.Data > 1, 1);
    
    x = out(1,i).offsetXY.Time(firstIndex:end);
    y = out(1,i).offsetXY.Data(firstIndex:end,:);

    normy = zeros(numel(y(:,1)),1);
    for j = 1:numel(y(:,1))
        normy(j) = norm(y(j,:));
    end

    plot(x,normy, string(style(i)),'Color', [1/(i),0,1-1/(i), 1-abs((i - 3)/3)*0.8], 'LineWidth',2);
    Legend{end+1} = cellstr(strcat('$m_p=',num2str(out(1,i).mass.Data(1)),'$'));
end

legend(string(Legend),'interpreter', 'latex');
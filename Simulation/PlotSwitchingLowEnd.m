
close all;

runs = 8:16;

fig = figure;

subplot(211);
axis([11.94, 11.960, -1.2e-3, -0.5e-3]);
hold on;

%Legend={''};

for i = runs
    firstIndex = find(out(1,i).resTrajectory.Time >= 11.933, 1);
    lastIndex = find(out(1,i).resTrajectory.Time >= 11.960, 1);
    indices = firstIndex:lastIndex;

    t = out(1,i).resTrajectory.Time(indices);
    y = out(1,i).resTrajectory.Data(indices,3);
 
    plot(t,y);
    %Legend{end+1} = {num2str(out(1,i).mass.Data(1))};
end

plot(t,-0.001*ones(size(t)));

%legend(Legend{2:end});

subplot(212);
hold on;

%Legend={''};

for i = runs
    firstIndex = find(out(1,i).mode.Time >= 11.933, 1);
    lastIndex = find(out(1,i).mode.Time >= 11.960, 1);
    indices = firstIndex:lastIndex;

    t = out(1,i).mode.Time(indices);
    y = out(1,i).mode.Data(indices);
 
    plot(t,y);
    %Legend{end+1} = {num2str(out(1,i).mass.Data(1))};
    
end

%legend(Legend{2:end});
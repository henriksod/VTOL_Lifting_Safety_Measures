close all

fug = figure(1);
set(fug,'Color', [1 1 1]);

plot3(result(1,1), -result(1,2), -result(1,3),'or');
hold on
plot3(result(:,1), -result(:,2), -result(:,3),'-k');
plot3(result(end,1), -result(end,2), -result(end,3),'xr');

% for i = 1:length(result(:,13))
%     if (result(i,19) == 0)
%         plot3(result(i,13), -result(i,14), -result(i,15),'.r');
%     elseif (result(i,19) > 9.81*0.2)
%         plot3(result(i,13), -result(i,14), -result(i,15),'.b');
%     else
%         plot3(result(i,13), -result(i,14), -result(i,15),'.g');
%     end
% end

plot3(result(1,7), -result(1,8), -result(1,9),'ok');

plot3(result(:,7), -result(:,8), -result(:,9),'-r');
plot3(result(end,7), -result(end,8), -result(end,9),'xk');

plot3([result(end,1) result(end,7)], [-result(end,2) -result(end,8)], [-result(end,3) -result(end,9)],'--k');
grid on
xlabel('x');
ylabel('y');
zlabel('z (height above ground)');
%legend('Quadrotor start','Quadrotor Trajectory','Quadrotor end','Load start','Load trajectory','Load end');

fug = figure(2);
set(fug,'Color', [1 1 1]); 
grid on
hold on

plot(result(1,1), -result(1,2), 'or');
plot(result(:,1), -result(:,2),'-k');
plot(result(end,1), -result(end,2),'xr');

plot(result(1,7), -result(1,8),'ok');
plot(result(:,7), -result(:,8),'-r');
plot(result(end,7), -result(end,8),'xk');

plot([result(end,1) result(end,7)], [-result(end,2) -result(end,8)],'--k');

xlabel('x');
ylabel('y');


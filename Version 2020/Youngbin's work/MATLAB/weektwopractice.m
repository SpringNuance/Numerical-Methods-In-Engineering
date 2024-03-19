clear all;
clc;
x=1:0.1:10;
y=x.^2+1;

figure(1)
plot(x,y,'k-*', 'displayname','functional', 'Markersize', 10, 'MarkerIndices', 1:5:length(x));
xlabel('x');
ylabel('y');
title('x.^2+1');
legend;
set(gca, 'Fontname','Times New Roman', 'Font Size', 12)
xlim([2 5]);
ylim([10 25]);
print(figure(1),'functional','-dpng','r-400');
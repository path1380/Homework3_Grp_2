str = 'output_';
tmp = num2str(2); %use perl to overwrite string 
colorVec = hsv(20);
num_intervals = 2

%loop over each file to build plots
for i = 1:log2(num_intervals)
    str = 'output_';
    str = strcat(str,tmp,'_',num2str(i),'.txt');
    x = load(str);
    intvec = 2.^(1:length(x))';

    loglog(intvec, x(:,1),'-o','Color', colorVec(i,:));
    legendInfo{i} = ['q = ' num2str(i)];
    hold on
end
set(gca,'fontsize',18);
xlabel('Number of Intervals')
ylabel('Log Error')
title('$L_\infty$ Error','Interpreter','latex')
ylim([eps,2])
%legend(legendInfo)

print -depsc2 maxError_2
print -dpng maxError_2
exit
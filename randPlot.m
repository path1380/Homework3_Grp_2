x = load('output_rand.txt');
ind = 1:30;
ind = 0.01*ind';
figure(1)
semilogy(ind,x(:,1));

set(gca,'fontsize',18);
xlabel('Percent Randomness')
ylabel('Log Error')
title('$L_\infty$ Error','Interpreter','latex')
ylim([eps,100])
%legend(legendInfo)

print -depsc2 maxRandErr
print -dpng maxRandErr
close all

figure(2)
semilogy(ind,x(:,2));
set(gca,'fontsize',18);
xlabel('Percent Randomness')
ylabel('Log Error')
title('$L_2$ Error','Interpreter','latex')
ylim([eps,100])
%legend(legendInfo)

print -depsc2 squareRandErr
print -dpng squareRandErr
close all
exit
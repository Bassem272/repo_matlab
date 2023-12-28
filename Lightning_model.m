%%%% The Lightning Current Waveform %%%%
clear,clc

dt = 1*1e-9; Tmax = 20*1e-6; Nmax = round(Tmax/dt) + 1;
T = 0:dt:Tmax; Ics1(Nmax) = 0; Ics2(Nmax) = 0;
Io1 = 28*1e3; T11 = 1.8*1e-6; T21 = 95*1e-6; no1 = 2;
% Io1 = [6 6 5 5 8 17 17 12]*1e3; T11 = [2 3 3.5 5 6 7 70 12]*1e-6;
% T21 = [100 76 10 30 26 23.5 200 26]*1e-6; no1 = [2 2 3 5 9 30 2 14];
eta1 = exp(-((T11./T21).*(no1.*T21./T11).^(1./no1))); n = 0;
for t = (0:dt:Tmax)
    n = n+1;
    Ics1(n) = sum(Io1./eta1.*(t./T11).^no1./(1+(t./T11).^no1).*(exp(-t./T21)));
end
didt1 = (Ics1(2:end) - Ics1(1:(end-1)))/dt;

Io2 = [10.7 6.5]*1e3; T12 = [0.25 2.0]*1e-6; T22 = [2.5 280]*1e-6; no2 = [2 2];
% Io2 = [10.7 6.5]*1e3; T12 = [0.25 2.1]*1e-6; T22 = [2.5 230]*1e-6; no2 = [2 2];
eta2 = exp(-((T12./T22).*(no2.*T22./T12).^(1./no2))); n = 0;
for t = (0:dt:Tmax)
    n = n+1;
    Ics2(n) = sum(Io2./eta2.*(t./T12).^no2./(1+(t./T12).^no2).*(exp(-t./T22)));
end
didt2 = (Ics2(2:end) - Ics2(1:(end-1)))/dt;

figure,
yyaxis left,
plot(T*1e6,Ics1/1e3,'Color',[0 0 0.9],'LineWidth',3,'LineStyle','-')
xlabel('{Time ($\mu$s)}','Interpreter','latex'), xlim([-0.25 20.25])
ylabel('$I_{RS}$ (kA)','Interpreter','latex'), ylim([-1.5 30])
% text(0.02,80,'{$\theta = 0$}','Interpreter','latex')
% text(0.02,80,'{$\theta = \frac{\pi}{2}$}','Interpreter','latex')
set(findall(gcf,'type','text'),'FontName','Euclid','FontSize',36,'fontWeight','normal') % Set title, axes labels, and legend font size
set(gca,'TickLabelInterpreter','latex')
set(gca,'TickDir','out','box','off','FontName','Euclid','FontSize',36,'fontWeight','normal','linewidth',1.5,...
    'XColor',[0 0 0],'YColor',[0 0 0.9],...
    'XTick',(-1:1:21),'XTickLabel',{'' '0' '' '' '' '4' '' '' '' '8' '' '' '' '12' '' '' '' '16' '' '' '' '20' ''},...
    'YTick',(0:3:54),'YTickLabel',{'0' '' '' '9' '' '' '18' '' '' '27' '' '' '36' '' '' '45' '' '' '54'},...
    'XGrid','on','YGrid','on','GridLineStyle',':','GridColor',[0 0 0]) % Set axes tick label font size, color, and line width
set(gcf,'Color','w','units','normalized','outerposition',[0 0 1 1]); % Maximize figure and white boder.

yyaxis right,

plot((T(1:(Nmax-1)) + T(2:Nmax))/2*1e6, didt1/1e9,'Color',[0.9 0 0],'LineWidth',3,'LineStyle','-')
xlabel('{Time ($\mu$s)}','Interpreter','latex'), xlim([-0.25 20.25])
ylabel('${d I_{RS}}/{dt}$ (${kA}/{\mu}$s)','Interpreter','latex'), ylim([-2 42])
% text(0.02,80,'{$\theta = 0$}','Interpreter','latex')
% text(0.02,80,'{$\theta = \frac{\pi}{2}$}','Interpreter','latex')
set(findall(gcf,'type','text'),'FontName','Euclid','FontSize',36,'fontWeight','normal') % Set title, axes labels, and legend font size
set(gca,'TickLabelInterpreter','latex')
set(gca,'TickDir','out','box','off','FontName','Euclid','FontSize',36,'fontWeight','normal','linewidth',1.5,...
    'XColor',[0 0 0],'YColor',[0.9 0 0],...
    'XTick',(-1:1:21),'XTickLabel',{'' '0' '' '' '' '4' '' '' '' '8' '' '' '' '12' '' '' '' '16' '' '' '' '20' ''},...
    'YTick',(-3:3:48),'YTickLabel',{'' '0' '' '' '' '12' '' '' '24' '' '' '' '36' '' '' '' '48'},...
    'XGrid','on','YGrid','on','GridLineStyle',':','GridColor',[0 0 0]) % Set axes tick label font size, color, and line width
set(gcf,'Color','w','units','normalized','outerposition',[0 0 1 1]); % Maximize figure and white boder.

hold on

yyaxis left,
plot(T*1e6,Ics2/1e3,'Color',[0 0 0.9],'LineWidth',3,'LineStyle',':')

yyaxis right,
plot((T(1:(Nmax-1)) + T(2:Nmax))/2*1e6, didt2/1e9,'Color',[0.9 0 0],'LineWidth',3,'LineStyle',':')
legend({'FRS','SRS','FRS','SRS'},'NumColumns',4,'Location','Best','FontSize',36,'Orientation','horizontal','Interpreter','latex'), legend boxoff

hold off

% filname = sprintf('I_RS_yy'); export_fig(filname,'-pdf','-r600','-dpdf','-painters');
% filname = sprintf('I_RS_yy'); export_fig(filname,'-eps','-r600','-deps','-painters');

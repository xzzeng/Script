clear
figure

x=1:4;
subplot(3,1,1)
% For the energy barrier of NEB
y_hist=[1.63 1.59 2.02 2.08;1.55 1.41 1.45 1.43; 1.03 0.98 1.07 1.12;1.88 1.75 1.62 1.54];
b=bar(x,y_hist);

color=[0 0 0;0 0 0.5;0 0 0.8;0 0 1];
for i=1:4
    set(b(i),'FaceColor',color(i,:));
end

%set(handle(1),'facecolor','k','Markerfacecolor','k')
%set(handle(2),'facecolor','b','Markerfacecolor','k')
%set(handle(3),'facecolor','b','Markerfacecolor','k')
%set(handle(4),'facecolor','b','Markerfacecolor','b')
%im_hatchC = applyhatch_plusC(1,'\.-x','kbbb');

%%y11=[1.63,1.55,1.03,1.88];
%%plot(x,y11,'ko','linewidth',2,'Markersize',10,'Markerfacecolor','k')
set(gca,'fontsize',20)
set(gca,'linewidth',2)

set(gca,'XTick', [1 2 3 4]);
%set(gca,'XTickLabel',{'CH4','CH3','CH2','CH'});
set(gca,'XTickLabel',{});
set(gca,'yTick', [1 2]);

xlim([0 5])
ylim([0 2.5])
hold on

%%y12=[1.59,1.41,0.98,1.75];
%%plot(x,y12,'bs','linewidth',2,'Markersize',10,'Markerfacecolor','b')

y13=[2.02,1.45,1.07,1.62];
%%plot(x,y13,'bd','linewidth',2,'Markersize',9,'Markerfacecolor','b')

% For the free energy barrier of 300K
y14=[2.08,1.43,1.12,1.54];
%%ebar14=[0.03,0.03,0.04,0.05];
%%errorbar(x,y14,ebar14,'b^','linewidth',2,'Markersize',8)
%barweb(x,y2,ebar2)

%ylabel('Dissociation barrier (eV)')
legend('MEP-0K','MEP-300K','cMEP-300K','PMF-300K')
legend('boxoff')

subplot(3,1,2)

y1300_hist=[2.08 1.807;1.544 1.439;1.227 1.169;1.872 0.85];
b2=bar(x,y1300_hist);

color=[0.8 0 0;1 0 0];
for i=1:2
    set(b2(i),'FaceColor',color(i,:));
end


y21=[2.08,1.544,1.227,1.872];
%plot(x,y21,'rs','linewidth',2,'Markersize',10,'Markerfacecolor','r')
set(gca,'fontsize',20)
set(gca,'linewidth',2)

set(gca,'XTick', [1 2 3 4]);
set(gca,'XTickLabel',{'CH$_4$','CH$_3$','CH$_2$','CH'},'TickLabelInterpreter','latex');

set(gca,'yTick', [1 2]);

xlim([0 5])
ylim([0.5 2.5])

hold on

% For the free energy barrier of 1300K
y22=[1.807,1.439,1.169,0.85];
ebar22=[0.08,0.07,0.04,0.05];
%errorbar(x,y22,ebar22,'r^','linewidth',2,'Markersize',8)
%barweb(x,y2,ebar2)

ylabel('Dissociation barrier (eV)')
legend('MEP-1300K','PMF-1300K')
legend('boxoff')

subplot(3,1,3)

%*********************************************************
%*********************************************************
% the NCN for the NEB along CH4 CH3 CH2 CH
%*********************************************************
ncn_neb_is=[0.003181,2.487011,3.357176,2.978038];
ncn_neb_ts=[3.344495,3.539926,4.612271,4.661760];
%%ncn_neb_fs=[4.751969,5.168288,5.331161,6.205243];

% the NCN for the 300K along CH4 CH3 CH2 CH
ncn_300k_is=[0.003144,2.319665,3.074099,2.845936];
ncn_300k_ts=[3.103093,3.624610,4.572498,4.341641];

% for the delta_ncn at NEB
delta_ncn_neb=ncn_neb_ts-ncn_neb_is;

% for the delta_ncn at 300K
delta_ncn_300k=ncn_300k_ts-ncn_300k_is;

x31=[2.09,1.62,1.40,0.49];
x31ebar=[0.2,0.30,0.34,0.3];
%*********************************************************
%*********************************************************

%*********************************************************
%*********************************************************
% The NCN for the free energy at 1300K
x32=[1.68,1.54,1.26,1.85];
x32ebar=[0.27,0.18,0.20,0.24];
%*********************************************************
%*********************************************************


% For the correct result for NEB at 1300K
y31=[2.08,1.54,1.227,1.872];
y31ebar=[0.03,0.03,0.04,0.05];

% For the free energy barrier of 1300K
y32=[2.33,1.44,1.17,0.85];
y32ebar=[0.04,0.03,0.04,0.06];

x1300k=x32-x31;
y1300k=y32-y31;
x300k=delta_ncn_300k-delta_ncn_neb;
y300k=y14-y13;

plot(x32-x31,y32-y31,'ro','linewidth',2,'Markersize',8,'Markerfacecolor','r')
hold on
h1=herrorbar(x32-x31,y32-y31,x31ebar,'ro');
set(h1,'linewidth',2)


plot(delta_ncn_300k-delta_ncn_neb,y14-y13,'bo','linewidth',2,'Markersize',8,'Markerfacecolor','b')
hold on
h2=herrorbar(delta_ncn_300k-delta_ncn_neb,y14-y13,x32ebar,'bo');
set(h2,'linewidth',2)

% For the energy barrier of NEB
%%errorbar(y32-y31,x32-x31,x31ebar,'ro','linewidth',2,'Markersize',8,'Markerfacecolor','r')
hold on
xlim([-1.0 2])
ylim([-1.5 1])
plot([-1.0 2],[0,0],'k--','linewidth',2)
plot([0 0],[-1.5 1],'k--','linewidth',2)

set(gca,'fontsize',20)
set(gca,'linewidth',2)

%hold on
ylabel('\DeltaF (eV)')
xlabel('\Delta_N_C_N^''')

%for the new point
%the corrected barrier for the second path of CH
y1_new=1.64;

%the free energy barrier under 300K
y2_new=0.96;

NCN_300(1:2)=[2.893,5.8];
xncn3=NCN_300(2)-NCN_300(1);

NCN_NEB(1:2)=[2.960,5.16];
xncn0=NCN_NEB(2)-NCN_NEB(1);

ebarp=0.35;
x300k_more=xncn3-xncn0;
y300K_more=y2_new-y1_new;

hold on
h3=herrorbar(xncn3-xncn0,y2_new-y1_new,ebarp,'bo');
set(h3,'linewidth',2,'Markersize',8,'Markerfacecolor','b')
%%errorbar(y2_new-y1_new,xncn3-xncn0,ebarp,'bo','linewidth',2,'Markersize',8,'Markerfacecolor','b')

clear
figure

n=18;
m=36;
r0=2.0;

x=0:0.1:4;
nsize_x=size(x,2);
y(nsize_x)=0;

for i=1:nsize_x
    if x(i) == r0
        y(i)=n/m;
    else
        y(i)=(1-(x(i)/r0)^n)/(1-(x(i)/r0)^m);
    end
end

plot(x,y,'r-','linewidth',2)
set(gca,'fontsize',20)
set(gca,'linewidth',2)

hold on
plot([r0 r0],[0 1],'k--','linewidth',2)
plot(r0,0.5,'k--','linewidth',2)

plot([3 3],[0 1],'g--','linewidth',1)

text(3+0.15,0.5,'r_{cutoff}','fontsize',20)

text(r0+0.15,0.5,'0.5','fontsize',20)

xlabel('Bond length of H-Cu (A)')
ylabel('H_C_N')

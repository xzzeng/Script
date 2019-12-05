
clearvars -except x r1 cx cy hx hy y1 y2 y3 y4

figure

%% define the baisc varibales
nstage=1;
ri_min=0.70;
ri_max=1.80;
rt_min=1.80;
rt_max=1.90;
rrr=1.10;
rrt=1.85;
rrf=3.00;
gastocoord=0.01;
alatt=10.2955;
alattx=-5.14775;
alatty=8.91615;

nn=size(r1);

%% collect the coordination information for the four H atoms
yy1=y1+y2+y3+y4;

%% obtain the position of the first layer copper atoms
xy_total(16*9,2)=0.0;
xy_cu(16,2)=0.0;
xy_cu(1,:)=[-0.00017068097686,0.00078444488594];
xy_cu(2,:)=[2.57351599813222,   0.00062446149443];
xy_cu(3,:)=[5.14720994091608,   0.00078897678832];
xy_cu(4,:)=[7.72134721241810,   0.00096434670794];
xy_cu(5,:)=[-1.28736456132654,   2.22986593108868];
xy_cu(6,:)=[1.28619618734046,   2.22924246144975];
xy_cu(7,:)=[3.86065706383625,   2.22931198352035];
xy_cu(8,:)=[6.43422579262915,   2.22990439775542];
xy_cu(9,:)=[-2.57447464062729,   4.45916106409796];
xy_cu(10,:)=[-0.00131895886108,   4.45891978583855];
xy_cu(11,:)=[2.57326838773421,   4.45895873052231];
xy_cu(12,:)=[5.14786953798028,   4.45905484475768];
xy_cu(13,:)=[-3.86107812730345,   6.68817896746928 ];
xy_cu(14,:)=[-1.28773358090766,   6.68816219763791];
xy_cu(15,:)=[1.28596153886027,   6.68861475663809];
xy_cu(16,:)=[3.86062675539471,   6.68857679942861];

indk=1;
for ix=-1:1
    for iy=-1:1
        xy_total((indk-1)*16+1:indk*16,1)=xy_cu(:,1)-alatt*ix-alattx*iy;
        xy_total((indk-1)*16+1:indk*16,2)=xy_cu(:,2)-alatty*iy;
        indk=indk+1;
    end
end

plot(xy_total(:,1),xy_total(:,2),'o','Markersize',10,'linewidth',2)
hold on

ipoint1=[-7.722,4.459];
ipoint2=[-2.574,-4.457];
ipoint3=[2.573,4.459];
ipoint4=[7.721,-4.457];

plot([ipoint1(1),ipoint2(1)],[ipoint1(2),ipoint2(2)],'k--','linewidth',1)
plot([ipoint2(1),ipoint4(1)],[ipoint2(2),ipoint4(2)],'k--','linewidth',1)
plot([ipoint4(1),ipoint3(1)],[ipoint4(2),ipoint3(2)],'k--','linewidth',1)
plot([ipoint3(1),ipoint1(1)],[ipoint3(2),ipoint1(2)],'k--','linewidth',1)

ylim([-7 7])
xlim([-10 10])
%% starting to plot

rtmp_r1=r1(1);
rtmp_yy1=yy1(1);
rtmp_prev_cx=cx(1);
rtmp_prev_cy=cy(1);
    
icase=1;
for i=2:nn    
    rtmp_cur_cx=cx(i);
    rtmp_cur_cy=cy(i);
    %for the periodic
    if alatt/2.0 <= rtmp_cur_cy - rtmp_prev_cy
        rtmp_cur_cx=rtmp_cur_cx-alattx;
        rtmp_cur_cy=rtmp_cur_cy-alatty;
    end
    if rtmp_cur_cy - rtmp_prev_cy <= -alatt/2.0
        rtmp_cur_cx=rtmp_cur_cx+alattx;
        rtmp_cur_cy=rtmp_cur_cy+alatty;
    end 
    
    if alatt/2.0 <= rtmp_cur_cx-rtmp_prev_cx
        rtmp_cur_cx=rtmp_cur_cx-alatt;
    end
    if rtmp_cur_cx - rtmp_prev_cx<= -alatt/2.0
        rtmp_cur_cx=rtmp_cur_cx+alatt;
    end
    
   % while(rtmp_prev_cx <=0)
   %     rtmp_prev_cx=rtmp_prev_cx+alatt;
   % end
    
   % while(rtmp_cur_cx <=0)
   %     rtmp_cur_cx=rtmp_cur_cx+alatt;
   % end
   
    if r1(i) <= rrt
        col=(r1(i)-rrr)^2/(rrt-rrr)^2*[1,0,-1]+[0,0,1];
    elseif r1(i) <=rrf
        col=(r1(i)-rrt)^2/(rrf-rrt)^2*[0,1,0]+[1,0,0];
    else
        col=[1,1,0];
    end
    
    if yy1(i) < gastocoord
        plot([rtmp_prev_cx, rtmp_cur_cx],[rtmp_prev_cy, rtmp_cur_cy],'color',[0,1,0],'linewidth',3)
        hold on
    else
        plot([rtmp_prev_cx, rtmp_cur_cx],[rtmp_prev_cy, rtmp_cur_cy],'color',col,'linewidth',3)
        hold on
    end
    
    %elseif ri_min <= r1(i) && r1(i) < ri_max
    %    icase=2;
    %    plot([rtmp_prev_cx, rtmp_cur_cx],[rtmp_prev_cy, rtmp_cur_cy],'color',[0,0,1],'linewidth',2)
    %    hold on         
    %elseif rt_min <= r1(i) && r1(i) <= rt_max
    %    icase=3;
    %    plot([rtmp_prev_cx, rtmp_cur_cx],[rtmp_prev_cy, rtmp_cur_cy],'color',[1,0,0],'linewidth',2)
    %    hold on 
    %else
    %    icase=4;
    %    plot([rtmp_prev_cx, rtmp_cur_cx],[rtmp_prev_cy, rtmp_cur_cy],'color',[0,0,0],'linewidth',1)
    %    hold on 
    %end    
    
    rtmp_prev_cx=cx(i);
    rtmp_prev_cy=cy(i);
end

set(gca,'fontsize',20)
set(gca,'linewidth',2)

%xlim([0 size(x,1)])
xlabel('C_x')
ylabel('C_y')
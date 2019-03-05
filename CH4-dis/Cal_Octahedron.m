clear

% ** This program mainly calculate the volume of octahedron with
% ** arbitrarily shape by spliting the original bulk into four tetrahedron
% ** and final sum all the volumes

% Firstly find the opposite vertex
% For the start vertex 
Cu26=[4.42959423,-0.04848820,11.29477500];
Cu43=[5.93949290,2.56655797,9.13695000];

% For the fix vertex
Cu46=[6.73783719,1.28691456,11.29775000];
Cu23=[3.72320232,1.28692076,9.13635000];

% For the changed vertex
Cu27=[5.93948398,0.00731803,9.13697500];
Cu42=[4.42953182,2.62244762,11.29472500];

% for the first tetrahedron
aa=Cu46-Cu26;
bb=Cu23-Cu26;
cc=Cu27-Cu26;

% obtain the volume from the mathmatical formula
tet1=abs(dot(cross(aa,bb),cc))/6
clear aa bb cc

% calculate the volume from matrix
%allv(1,1:4)=[1,1,1,1];
%allv(2:4,1)=Cu26;
%allv(2:4,2)=Cu46;
%allv(2:4,3)=Cu23;
%allv(2:4,4)=Cu27;

%det(allv)/6

% for the second tetrahedron
aa=Cu46-Cu26;
bb=Cu23-Cu26;
cc=Cu42-Cu26;

% obtain the volume from the mathmatical formula
tet2=abs(dot(cross(aa,bb),cc))/6
clear aa bb cc

%for the third tetrahedron
aa=Cu46-Cu43;
bb=Cu23-Cu43;
cc=Cu27-Cu43;

% obtain the volume from the mathmatical formula
tet3=abs(dot(cross(aa,bb),cc))/6
clear aa bb cc

%for the fourth tetrahedron
aa=Cu46-Cu43;
bb=Cu23-Cu43;
cc=Cu42-Cu43;

% obtain the volume from the mathmatical formula
tet4=abs(dot(cross(aa,bb),cc))/6
clear aa bb cc

sum=tet1+tet2+tet3+tet4


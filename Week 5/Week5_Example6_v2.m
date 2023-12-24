% example 6 Week 5
clear;clc;
close all

D=1;% Diameter (m)
R=0.5;
A_Analytical=pi*D^2/4;

n_rand_max=10000;

xc=0.5;yc=0.5;%coordinates of center 

for i_rand=1:n_rand_max
    n(i_rand)=i_rand;count=0;
  for j=1:i_rand
  xp=rand(1,1);
  yp=rand(1,1);
  r=sqrt((xp-xc)^2+(yp-yc)^2);
  if(r<=R)
      count=count+1;
  end
  end
  area_num(i_rand)=count/i_rand;
end
A_exact(1:n_rand_max)=A_Analytical;
figure (1); plot(n,area_num,'.',n,A_exact,'-');
ylim([0.6 1]);
H=figure(1);
savefig(H,'Circle_Area');
print(H,'-dtiff','Circle_Area');
clear all
m(1)=450000
x0(1)=6778000
y0(1)=0 
vx0(1)=0
vy0(1)=7700
m(2)=5.972*10^24
x0(2)=0
y0(2)=0
vx0(2)=0
vy0(2)=0
dt=1;
tmax=10000;
G=6.67*10^(-11);

[x,y,vx,vy,ax,ay,t] = orbit_Nbody(G,m,x0,y0,vx0,vy0,dt,tmax);
orbit_time(x,y,t)
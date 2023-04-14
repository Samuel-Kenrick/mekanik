function [x,y,vx,vy,ax,ay,t] = orbit_1body(G,M,x0,y0,vx0,vy0,dt,tmax)
m=1;
%starting point for a simple simulation program
%select number of time steps based
%on dt and tmax and elapsed time at each step
steps=tmax/dt;
t = 0:tmax/steps:tmax
%preallocate memory (increases performance)
x=zeros(steps,1);
y=zeros(steps,1);
vx=zeros(steps,1);
vy=zeros(steps,1);
ax=zeros(steps,1);
ay=zeros(steps,1);
% define a function for calculating the distance between two points
r=@(x,y)sqrt(x^2+y^2);
%define functions for calculating acceleration based on position
acx=@(x,y)(-G)*M*(x/(r(x,y)^3));
acy=@(x,y)(-G)*M*(y/(r(x,y)^3));
%set initial conditions
x(1)=x0+vx0+1/2*acx(x0,y0)*(dt)^2;
y(1)=y0+vy0+1/2*acy(x0,y0)*(dt)^2;
vx(1)=vx0+1/2*(acx(x0,y0)+acx(x(1),y(1)))*dt;
vy(1)=vy0+1/2*(acy(x0,y0)+acy(x(1),y(1)))*dt;
ax(1)=acx(x(1),y(1));
ay(1)=acy(x(1),y(1));
%simulate orbit
for i=1:(steps-1)
x(i+1)=x(i)+vx(i)*dt+1/2*acx(x(i),y(i))*(dt)^2; % update position
y(i+1)=y(i)+vy(i)*dt+1/2*acy(x(i),y(i))*(dt)^2; %
ax(i+1)=acx(x(i+1),y(i+1)); % update acceleration
ay(i+1)=acy(x(i+1),y(i+1)); %
vx(i+1)=vx(i)+1/2*(acx(x(i),y(i))+acx(x(i+1),y(i+1)))*dt; % update velocity
vy(i+1)=vy(i)+1/2*(acy(x(i),y(i))+acy(x(i+1),y(i+1)))*dt; %
end

for i=1:(steps-1)
    Ek(i) = m*((vx(i).^2+vy(i).^2)/2);
    Ep(i) = -G*M/r(x(i),y(i));
    Etot(i) = Ek(i)+Ep(i);
end
% finding the energy of the graph (its a capricorn)
figure(1)
plot(Ek)
hold on
plot(Ep)
hold on
plot(Etot)
hold off
for i=1:(steps-1)
    p(i) = sqrt(vx(i).^2+vy(i).^2)*m;
end
% finding the total momentum  
figure(2)
plot(p)


for i=1:(steps-1)
    mx(i)=m*x(i);
    my(i)=m*y(i);
end
% finding the centre of mass

figure(3)
plot(mx,my)
hold on
plot(x(1:(steps-1)),y(1:(steps-1)));
axis equal
plot(0,0,'ko');
quiver(x,y,vx(1:(steps-1)),vy(1:(steps-1)));
quiver(x,y,ax(1:(steps-1)),ay(1:(steps-1)));
end
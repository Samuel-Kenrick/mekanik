function [x,y,vx,vy,ax,ay,t]=orbit_Nbody(G,m,x0,y0,vx0,vy0,dt,tmax)
steps=tmax/dt;
t = 0:tmax/steps:tmax
%preallocating memory to increases performance
N = length(m);

x=zeros(steps,N);
y=zeros(steps,N);
vx=zeros(steps,N);
vy=zeros(steps,N);
ax=zeros(steps,N);
ay=zeros(steps,N);
% creating empty vectors/matrices for our results

for i = 1:N
    x(1,i)=x0(i);
    y(1,i)=y0(i);
    vx(1,i)=vx0(i);
    vy(1,i)=vy0(i);
end
[ax(1,:),ay(1,:)] = acceleration(G,m,x(1,:),y(1,:));
% setting initial start values

for i=1:(steps-1)
    for j=1:N

        x(i+1,j)=x(i,j)+vx(i,j)*dt+1/2*ax(i,j)*(dt)^2; % update position for x
        y(i+1,j)=y(i,j)+vy(i,j)*dt+1/2*ay(i,j)*(dt)^2; % update position for y
    end

    [ax(i+1,:),ay(i+1,:)] = acceleration(G, m, x(i+1,:),y(i+1,:)); % finding acceleration in the new point

    for j =1:N
        vx(i+1,j)=vx(i,j)+1/2*(ax(i,j)+ax(i+1,j))*dt; % update velocity for x
        vy(i+1,j)=vy(i,j)+1/2*(ay(i,j)+ay(i+1,j))*dt; % update velocity for y
    end
end
for i=1:(steps-1)
    
        mx(i)=sum(m.*x(i))/sum(m); % finding the centre of mass for x
        my(i)=sum(m.*y(i))/sum(m); % finding the centre of mass for y
    
end
figure(1)
axis equal
plot(mx,my);
figure(2)
plot(x(1:(steps-1),1:N),y(1:(steps-1),1:N));
hold on
plot(0,0,'ko')
%set(gca,'Color','k')
%axis equal
%quiver(vx(1:(steps-1),1:N),vy(1:(steps-1),1:N),vx(1:(steps-1),1:N),vy(1:(steps-1),1:N));
%quiver(ax(1:(steps-1),1:N),ay(1:(steps-1),1:N),ax(1:(steps-1),1:N),ay(1:(steps-1),1:N));

%for i=1:(steps-1)
%    r=sqrt(x(i).^2+y(i).^2);
%    Ek(i) = m(1:5).*((vx(i,1:5).^2+vy(i,1:5).^2)/2);
%    Ep(i) = -G*m(1:5)/r(x(i,1:5),y(i,1:5));
%    Etot(i) = Ek(i)+Ep(i);
%end
%plot(Etot)

end
function [ax,ay]=acceleration(G,m,x,y)
N = length(m);
ax=zeros(1,N);
ay=zeros(1,N); % creates two vectors for the acceleration filled with zeros.
for i = 1:N
    for j = 1:N
        if not(i==j)
            r=sqrt((x(i)-x(j)).^2+(y(i)-y(j)).^2); %calculating the distance from one mass to another
            ax(i) = ax(i)-G*m(j)*(x(i)-x(j))/r.^3; %calculates the acceleration in x-direction
            ay(i) = ay(i)-G*m(j)*(y(i)-y(j))/r.^3; %calculates the acceleration in y-direction
        end
    end
end
end
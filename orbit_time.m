function oT = orbit_time(x,y,t)
    steps=length(t)
    xpoint= [1,0];      %vector containing indices for extreme points for x
    d=2;
    for i = 2:(steps-2)
        if (x(i)==max(x(i),x(i-1))) && (x(i)==max(x(i+1),x(i))) %finds local maximum
                xpoint(d)=i;    %sets next xpoint value to index for local max
                d=d+1;
        end
    end
    oT = t(xpoint(2))-t(xpoint(1));     %time difference between first and second max values
end
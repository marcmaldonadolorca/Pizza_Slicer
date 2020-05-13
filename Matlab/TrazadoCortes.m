A = imread('imagen.png');

I = rgb2gray(A);
[y,x] = size(I);
centerY = y/2;
centerX = x/2;

ingrediente = 2; %1,2,3,4


if ingrediente == 1
    color = 76;
end

if ingrediente == 2
    color = 30;
end

if ingrediente == 3
    color = 15;
end

if ingrediente == 4
    color = 54;
    
end

sector1 = I(1:centerY, 1:centerX,:);
sector2 = I(1:centerY, centerX+1:x,:);
sector3 = I(centerY+1:y, 1:centerX,:);
sector4 = I(centerY+1:y, centerX+1:x,:);
[y,x,z] = size(sector1);



Bsector1 = ismember(color,sector1);


Bsector2 = ismember(color,sector2);


Bsector3 = ismember(color,sector3);


Bsector4 = ismember(color,sector4);

v = [(x-x+1) (y-y)];

if(Bsector1 == 0 && Bsector2 == 0 && Bsector3 == 0 && Bsector4 == 0)
    
    disp('No hay ingredriente');
    
end

if(Bsector1 == 1 && Bsector2 == 0 && Bsector3 == 0 && Bsector4 == 0)
    
    [yk, xk] = find( sector1 == color);
    
    a = max(yk);
    b = max(xk);
    
    pos1 = find( yk == a);
    pos2 = find( xk == b);
    
    c = xk(max(pos1));
    d = yk(max(pos2));
    a = a;
    b = b;
    
    u = [(c-x) (a-y)];
    CosTheta = dot(u,v)/(norm(u)*norm(v));
    ThetaInDegrees = acosd(CosTheta);
    disp(ThetaInDegrees);
    u = [(d-x) (b-y)];
    CosTheta = dot(u,v)/(norm(u)*norm(v));
    ThetaInDegrees = -acosd(CosTheta);
    disp(ThetaInDegrees);
    
end

if(Bsector1 == 0 && Bsector2 == 1 && Bsector3 == 0 && Bsector4 == 0)
    [yk, xk] = find( sector2 == color);
    
    a = max(yk);
    b = min(xk);
    
    pos1 = find( yk == a);
    pos2 = find( xk == b);
    
    c = xk(min(pos1));
    d = yk(max(pos2))+x;
    a = a;
    b = b+x;
    
    u = [(c-x) (a-y)];
    CosTheta = dot(u,v)/(norm(u)*norm(v));
    ThetaInDegrees = acosd(CosTheta);
    disp(ThetaInDegrees);
    u = [(d-x) (b-y)];
    CosTheta = dot(u,v)/(norm(u)*norm(v));
    ThetaInDegrees = -acosd(CosTheta);
    disp(ThetaInDegrees);
end

if(Bsector1 == 0 && Bsector2 == 0 && Bsector3 == 1 && Bsector4 == 0)
    [yk, xk] = find( sector3 == color);
    
    a = min(yk);
    b = max(xk);
    
    pos1 = find( yk == a);
    pos2 = find( xk == b);
    
    c = xk(max(pos1))+y;
    d = yk(min(pos2));
    a = a+y;
    b = b;
    
    u = [(c-x) (a-y)];
    CosTheta = dot(u,v)/(norm(u)*norm(v));
    ThetaInDegrees = acosd(CosTheta);
    disp(ThetaInDegrees);
    u = [(d-x) (b-y)];
    CosTheta = dot(u,v)/(norm(u)*norm(v));
    ThetaInDegrees = -acosd(CosTheta);
    disp(ThetaInDegrees);
end

if(Bsector1 == 0 && Bsector2 == 0 && Bsector3 == 0 && Bsector4 == 1)
   [yk, xk] = find( sector4 == color);
    
    a = min(yk);
    b = min(xk);
    
    pos1 = find( yk == a);
    pos2 = find( xk == b);
    
    c = xk(min(pos1))+y;
    d = yk(min(pos2))+x;
    a = a+y;
    b = b+x;
    
    u = [(c-x) (a-y)];
    CosTheta = dot(u,v)/(norm(u)*norm(v));
    ThetaInDegrees = acosd(CosTheta);
    disp(ThetaInDegrees);
    u = [(d-x) (b-y)];
    CosTheta = dot(u,v)/(norm(u)*norm(v));
    ThetaInDegrees = -acosd(CosTheta);
    disp(ThetaInDegrees);
end

if(Bsector1 == 1 && Bsector2 == 1 && Bsector3 == 0 && Bsector4 == 0)
    [yk, xk] = find( sector1 == color);
    [yk2, xk2] = find( sector2 == color);
    
    a = max(yk);
    b = min(yk2);
    
    pos1 = find( yk == a);
    pos2 = find( yk2 == b);
    
    c = xk(max(pos1));
    d = xk2(min(pos2))+x;
    a = a;
    b = b;
    
    u = [(c-x) (a-y)];
    CosTheta = dot(u,v)/(norm(u)*norm(v));
    ThetaInDegrees = acosd(CosTheta);
    disp(ThetaInDegrees);
    u = [(d-x) (b-y)];
    CosTheta = dot(u,v)/(norm(u)*norm(v));
    ThetaInDegrees = -acosd(CosTheta);
    disp(ThetaInDegrees);
end

if(Bsector1 == 1 && Bsector2 == 0 && Bsector3 == 1 && Bsector4 == 0)
    [yk, xk] = find( sector1 == color);
    [yk2, xk2] = find( sector3 == color);
    
    a = max(xk);
    b = max(xk2);
    
    pos1 = find( xk == a);
    pos2 = find( xk2 == b);
    
    c = yk(max(pos1));
    d = yk2(min(pos2)) + y;
    a = a + x;
    b = b + x;
    
    u = [(a-x) (c-y)];
    CosTheta = dot(u,v)/(norm(u)*norm(v));
    ThetaInDegrees = acosd(CosTheta);
    disp(ThetaInDegrees);
    u = [(b-x) (d-y)];
    CosTheta = dot(u,v)/(norm(u)*norm(v));
    ThetaInDegrees = -acosd(CosTheta);
    disp(ThetaInDegrees);
end

if(Bsector1 == 0 && Bsector2 == 1 && Bsector3 == 0 && Bsector4 == 1)
    
    [yk, xk] = find( sector2 == color);
    [yk2, xk2] = find( sector4 == color);
    
    a = min(xk);
    b = min(xk2);
    
    pos1 = find( xk == a);
    pos2 = find( xk2 == b);
    
    c = yk(max(pos1));
    d = yk2(min(pos2)) + y;
    a = a + x;
    b = b + x;
    
    u = [(a-x) (c-y)];
    CosTheta = dot(u,v)/(norm(u)*norm(v));
    ThetaInDegrees = acosd(CosTheta);
    disp(ThetaInDegrees);
    u = [(b-x) (d-y)];
    CosTheta = dot(u,v)/(norm(u)*norm(v));
    ThetaInDegrees = -acosd(CosTheta);
    disp(ThetaInDegrees);
end

if(Bsector1 == 0 && Bsector2 == 0 && Bsector3 == 1 && Bsector4 == 1)
    [yk, xk] = find( sector3 == color);
    [yk2, xk2] = find( sector4 == color);
    
    a = min(yk);
    b = min(yk2);
    
    pos1 = find( yk == a);
    pos2 = find( yk2 == b);
    
    c = xk(max(pos1));
    d = xk2(min(pos2))+x;
    a = a +y;
    b = b +y;
    
    u = [(a-x) (c-y)];
    CosTheta = dot(u,v)/(norm(u)*norm(v));
    ThetaInDegrees = acosd(CosTheta);
    disp(ThetaInDegrees);
    u = [(b-x) (d-y)];
    CosTheta = dot(u,v)/(norm(u)*norm(v));
    ThetaInDegrees = -acosd(CosTheta);
    disp(ThetaInDegrees);
end

if(Bsector1 == 1 && Bsector2 == 1 && Bsector3 == 1 && Bsector4 == 0)
    [yk, xk] = find( sector2 == color);
    [yk2, xk2] = find( sector3 == color);
    
    a = max(yk);
    b = max(xk2);
    
    pos1 = find( yk == a);
    pos2 = find( xk2 == b);
    
    c = xk(min(pos1))+x;
    d = yk2(min(pos2))+y;
    a = a;
    b = b;
    
    u = [(c-x) (a-y)];
    CosTheta = dot(u,v)/(norm(u)*norm(v));
    ThetaInDegrees = acosd(CosTheta);
    disp(ThetaInDegrees);
    u = [(b-x) (d-y)];
    CosTheta = dot(u,v)/(norm(u)*norm(v));
    ThetaInDegrees = -acosd(CosTheta);
    disp(ThetaInDegrees);
end

if(Bsector1 == 1 && Bsector2 == 1 && Bsector3 == 0 && Bsector4 == 1)
    [yk, xk] = find( sector1 == color);
    [yk2, xk2] = find( sector4 == color);
    
    a = max(yk);
    b = min(xk2);
    
    pos1 = find( yk == a);
    pos2 = find( xk2 == b);
    
    c = xk(max(pos1));
    d = yk2(min(pos2))+y;
    a = a;
    b = b+x;
    
    u = [(c-x) (a-y)];
    CosTheta = dot(u,v)/(norm(u)*norm(v));
    ThetaInDegrees = acosd(CosTheta);
    disp(ThetaInDegrees);
    u = [(b-x) (d-y)];
    CosTheta = dot(u,v)/(norm(u)*norm(v));
    ThetaInDegrees = -acosd(CosTheta);
    disp(ThetaInDegrees);
end

if(Bsector1 == 1 && Bsector2 == 0 && Bsector3 == 1 && Bsector4 == 1)
    [yk, xk] = find( sector2 == color);
    [yk2, xk2] = find( sector3 == color);
    
    a = max(yk);
    b = min(yk2);
    
    pos1 = find( yk == a);
    pos2 = find( yk2 == b);
    
    c = xk(min(pos1));
    d = xk2(min(pos2))+x;
    a = a;
    b = b+y;
    
    u = [(c-x) (a-y)];
    CosTheta = dot(u,v)/(norm(u)*norm(v));
    ThetaInDegrees = acosd(CosTheta);
    disp(ThetaInDegrees);
    u = [(d-x) (b-y)];
    CosTheta = dot(u,v)/(norm(u)*norm(v));
    ThetaInDegrees = -acosd(CosTheta);
    disp(ThetaInDegrees);
end

if(Bsector1 == 0 && Bsector2 == 1 && Bsector3 == 1 && Bsector4 == 1)
   [yk, xk] = find( sector2 == color);
    [yk2, xk2] = find( sector3 == color);
    
    a = min(xk);
    b = min(yk2);
    
    pos1 = find( xk == a);
    pos2 = find( yk2 == b);
    
    c = yk(min(pos1));
    d = xk2(max(pos2));
    a = a+x;
    b = b+y;
    
    u = [(a-x) (c-y)];
    CosTheta = dot(u,v)/(norm(u)*norm(v));
    ThetaInDegrees = acosd(CosTheta);
    disp(ThetaInDegrees);
    u = [(d-x) (b-y)];
    CosTheta = dot(u,v)/(norm(u)*norm(v));
    ThetaInDegrees = -acosd(CosTheta);
    disp(ThetaInDegrees); 
end

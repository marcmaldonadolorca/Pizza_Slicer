tic
s = tcpip('0.0.0.0', 5000, 'Network', 'server');
s.ReadAsyncMode = 'continuous';
%import serial
%arduino = serial.Serial('/dev/ttyACM0', 9600);
global data_pepperoni;
data_pepperoni = load('nets/pepperoni.mat');
global data_pina;
data_pina = load('nets/pina.mat');
%global data_onion = load('nets/onion.mat');
%global data_aceitunas = load('nets/aceitunas.mat');
toc
while true
    fopen(s);
    mensaje = fread(s);
    a = mensaje(3)-48;
    b = mensaje(5)-48;
    %arduino.write(a);
    if a == 0
        fclose(s);
        break
    end
    if a == 1
        tic
        angulos = trazarcortes(b);
        toc
        if angulos(1) ~= 0 && angulos(2)~= 0
            %tcpipClient = tcpip('127.0.0.1',55002,'NetworkRole','Client');
            %set(tcpipClient,'Timeout',30);
            %fopen(tcpipClient);
            x = "1 " + angulos(1) + " " + angulos(2);
            %arduino.write(angulos(1));
            %arduino.write(angulos(2));
            disp(x);
            %fwrite(tcpipClient,x);
            %fclose(tcpipClient);
        end
    end
    if a == 2
        
        %tcpipClient = tcpip('127.0.0.1',55002,'NetworkRole','Client');
        %set(tcpipClient,'Timeout',30);
        %fopen(tcpipClient);
        x="2 " + b;
        %arduino.write(b);
        disp(x);
        %fwrite(tcpipClient,x);
        %fclose(tcpipClient);
    end
    
    fclose(s);
end

function retorno = trazarcortes(comanda)
    %{
    rpi = raspi();
    cam = cameraboard(rpi,'Resolution','640x480');
    A = snapshot(cam);
    %}
    A = imread('prueba.jpg');
    if comanda == 1
        global data_pepperoni;
        data = data_pepperoni;
    end
    if comanda == 2
        global data_pina;
        data = data_pina;
    end
    if comanda == 3
        global data_onion;
        data = data_onion;
    end
    if comanda == 4
        global data_aceitunas;
        data = data_aceitunas;
    end



    net = data.net;


    tagged = semanticseg(A, net);

    
    I = tagged == 'Background';
    I = I == 0;


    [y,x] = size(I);

    centerY = ceil(y/2);
    centerX = ceil(x/2);

    sector1 = I(1:centerY, 1:centerX,:);
    sector2 = I(1:centerY, centerX+1:x,:);
    sector3 = I(centerY+1:y, 1:centerX,:);
    sector4 = I(centerY+1:y, centerX+1:x,:);
    [y,x] = size(sector1);


    color = 1;

    Bsector1 = ismember(color,sector1);


    Bsector2 = ismember(color,sector2);


    Bsector3 = ismember(color,sector3);


    Bsector4 = ismember(color,sector4);

    v = [(1) (0)];


    if(Bsector1 == 0 && Bsector2 == 0 && Bsector3 == 0 && Bsector4 == 0)

        disp('No hay ingredriente');
        angulo1 = 0;
        angulo2 = 0;

    end

    if(Bsector1 == 1 && Bsector2 == 0 && Bsector3 == 0 && Bsector4 == 0)

        [yk, xk] = find(sector1 == color);
        for i=1:size(yk)
            u = [(xk(i)-x) (yk(i)-y)];
            CosTheta = dot(u,v)/(norm(u)*norm(v));
            ThetaInDegrees = acosd(CosTheta);
            if i == 1
                angulo1 = ThetaInDegrees;
            else
                if angulo1 < ThetaInDegrees
                    angulo1 = ThetaInDegrees;
                end
            end
        end
        for i=1:size(yk)
            u = [(xk(i)-x) (yk(i)-y)];
            CosTheta = dot(u,v)/(norm(u)*norm(v));
            ThetaInDegrees = acosd(CosTheta);
            if i == 1
                angulo2 = ThetaInDegrees;
            else
                if angulo2 > ThetaInDegrees
                    angulo2 = ThetaInDegrees;
                end
            end
        end

        if(angulo1 > angulo2+30)
            angulo1 = angulo2 +30;
        end
        disp(angulo1);
        disp(angulo2);
    end

    if(Bsector1 == 0 && Bsector2 == 1 && Bsector3 == 0 && Bsector4 == 0)
        [yk, xk] = find(sector2 == color);
        for i=1:size(yk)
            u = [(xk(i)) (yk(i)-y)];
            CosTheta = dot(u,v)/(norm(u)*norm(v));
            ThetaInDegrees = acosd(CosTheta);
            if i == 1
                angulo1 = ThetaInDegrees;
            else
                if angulo1 < ThetaInDegrees
                    angulo1 = ThetaInDegrees;
                end
            end
        end
        for i=1:size(yk)
            u = [(xk(i)) (yk(i)-y)];
            CosTheta = dot(u,v)/(norm(u)*norm(v));
            ThetaInDegrees = acosd(CosTheta);
            if i == 1
                angulo2 = ThetaInDegrees;
            else
                if angulo2 > ThetaInDegrees
                    angulo2 = ThetaInDegrees;
                end
            end
        end
        if(angulo2 > angulo1+30)
            angulo1 = angulo2 +30;
        end
        disp(angulo1);
        disp(angulo2);
    end

    if(Bsector1 == 0 && Bsector2 == 0 && Bsector3 == 1 && Bsector4 == 0)
        [yk, xk] = find(sector3 == color);
        for i=1:size(yk)
            u = [(xk(i)-x) (yk(i))];
            CosTheta = dot(u,v)/(norm(u)*norm(v));
            ThetaInDegrees = acosd(CosTheta);
            if i == 1
                angulo1 = ThetaInDegrees;
            else
                if angulo1 < ThetaInDegrees
                    angulo1 = ThetaInDegrees;
                end
            end
        end
        for i=1:size(yk)
            u = [(xk(i)-x) (yk(i))];
            CosTheta = dot(u,v)/(norm(u)*norm(v));
            ThetaInDegrees = acosd(CosTheta);
            if i == 1
                angulo2 = ThetaInDegrees;
            else
                if angulo2 > ThetaInDegrees
                    angulo2 = ThetaInDegrees;
                end
            end
        end
        angulo1 = -angulo1;
        angulo2 = -angulo2;
        if(angulo1 < angulo2-30)
            angulo1 = angulo2-30;
        end
        disp(angulo1);
        disp(angulo2);
    end

    if(Bsector1 == 0 && Bsector2 == 0 && Bsector3 == 0 && Bsector4 == 1)
       [yk, xk] = find(sector4 == color);
        for i=1:size(yk)
            u = [(xk(i)) (yk(i))];
            CosTheta = dot(u,v)/(norm(u)*norm(v));
            ThetaInDegrees = acosd(CosTheta);
            if i == 1
                angulo1 = ThetaInDegrees;
            else
                if angulo1 < ThetaInDegrees
                    angulo1 = ThetaInDegrees;
                end
            end
        end
        for i=1:size(yk)
            u = [(xk(i)) (yk(i))];
            CosTheta = dot(u,v)/(norm(u)*norm(v));
            ThetaInDegrees = acosd(CosTheta);
            if i == 1
                angulo2 = ThetaInDegrees;
            else
                if angulo2 > ThetaInDegrees
                    angulo2 = ThetaInDegrees;
                end
            end
        end
        angulo1 = -angulo1;
        angulo2 = -angulo2;
        if(angulo1 < angulo2-30)
            angulo1 = angulo2-30;
        end
        disp(angulo1);
        disp(angulo2);
    end

    if(Bsector1 == 1 && Bsector2 == 1 && Bsector3 == 0 && Bsector4 == 0)
            [yk, xk] = find( sector1 == color);
            [yk2, xk2] = find( sector2 == color);
        for i=1:size(yk)
            u = [(xk(i)-x) (yk(i)-y)];
            CosTheta = dot(u,v)/(norm(u)*norm(v));
            ThetaInDegrees = acosd(CosTheta);
            if i == 1
                angulo1 = ThetaInDegrees;
            else
                if angulo1 < ThetaInDegrees
                    angulo1 = ThetaInDegrees;
                end
            end
        end
        for i=1:size(yk2)
            u = [(xk2(i)) (yk2(i)-y)];
            CosTheta = dot(u,v)/(norm(u)*norm(v));
            ThetaInDegrees = acosd(CosTheta);
            if i == 1
                angulo2 = ThetaInDegrees;
            else
                if angulo2 > ThetaInDegrees
                    angulo2 = ThetaInDegrees;
                end
            end
        end
        if(angulo1 > angulo2+30)
            angulo1 = angulo2+30;
        end
        disp(angulo1);
        disp(angulo2);
    end

    if(Bsector1 == 1 && Bsector2 == 0 && Bsector3 == 1 && Bsector4 == 0)
            [yk, xk] = find( sector1 == color);
            [yk2, xk2] = find( sector3 == color);
        for i=1:size(yk)
            u = [(xk(i)-x) (yk(i)-y)];
            CosTheta = dot(u,v)/(norm(u)*norm(v));
            ThetaInDegrees = acosd(CosTheta);
            if i == 1
                angulo1 = ThetaInDegrees;
            else
                if angulo1 > ThetaInDegrees
                    angulo1 = ThetaInDegrees;
                end
            end
        end
        for i=1:size(yk2)
            u = [(xk2(i)-x) (yk2(i))];
            CosTheta = dot(u,v)/(norm(u)*norm(v));
            ThetaInDegrees = acosd(CosTheta);
            if i == 1
                angulo2 = ThetaInDegrees;
            else
                if angulo2 > ThetaInDegrees
                    angulo2 = ThetaInDegrees;
                end
            end
        end
        angulo2 = -angulo2;

        if(360+angulo2 > angulo1+30)
            angulo2 = angulo1+30;
        end

        if angulo2 > 180
            angulo2 = -(360-angulo2);
        end
        disp(angulo1);
        disp(angulo2);
    end

    if(Bsector1 == 0 && Bsector2 == 1 && Bsector3 == 0 && Bsector4 == 1)
              [yk, xk] = find( sector2 == color);
            [yk2, xk2] = find( sector4 == color);
        for i=1:size(yk)
            u = [(xk(i)) (yk(i)-y)];
            CosTheta = dot(u,v)/(norm(u)*norm(v));
            ThetaInDegrees = acosd(CosTheta);
            if i == 1
                angulo1 = ThetaInDegrees;
            else
                if angulo1 < ThetaInDegrees
                    angulo1 = ThetaInDegrees;
                end
            end
        end
        for i=1:size(yk2)
            u = [(xk2(i)) (yk2(i))];
            CosTheta = dot(u,v)/(norm(u)*norm(v));
            ThetaInDegrees = acosd(CosTheta);
            if i == 1
                angulo2 = ThetaInDegrees;
            else
                if angulo2 < ThetaInDegrees
                    angulo2 = ThetaInDegrees;
                end
            end
        end
        angulo2 = -angulo2;
        if(angulo2 < angulo1-30)
            angulo2 = angulo1-30;
        end
        disp(angulo1);
        disp(angulo2);
    end

    if(Bsector1 == 0 && Bsector2 == 0 && Bsector3 == 1 && Bsector4 == 1)
                 [yk, xk] = find( sector4 == color);
            [yk2, xk2] = find( sector3 == color);
        for i=1:size(yk)
            u = [(xk(i)) (yk(i))];
            CosTheta = dot(u,v)/(norm(u)*norm(v));
            ThetaInDegrees = acosd(CosTheta);
            if i == 1
                angulo1 = ThetaInDegrees;
            else
                if angulo1 > ThetaInDegrees
                    angulo1 = ThetaInDegrees;
                end
            end
        end
        for i=1:size(yk2)
            u = [(xk2(i)-x) (yk2(i))];
            CosTheta = dot(u,v)/(norm(u)*norm(v));
            ThetaInDegrees = acosd(CosTheta);
            if i == 1
                angulo2 = ThetaInDegrees;
            else
                if angulo2 < ThetaInDegrees
                    angulo2 = ThetaInDegrees;
                end
            end
        end
        angulo1 = -angulo1;
        angulo2 = -angulo2;
        if (angulo2 < angulo1-30)
            angulo2 = angulo1-30;
        end
        disp(angulo1);
        disp(angulo2);
    end

    if(Bsector1 == 1 && Bsector2 == 1 && Bsector3 == 1 && Bsector4 == 0)
            [yk, xk] = find( sector2 == color);
            [yk2, xk2] = find( sector3 == color);
        for i=1:size(yk)
            u = [(xk(i)) (yk(i)-y)];
            CosTheta = dot(u,v)/(norm(u)*norm(v));
            ThetaInDegrees = acosd(CosTheta);
            if i == 1
                angulo1 = ThetaInDegrees;
            else
                if angulo1 > ThetaInDegrees
                    angulo1 = ThetaInDegrees;
                end
            end
        end
        for i=1:size(yk2)
            u = [(xk2(i)-x) (yk2(i))];
            CosTheta = dot(u,v)/(norm(u)*norm(v));
            ThetaInDegrees = acosd(CosTheta);
            if i == 1
                angulo2 = ThetaInDegrees;
            else
                if angulo2 > ThetaInDegrees
                    angulo2 = ThetaInDegrees;
                end
            end
        end

        angulo2 = angulo1 +30;
        disp(angulo1);
        disp(angulo2);
    end

    if(Bsector1 == 1 && Bsector2 == 1 && Bsector3 == 0 && Bsector4 == 1)
            [yk, xk] = find( sector1 == color);
            [yk2, xk2] = find( sector4 == color);
        for i=1:size(yk)
            u = [(xk(i)-x) (yk(i)-y)];
            CosTheta = dot(u,v)/(norm(u)*norm(v));
            ThetaInDegrees = acosd(CosTheta);
            if i == 1
                angulo1 = ThetaInDegrees;
            else
                if angulo1 < ThetaInDegrees
                    angulo1 = ThetaInDegrees;
                end
            end
        end
        for i=1:size(yk2)
            u = [(xk2(i)) (yk2(i))];
            CosTheta = dot(u,v)/(norm(u)*norm(v));
            ThetaInDegrees = acosd(CosTheta);
            if i == 1
                angulo2 = ThetaInDegrees;
            else
                if angulo2 < ThetaInDegrees
                    angulo2 = ThetaInDegrees;
                end
            end
        end
        angulo2 = angulo1-30;
        disp(angulo1);
        disp(angulo2);
    end

    if(Bsector1 == 1 && Bsector2 == 0 && Bsector3 == 1 && Bsector4 == 1)
            [yk, xk] = find( sector1 == color);
            [yk2, xk2] = find( sector4 == color);
        for i=1:size(yk)
            u = [(xk(i)-x) (yk(i)-y)];
            CosTheta = dot(u,v)/(norm(u)*norm(v));
            ThetaInDegrees = acosd(CosTheta);
            if i == 1
                angulo1 = ThetaInDegrees;
            else
                if angulo1 > ThetaInDegrees
                    angulo1 = ThetaInDegrees;
                end
            end
        end
        for i=1:size(yk2)
            u = [(xk2(i)) (yk2(i))];
            CosTheta = dot(u,v)/(norm(u)*norm(v));
            ThetaInDegrees = acosd(CosTheta);
            if i == 1
                angulo2 = ThetaInDegrees;
            else
                if angulo2 < ThetaInDegrees
                    angulo2 = ThetaInDegrees;
                end
            end
        end
        angulo2 = -angulo2;
        angulo1 = angulo2-30;
        disp(angulo1);
        disp(angulo2);
    end

    if(Bsector1 == 0 && Bsector2 == 1 && Bsector3 == 1 && Bsector4 == 1)
       [yk, xk] = find( sector2 == color);
       [yk2, xk2] = find( sector3 == color);
        for i=1:size(yk)
            u = [(xk(i)) (yk(i)-y)];
            CosTheta = dot(u,v)/(norm(u)*norm(v));
            ThetaInDegrees = acosd(CosTheta);
            if i == 1
                angulo1 = ThetaInDegrees;
            else
                if angulo1 < ThetaInDegrees
                    angulo1 = ThetaInDegrees;
                end
            end
        end
        for i=1:size(yk2)
            u = [(xk2(i)-x) (yk2(i))];
            CosTheta = dot(u,v)/(norm(u)*norm(v));
            ThetaInDegrees = acosd(CosTheta);
            if i == 1
                angulo2 = ThetaInDegrees;
            else
                if angulo2 < ThetaInDegrees
                    angulo2 = ThetaInDegrees;
                end
            end
        end
        angulo2 = -angulo2;
        angulo1 = angulo2 +30;
        disp(angulo1);
        disp(angulo2);
    end

    if(Bsector1 == 1 && Bsector2 == 1 && Bsector3 == 1 && Bsector4 == 1)
       X = randi(181);
       X = X - 1;
       z = randi(2);
       if z == 1
           X = -X;
       end

       angulo1 = X;
       if X <= 0
           Y = X +30;
           if Y < -180
               Y = -(Y + 180);
           end
       else
           Y = X -30;
           if Y > 180
               Y = -(Y - 180);
           end
       end
       angulo2 = Y;
       disp(angulo1);
       disp(angulo2);

    end
    retorno = [angulo1, angulo2];
    
end
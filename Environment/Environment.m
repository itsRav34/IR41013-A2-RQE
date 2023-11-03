% function test()
close all
clc

% Estop;
hold on

gui = GUI;

% tableheight = 0.7;


%% SAFETY OBJECTS
%Placement of floor, brickwalls, a light curtain 
% and an emergency stop button
PlaceObject('floor.ply',[0,-1,0.01]);
PlaceObject('brickWallX.ply',[3,2,0]);
PlaceObject('brickWallLeft.ply',[-3,2,0]);
PlaceObject('brickWallRight.ply',[3,-4,0]);
PlaceObject('wallDoor.ply',[0.7,-4,0]);

PlaceObject('fireExtinguisherElevated.ply', [-2.5,1.5,0.45]);
PlaceObject('fireBlanket.ply', [-2,1.7,0.7]);
PlaceObject('firstAidKit.ply', [-1.2,1.6,0.9]);
PlaceObject('lightCurtain.ply', [0.5,1,0]);
PlaceObject('lightCurtain2.ply', [-2.7,1,0]);
PlaceObject('lightCurtain3.ply', [0.5,-3.5,0]);
PlaceObject('lightCurtain4.ply', [-2.7,-3.5,0]);
PlaceObject('lightCurtain5.ply', [0.7,0.8,0]);
PlaceObject('lightCurtain6.ply', [0.7,-3.3,0]);
PlaceObject('cardReader.ply', [0.7,-4,0.6]);

%Placement of the two lab tables
PlaceObject('labTable.ply', [0.2,0.2,0]);
PlaceObject('labTable.ply', [0.2,-1.4,0]);

%% RED TEST TUBE RACK
REDSORTEDTTR = testTubeRack(transl(-0.9,-0.1,0.62)*trotz(deg2rad(90)));

REDlocation1 = REDSORTEDTTR.model.base*transl(transl(-0.025,-0.119, 0.13));

REDlocation2 = REDSORTEDTTR.model.base*transl(transl(-0.025,-0.197,0.13));

REDlocation3 = REDSORTEDTTR.model.base*transl(transl(-0.025,-0.274,0.13));

%% GREEN TEST TUBE RACK
GREENSORTEDTTR = testTubeRack(transl(-0.7,-0.8,0.62)*trotz(deg2rad(90)));

GREENlocation1 = GREENSORTEDTTR.model.base*transl(transl(-0.025,-0.119, 0.13));

GREENlocation2 = GREENSORTEDTTR.model.base*transl(transl(-0.025,-0.197,0.13));

GREENlocation3 = GREENSORTEDTTR.model.base*transl(transl(-0.025,-0.274,0.13));

%% BLUE TEST TUBE RACK
BLUESORTEDTTR = testTubeRack(transl(-0.4,-0.8,0.62)*trotz(deg2rad(90)));

BLUElocation1 = BLUESORTEDTTR.model.base*transl(transl(-0.025,-0.119, 0.13));

BLUElocation2 = BLUESORTEDTTR.model.base*transl(transl(-0.025,-0.197,0.13));

BLUElocation3 = BLUESORTEDTTR.model.base*transl(transl(-0.025,-0.274,0.13));

%%
TTF1 = testTubeRackFilled(transl(0.13,-2.08,0.72));
%%

fprintf('Creating LUR3\n');
%Placement of UR3 robot
baseLUR3 = transl([0,-0.5,0.7])*trotz(0);
lur3 = LinearUR3(baseLUR3);
lur3startpos = [-0.0100         0         0         0         0   -1.5708         0];
lur3.model.animate(lur3startpos);
PlaceObject('emergencyStopWallMounted.ply', [0.8,1.8,1]);

fprintf('Creating TM5-900\n');
%Placement of TM5-900 robot
baseTM5 = transl([-0.3,-1.5,0.7])*trotz(-pi);
tm5 = TM5(baseTM5);
tm5startpos = [1.5708   -1.5708    1.5708   -1.5708   -1.5708    3.1416];
tm5.model.animate(tm5startpos);

fprintf('Press Enter to continue:\n')
pause();

fprintf('RETRIEVING SAMPLES...\n')

%% TM5 MOVES FROM START POS TO TEST TUBE RACK WITH ASSORTED TEST TUBES

steps = 100;

tm5grabrack = [2.3562   -2.1817   -1.4600   -1.0223    1.5708    4.1233];

movefrominitialtorandTT = jtraj(tm5.model.getpos(),tm5grabrack, steps);

for i = 1:length(movefrominitialtorandTT)
    
    tm5.model.animate(movefrominitialtorandTT(i,:))
        drawnow();
end

%% TM5 MOVES ASSORTED TEST TUBE RACK TO SORTING START POS
TTFsortstartlocation = [-0.8602   -2.0071   -1.7453   -0.8727    1.6955    4.1233];

movefromTTtostartpos = jtraj(tm5.model.getpos(), TTFsortstartlocation, steps);

for i = 1:length(movefromTTtostartpos)
    
    tm5.model.animate(movefromTTtostartpos(i,:))
        
        TM5pos = transl(transl(tm5.model.fkineUTS(tm5.model.getpos())))*transl(0,0,-0.2);
        flip = trotx(0,'deg');
        TTF1.model.base = TM5pos*flip;
        TTF1.model.animate(0);
        drawnow();
end

TTRE = testTubeRackEmpty(transl(transl(TTF1.model.base)));

%% TEST TUBE LOCATIONS

R1o = TTRE.model.base*transl(transl(-0.176,0.164, 0.02));
R2o = TTRE.model.base*transl(transl(-0.113,0.164,0.02));
R3o = TTRE.model.base*transl(transl(-0.046,0.104,0.02));

G1o = TTRE.model.base*transl(transl(-0.046,0.164,0.02));
G2o = TTRE.model.base*transl(transl(-0.113,0.104,0.02));
G3o = TTRE.model.base*transl(transl(-0.046, 0.041,0.02));

B1o = TTRE.model.base*transl(transl(-0.176,0.104,0.02));
B2o = TTRE.model.base*transl(transl(-0.176,0.041,0.02));
B3o = TTRE.model.base*transl(transl(-0.113, 0.041,0.02));

%% Create Test Tubes
R1 = testTubeR(transl(R1o));
R2 = testTubeR(transl(R2o));
R3 = testTubeR(transl(R3o));

G1 = testTubeG(transl(G1o));
G2 = testTubeG(transl(G2o));
G3 = testTubeG(transl(G3o));

B1 = testTubeB(transl(B1o));
B2 = testTubeB(transl(B2o));
B3 = testTubeB(transl(B3o));

clear TTF1;

%% TM5 moves up to see all test tubes

endpos = [1.5708   -1.3334    0.7854   -1.0228   -1.0472    1.5708];

tm5endtraj = jtraj(tm5.model.getpos(), endpos, steps);

for i = 1:length(tm5endtraj)
    
    tm5.model.animate(tm5endtraj(i,:))

        drawnow();
end

% %% MOVE LUR3 from start to sort start
% 
% fprintf('Initialising Environment...\n');
% 
% %set environment axis
% axis([-4, 4, -4, 4, 0, 4]);
% 
% 
% %% SAFETY OBJECTS
% %Placement of floor, brickwalls, a light curtain 
% % and an emergency stop button
% PlaceObject('floor.ply',[0,-1,0.01]);
% PlaceObject('brickWallX.ply',[3,2,0]);
% PlaceObject('brickWallLeft.ply',[-3,2,0]);
% PlaceObject('brickWallRight.ply',[3,-4,0]);
% PlaceObject('wallDoor.ply',[0.7,-4,0]);
% 
% PlaceObject('fireExtinguisherElevated.ply', [-2.5,1.5,0.45]);
% PlaceObject('fireBlanket.ply', [-2,1.7,0.7]);
% % PlaceObject('firstAidKit.ply', [-1.2,1.6,0.7]);
% PlaceObject('lightCurtain.ply', [0.5,1,0]);
% PlaceObject('lightCurtain2.ply', [-2.7,1,0]);
% PlaceObject('lightCurtain3.ply', [0.5,-3.5,0]);
% PlaceObject('lightCurtain4.ply', [-2.7,-3.5,0]);
% PlaceObject('lightCurtain5.ply', [0.5,0.8,0]);
% PlaceObject('lightCurtain6.ply', [0.5,-3.3,0]);
% PlaceObject('cardReader.ply', [0.7,-4,0.6]);
% 
% %Placement of the two lab tables
% PlaceObject('LabTable2.ply', [0.2,0.2,0]);
% PlaceObject('LabTable2.ply', [0.2,-1.4,0]);
% 
% %% RED TEST TUBE RACK
% REDSORTEDTTR = testTubeRack(transl(-0.9,-0.1,0.62)*trotz(deg2rad(90)));
% 
% REDlocation1 = REDSORTEDTTR.model.base*transl(transl(-0.025,-0.119, 0.13));
% 
% REDlocation2 = REDSORTEDTTR.model.base*transl(transl(-0.025,-0.197,0.13));
% 
% REDlocation3 = REDSORTEDTTR.model.base*transl(transl(-0.025,-0.274,0.13));
% 
% %% GREEN TEST TUBE RACK
% GREENSORTEDTTR = testTubeRack(transl(-0.7,-0.8,0.62)*trotz(deg2rad(90)));
% 
% GREENlocation1 = GREENSORTEDTTR.model.base*transl(transl(-0.025,-0.119, 0.13));
% 
% GREENlocation2 = GREENSORTEDTTR.model.base*transl(transl(-0.025,-0.197,0.13));
% 
% GREENlocation3 = GREENSORTEDTTR.model.base*transl(transl(-0.025,-0.274,0.13));
% 
% %% BLUE TEST TUBE RACK
% BLUESORTEDTTR = testTubeRack(transl(-0.4,-0.8,0.62)*trotz(deg2rad(90)));
% 
% BLUElocation1 = BLUESORTEDTTR.model.base*transl(transl(-0.025,-0.119, 0.13));
% 
% BLUElocation2 = BLUESORTEDTTR.model.base*transl(transl(-0.025,-0.197,0.13));
% 
% BLUElocation3 = BLUESORTEDTTR.model.base*transl(transl(-0.025,-0.274,0.13));
% 
% 
% TTF1 = testTubeRackFilled(transl(0.13,-2.08,0.72));
% 
% %% Placement of LUR3 robot
% fprintf('Creating LUR3\n');
% baseLUR3 = transl([0,-0.5,0.7])*trotz(0);
% lur3 = LinearUR3(baseLUR3);
% lur3startpos = [-0.0100         0         0         0         0   -1.5708         0];
% lur3.model.animate(lur3startpos);
% PlaceObject('emergencyStopWallMounted.ply', [0.8,1.8,1]);
% 
% %% Placement of TM5-900 robot
% fprintf('Creating TM5-900\n');
% baseTM5 = transl([-0.3,-1.5,0.7])*trotz(-pi);
% tm5 = TM5(baseTM5);
% tm5startpos = [1.5708   -1.5708    1.5708   -1.5708   -1.5708    3.1416];
% tm5.model.animate(tm5startpos);

% fprintf('Press Enter to continue:\n')
% pause();

% start();


% 
% function start()
% 
% fprintf('RETRIEVING SAMPLES...\n')
% 
% %% TM5 MOVES FROM START POS TO TEST TUBE RACK WITH ASSORTED TEST TUBES
% steps = 100;
% tm5grabrack = [2.3562   -2.1817   -1.4600   -1.0223    1.5708    4.1233];
% movefrominitialtorandTT = jtraj(tm5.model.getpos(),tm5grabrack, steps);
% for i = 1:length(movefrominitialtorandTT)
% 
%     tm5.model.animate(movefrominitialtorandTT(i,:))
%         drawnow();
% end
% 
% %% TM5 MOVES ASSORTED TEST TUBE RACK TO SORTING START POS
% TTFsortstartlocation = [-0.8602   -2.0071   -1.7453   -0.8727    1.6955    4.1233];
% 
% movefromTTtostartpos = jtraj(tm5.model.getpos(), TTFsortstartlocation, steps);
% 
% for i = 1:length(movefromTTtostartpos)    
%     tm5.model.animate(movefromTTtostartpos(i,:))
% 
%         TM5pos = transl(transl(tm5.model.fkineUTS(tm5.model.getpos())))*transl(0,0,-0.2);
%         flip = trotx(0,'deg');
%         TTF1.model.base = TM5pos*flip;
%         TTF1.model.animate(0);
%         drawnow();
% end
% 
% TTRE = testTubeRackEmpty(transl(transl(TTF1.model.base)));
% 
% %% TEST TUBE LOCATIONS
% 
% R1o = TTRE.model.base*transl(transl(-0.176,0.164, 0.02));
% R2o = TTRE.model.base*transl(transl(-0.113,0.164,0.02));
% R3o = TTRE.model.base*transl(transl(-0.046,0.104,0.02));
% 
% G1o = TTRE.model.base*transl(transl(-0.046,0.164,0.02));
% G2o = TTRE.model.base*transl(transl(-0.113,0.104,0.02));
% G3o = TTRE.model.base*transl(transl(-0.046, 0.041,0.02));
% 
% B1o = TTRE.model.base*transl(transl(-0.176,0.104,0.02));
% B2o = TTRE.model.base*transl(transl(-0.176,0.041,0.02));
% B3o = TTRE.model.base*transl(transl(-0.113, 0.041,0.02));
% 
% %% Create Test Tubes
% R1 = testTubeR(transl(R1o));
% R2 = testTubeR(transl(R2o));
% R3 = testTubeR(transl(R3o));
% 
% G1 = testTubeG(transl(G1o));
% G2 = testTubeG(transl(G2o));
% G3 = testTubeG(transl(G3o));
% 
% B1 = testTubeB(transl(B1o));
% B2 = testTubeB(transl(B2o));
% B3 = testTubeB(transl(B3o));
% 
% clear TTF1;
% 
% %% TM5 moves up to see all test tubes
% endpos = [1.5708   -1.3334    0.7854   -1.0228   -1.0472    1.5708];
% tm5endtraj = jtraj(tm5.model.getpos(), endpos, steps);
% for i = 1:length(tm5endtraj)   
%     tm5.model.animate(tm5endtraj(i,:))
%         drawnow();
% end
% 
% %% LUR3 MOVES R1
% fprintf('Sorting R1\n');
% lur3R1 = (transl(transl(R1.model.base))*transl(0,0,0.13))*trotx(deg2rad(180));
% lur3toR1 = lur3.model.ikcon(lur3R1,lur3.model.getpos());
% 
% r1starttraj = jtraj(lur3.model.getpos(), lur3toR1, steps);
% for i = 1:length(r1starttraj)
%     lur3.model.animate(r1starttraj(i,:))
%         drawnow();
% end
% 
% RaiseRobot(lur3, lur3.model.getpos(),R1);
% Movetolocation(lur3,REDlocation1,R1);
% LowerRobot(lur3,lur3.model.getpos(),R1)
% 
% 
% %% LUR3 MOVES R2
% fprintf('Sorting R2\n');
% Movetolocation(lur3, transl(R2.model.base))
% RaiseRobot(lur3, lur3.model.getpos(),R2)
% Movetolocation(lur3,REDlocation2,R2)
% LowerRobot(lur3,lur3.model.getpos(),R2)
% RaiseRobot(lur3,lur3.model.getpos());
% 
% %% LUR3 MOVES R3
% fprintf('Sorting R3\n');
% Movetolocation(lur3, transl(R3.model.base))
% RaiseRobot(lur3, lur3.model.getpos(),R3)
% Movetolocation(lur3,REDlocation3,R3)
% LowerRobot(lur3,lur3.model.getpos(),R3)
% RaiseRobot(lur3,lur3.model.getpos());
% 
% lur3sortstart = [-0.6840         0   -0.0873   -1.8132    0.3491    1.5708         0];
% 
% sortstarttraj = jtraj(lur3.model.getpos(), lur3sortstart, steps);
% for i = 1:length(sortstarttraj)
%     lur3.model.animate(sortstarttraj(i,:))
%         drawnow();
% end
% 
% %% LUR3 MOVES G1
% fprintf('Sorting G1\n');
% Movetolocation(lur3, transl(G1.model.base))
% RaiseRobot(lur3, lur3.model.getpos(),G1)
% Movetolocation(lur3,GREENlocation1,G1)
% LowerRobot(lur3,lur3.model.getpos(),G1)
% RaiseRobot(lur3,lur3.model.getpos());
% 
% %% LUR3 MOVES G2
% fprintf('Sorting G2\n');
% Movetolocation(lur3, transl(G2.model.base))
% RaiseRobot(lur3, lur3.model.getpos(),G2)
% Movetolocation(lur3,GREENlocation2,G2)
% LowerRobot(lur3,lur3.model.getpos(),G2)
% RaiseRobot(lur3,lur3.model.getpos());
% 
% %% LUR3 MOVES G3
% fprintf('Sorting G3\n');
% Movetolocation(lur3, transl(G3.model.base))
% RaiseRobot(lur3, lur3.model.getpos(),G3)
% Movetolocation(lur3,GREENlocation3,G3)
% LowerRobot(lur3,lur3.model.getpos(),G3)
% RaiseRobot(lur3,lur3.model.getpos());
% 
% %% LUR3 MOVES B1
% fprintf('Sorting B1\n');
% Movetolocation(lur3, transl(B1.model.base))
% RaiseRobot(lur3, lur3.model.getpos(),B1)
% Movetolocation(lur3,BLUElocation1,B1)
% LowerRobot(lur3,lur3.model.getpos(),B1)
% RaiseRobot(lur3,lur3.model.getpos());
% 
% %% LUR3 MOVES B2
% fprintf('Sorting B2\n');
% Movetolocation(lur3, transl(B2.model.base))
% RaiseRobot(lur3, lur3.model.getpos(),B2)
% Movetolocation(lur3,BLUElocation2,B2)
% LowerRobot(lur3,lur3.model.getpos(),B2)
% RaiseRobot(lur3,lur3.model.getpos());
% 
% %% LUR3 MOVES B3
% fprintf('Sorting B3\n');
% Movetolocation(lur3, transl(B3.model.base))
% RaiseRobot(lur3, lur3.model.getpos(),B3)
% Movetolocation(lur3,BLUElocation3,B3)
% LowerRobot(lur3,lur3.model.getpos(),B3)
% RaiseRobot(lur3,lur3.model.getpos());
% 
% fprintf('Sorting Completed!')
% 
% end
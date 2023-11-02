% function test()
close all
clc
hold on

% gui = GUI;

tableheight = 0.7;

fprintf('Initialising Environment...\n');

%set environment axis
axis([-4, 4, -4, 4, 0, 4]);

% Estop;












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
% PlaceObject('firstAidKit.ply', [-1.2,1.6,0.7]);
PlaceObject('lightCurtain.ply', [0.5,1,0]);
PlaceObject('lightCurtain2.ply', [-2.7,1,0]);
PlaceObject('lightCurtain3.ply', [0.5,-3.5,0]);
PlaceObject('lightCurtain4.ply', [-2.7,-3.5,0]);
PlaceObject('lightCurtain5.ply', [0.5,0.8,0]);
PlaceObject('lightCurtain6.ply', [0.5,-3.3,0]);
PlaceObject('cardReader.ply', [0.7,-4,0.6]);

%Placement of the two lab tables
PlaceObject('LabTable2.ply', [0.2,0.2,0]);
PlaceObject('LabTable2.ply', [0.2,-1.4,0]);

%% RED TEST TUBE RACK
REDSORTEDTTR = testTubeRack(transl(-0.7,-0.8,0.62)*trotz(deg2rad(90)));

REDlocation1 = REDSORTEDTTR.model.base*transl(transl(-0.025,-0.119, 0.13));

REDlocation2 = REDSORTEDTTR.model.base*transl(transl(-0.025,-0.197,0.13));

REDlocation3 = REDSORTEDTTR.model.base*transl(transl(-0.025,-0.274,0.13));

%% BLUE TEST TUBE RACK
BLUESORTEDTTR = testTubeRack(transl(-0.4,-0.8,0.62)*trotz(deg2rad(90)));

BLUElocation1 = BLUESORTEDTTR.model.base*transl(transl(-0.025,-0.119, 0.13));

BLUElocation2 = BLUESORTEDTTR.model.base*transl(transl(-0.025,-0.197,0.13));

BLUElocation3 = BLUESORTEDTTR.model.base*transl(transl(-0.025,-0.274,0.13));

%% GREEN TEST TUBE RACK
% PlaceObject('testTubeRack.ply', [0.1,-0.8,0.62]);
GREENSORTEDTTR = testTubeRack(transl(-0.1,-0.8,0.62)*trotz(deg2rad(90)));

GREENlocation1 = GREENSORTEDTTR.model.base*transl(transl(-0.025,-0.119, 0.13));

GREENlocation2 = GREENSORTEDTTR.model.base*transl(transl(-0.025,-0.197,0.13));

GREENlocation3 = GREENSORTEDTTR.model.base*transl(transl(-0.025,-0.274,0.13));
%%

% TTF1 = testTubeRackFilled(transl([-0.7,-1.6,0.72]));
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


%% TO BE DELETED %%-----------------------------------------------------------------------------------------------------
tm5.model.teach(tm5.model.getpos());
%%

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

% TTFsortstartlocation = [-0.6732   -1.9074   -1.8035   -1.0223    1.6955    4.1233];
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

%% MOVE LUR3 from start to sort start

lur3sortstart = [-0.6370         0   -0.0374   -2.2016    -5.5850    1.4960   -3.4616];

sortstarttraj = jtraj(lur3.model.getpos(), lur3sortstart, steps);

for i = 1:length(sortstarttraj)
    lur3.model.animate(sortstarttraj(i,:))
        drawnow();
end

%% LUR3 moves to R1
assumeR1 = [-0.6840         0   -0.6233   -1.3422    0.3491   1.5708         0];
q=[-0.7122         0   -0.0873   -2.2842   -0.7480   -1.5708    0.4829];
lur3R1 = (transl(transl(R1.model.base))*transl(0,0,0.13))*trotx(deg2rad(180));
lur3toR1 = lur3.model.ikcon(lur3R1,lur3.model.getpos());%'mask',[1,1,1,1,1,1]); %mask',[1,1,1,0,0,0]);%, assumeR1);



r1starttraj = jtraj(lur3.model.getpos(), lur3toR1, steps);

for i = 1:length(r1starttraj)
    
    lur3.model.animate(r1starttraj(i,:))

        drawnow();
end

RaiseRobot(lur3, lur3.model.getpos())

%%

% currenteepos = lur3.model.fkineUTS(lur3.model.getpos());
% 
% raisedpos = currenteepos * transl(0,0,1);
% 
% updatedlur3joints = lur3.model.ikcon(raisedpos);
% 
% liftr1 = jtraj(lur3.model.getpos(), updatedlur3joints, steps);
% 
% for i = 1:length(liftr1)
% 
%     lur3.model.animate(liftr1(i,:))
% 
% 
%         drawnow();
% end

intermediary = [-0.4332         0   -0.3366   -1.2716    0.3491    1.5708         0];


%% r1 to intermediary

% r1sorted = lur3.model.ikcon(r1finalpos);

r1intertraj = jtraj(lur3.model.getpos(),intermediary,steps);

for i = 1:length(r1intertraj);
    
    lur3.model.animate(r1intertraj(i,:))

        drawnow();
end

%% intermediary to r1final

r1finalpos = [-0.2294         0   -0.5610   -1.4129    0.3491    1.5708         0];

r1intertofinaltraj = jtraj(lur3.model.getpos(), r1finalpos, steps);

for i = 1:length(r1intertofinaltraj)
    
    lur3.model.animate(r1intertofinaltraj(i,:));

        drawnow();
end


R1 = testTubeR(transl(-0.325,-0.48,0.72));
% PlaceObject('testTubeR.ply', [-0.325,-0.48,0.72]);


%% r1 to r2

r2startpos = [-0.6119         0   -0.6483   -1.2245    0.3491    1.5708         0];

r1tor2 = jtraj(lur3.model.getpos(), r2startpos, steps);

for i = 1:length(r1tor2)
    
    lur3.model.animate(r1tor2(i,:));

        drawnow();
end


%% r2 to intermediary

r2tointermediarytraj = jtraj(lur3.model.getpos(), intermediary, steps);

for i = 1:length(r2tointermediarytraj)
    
    lur3.model.animate(r2tointermediarytraj(i,:));

        drawnow();
end

%% intermediary to r2final

r2finalpos = [-0.2044         0   -0.8353   -1.0597    0.3491    1.5708         0];

intermediarytor2finaltraj =  jtraj(lur3.model.getpos(), r2finalpos, steps);

for i = 1:length(intermediarytor2finaltraj)
    
    lur3.model.animate(intermediarytor2finaltraj(i,:));

        drawnow();
end

% R2 = TTR.CreateTT(0.325,-0.55,0.72, 0);
PlaceObject('testTubeR.ply', [-0.325,-0.55,0.72]);



%% R2toG1
g1startpos = [-0.5429         0   -0.6857   -1.2480    0.3491    1.5708         0];

r2tog1traj = jtraj(lur3.model.getpos(), g1startpos, steps);


for i = 1:length(r2tog1traj)
    
    lur3.model.animate(r2tog1traj(i,:));

        drawnow();
end

%% g1 to intermediary

g1starttointermediary = jtraj(lur3.model.getpos(), intermediary, steps);


for i = 1:length(g1starttointermediary)
    
    lur3.model.animate(g1starttointermediary(i,:));

        drawnow();
end

g1endpos = [-0.0100    0.3989   -0.6233   -1.3893    0.3491    1.5708         0];

intermediarytoj1end = jtraj(lur3.model.getpos(), g1endpos ,steps);

for i = 1:length(intermediarytoj1end)
    
    lur3.model.animate(intermediarytoj1end(i,:));

        drawnow();
end

PlaceObject('testTubeG.ply', [0.075,-0.48,0.72]);

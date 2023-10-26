% function test()
close all
clc
hold on

%Placement of floor, brickwalls, a light open curtain 
% and an emergency stop button
PlaceObject('floor.ply',[0,-1,0]);
PlaceObject('brickWall.ply',[3,2,0]);
PlaceObject('brickWall2.ply',[-3,2,0]);
PlaceObject('openCurtain.ply',[3,-1,0.8]);

%Placement of the two lab tables
% PlaceObject('labTable.ply',[0,0,0.41]);
% PlaceObject('labTable.ply',[0,-2.5,0.41]);

%Placement of UR3 robot
baseLUR3 = transl([-0.8,0,0.7])*trotz(-pi);
lur3 = LinearUR3(baseLUR3);
lur3.model.animate(lur3.model.getpos());
PlaceObject('emergencyStopButton.ply', [-1.1,0,0.7]);

%Placement of TM5-900 robot
baseTM5 = transl([-0.7,-1.0,0.7])*trotz(-pi);
tm5 = TM5(baseTM5);
tm5.model.animate(tm5.model.getpos());
PlaceObject('emergencyStopButton.ply', [-1.1,-1.0,0.7]);

%Placement of rack and 3 test tubes coloured Red
TTR = testTubeR();

R1 = TTR.CreateTT(-0.325,-0.48,0.72, 0);
% PlaceObject('testTubeR.ply', [-0.325,-0.48,0.72]);

R2 = TTR.CreateTT(-0.325,-0.55,0.72, 0);
% PlaceObject('testTubeR.ply', [-0.325,-0.55,0.72]);

R3 = TTR.CreateTT(-0.325,-0.62,0.72, 0);
% PlaceObject('testTubeR.ply', [-0.325,-0.62,0.72]);
PlaceObject('testTubeRack.ply', [-0.3,-0.3,0.62]);

%Placement of second rack and 3 test tubes coloured Blue
TTB = testTubeB();

% B1 = TTB.CreateTT(-0.125, -0.48, 0.72, 0);
PlaceObject('testTubeB.ply', [-0.125,-0.48,0.02]);

% B2 = TTB.CreateTT(-0.125,-0.55,0.72, 0);
PlaceObject('testTubeB.ply', [-0.125,-0.55,0.72]);

% B3 = TTB.CreateTT(-0.125,-0.62,0.72, 0);
PlaceObject('testTubeB.ply', [-0.125,-0.62,0.72]);
PlaceObject('testTubeRack.ply', [-0.1,-0.3,0.62]);

%Placement of third rack and 3 test tubes coloured Green
TTG = testTubeG();

% G1 = TTG.CreateTT(0.075,-0.48,0.72, 0);
PlaceObject('testTubeG.ply', [0.075,-0.48,0.72]);

% G2 = TTG.CreateTT(0.075,-0.55,0.72, 0); 
PlaceObject('testTubeG.ply', [0.075,-0.55,0.72]);

% G3 = TTG.CreateTT(0.075,-0.62,0.72, 0);
PlaceObject('testTubeG.ply', [0.075,-0.62,0.72]);
PlaceObject('testTubeRack.ply', [0.1,-0.3,0.62]);

PlaceObject('TestTubeRackWhole.ply', [-0.6,-0.6,0.7]);

PlaceObject('LabTable2.ply', [0.2,0.2,0]);

PlaceObject('fireExtinguisherElevated.ply', [-2.5,1.5,0.45]);

tm5.model.teach(tm5.model.getpos());

lur3startpos = [-0.0100         0         0         0         0   -1.5708         0];

tm5startpos = [1.5708   -1.5708    1.5708   -1.5708   -1.5708    3.1416];

tm5secondpos = [0.5236   -1.0472    1.3090   -2.0944   -1.8326    3.4034];

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
baseTR = transl([-0.8,0,0])*trotz(-pi);
r = LinearUR3(baseTR);
r.model.animate(r.model.getpos());
PlaceObject('emergencyStopButton.ply', [-1.1,0,0]);

%Placement of TM5-900 robot
baseTR = transl([-0.7,-1.0,0])*trotz(-pi);
s = TM5(baseTR);
s.model.animate(s.model.getpos());
PlaceObject('emergencyStopButton.ply', [-1.1,-1.0,0]);

%Placement of rack and 3 test tubes coloured Red
PlaceObject('testTubeR.ply', [-0.325,-0.48,0.02]);
PlaceObject('testTubeR.ply', [-0.325,-0.55,0.02]);
PlaceObject('testTubeR.ply', [-0.325,-0.62,0.02]);
PlaceObject('testTubeRack.ply', [-0.3,-0.3,-0.08]);

%Placement of second rack and 3 test tubes coloured Blue
PlaceObject('testTubeB.ply', [-0.125,-0.48,0.02]);
PlaceObject('testTubeB.ply', [-0.125,-0.55,0.02]);
PlaceObject('testTubeB.ply', [-0.125,-0.62,0.02]);
PlaceObject('testTubeRack.ply', [-0.1,-0.3,-0.08]);

%Placement of third rack and 3 test tubes coloured Green
PlaceObject('testTubeG.ply', [0.075,-0.48,0.02]);
PlaceObject('testTubeG.ply', [0.075,-0.55,0.02]);
PlaceObject('testTubeG.ply', [0.075,-0.62,0.02]);
PlaceObject('testTubeRack.ply', [0.1,-0.3,-0.08]);

PlaceObject('TestTubeRackWhole.ply', [-0.6,-0.6,0]);

PlaceObject('fireExtinguisherElevated.ply', [-2.5,1.5,0.45]);


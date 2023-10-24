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
PlaceObject('emergencyStopButton.ply', [0.15,0.35,0.82]);

%Placement of the two lab tables
PlaceObject('labTable.ply',[0,0,0.41]);
PlaceObject('labTable.ply',[0,-2.5,0.41]);

%Placement of UR3 robot
baseTR = transl([0.15,0,0.82])*trotz(-pi);
r = LinearUR3(baseTR);
r.model.animate(r.model.getpos());
PlaceObject('emergencyStopButton.ply', [0.15,0.35,0.82]);

%Placement of TM5-900 robot
% baseTR = transl([-0.8,-2,0])*trotz(-pi);
% s = TM5(baseTR);
% s.model.animate(s.model.getpos());

%Placement of rack and 3 test tubes coloured RGB
PlaceObject('testTubeR.ply', [-0.6,-2.4,0.85]);
PlaceObject('testTubeG.ply', [-0.6,-2.6,0.85]);
PlaceObject('testTubeB.ply', [-0.6,-2.8,0.85]);
PlaceObject('testTubeRack.ply', [-0.53,-1.99,0.6]);

%Placement of second rack and 3 test tubes coloured RGB
PlaceObject('testTubeR.ply', [-0.15,-2.4,0.85]);
PlaceObject('testTubeG.ply', [-0.15,-2.6,0.85]);
PlaceObject('testTubeB.ply', [-0.15,-2.8,0.85]);
PlaceObject('testTubeRack.ply', [-0.08,-1.99,0.6]);
PlaceObject('fireExtinguisherElevated.ply', [1,1,0.45]);


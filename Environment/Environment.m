% function test()
close all
clc
hold on



tableheight = 0.7;

fprintf('Initialising Environment...\n');
%set environment axis
axis([-4, 4, -4, 4, 0, 4]);











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
REDSORTEDTTR = testTubeRack(transl(-0.3,-0.8,0.62));

%% BLUE TEST TUBE RACK
BLUESORTEDTTR = testTubeRack(transl(-0.1,-0.8,0.62));

%% GREEN TEST TUBE RACK
% PlaceObject('testTubeRack.ply', [0.1,-0.8,0.62]);
GREENSORTEDTTR = testTubeRack(transl(0.1,-0.8,0.62));

TTF1 = testTubeRackFilled(transl([-0.7,-1.6,0.72]));

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

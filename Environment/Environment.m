% function test()
close all
clc
hold on

axis([-4, 4, -4, 4, 0, 4]);

%Placement of floor, brickwalls, a light open curtain 
% and an emergency stop button
PlaceObject('floor.ply',[0,-1,0.01]);
PlaceObject('brickWallX.ply',[3,2,0]);
PlaceObject('brickWallLeft.ply',[-3,2,0]);
% PlaceObject('openCurtain.ply',[3,-1,0.8]);
PlaceObject('brickWallRight.ply',[3,-4,0]);
PlaceObject('wallDoor.ply',[0.7,-4,0]);

%Placement of the two lab tables
% PlaceObject('labTable.ply',[0,0,0.41]);
% PlaceObject('labTable.ply',[0,-2.5,0.41]);

PlaceObject('LabTable2.ply', [0.2,0.2,0]);
PlaceObject('LabTable2.ply', [0.2,-1.4,0]);

%Placement of rack and 3 test tubes coloured Red
TTR = testTubeR();
%% RED TEST TUBES %%
% % R1 = TTR.CreateTT(-0.325,-0.48,0.72, 0);
% PlaceObject('testTubeR.ply', [-0.325,-0.48,0.72]);
% 
% % R2 = TTR.CreateTT(-0.325,-0.55,0.72, 0);
% PlaceObject('testTubeR.ply', [-0.325,-0.55,0.72]);
% 
% % R3 = TTR.CreateTT(-0.325,-0.62,0.72, 0);
% PlaceObject('testTubeR.ply', [-0.325,-0.62,0.72]);

%% RED TEST TUBE RACK
PlaceObject('testTubeRack.ply', [-0.3,-0.3,0.62]);

%Placement of second rack and 3 test tubes coloured Blue
TTB = testTubeB();
%% BLUE TEST TUBES
% % B1 = TTB.CreateTT(-0.125, -0.48, 0.72, 0);
% PlaceObject('testTubeB.ply', [-0.125,-0.48,0.72]);
% 
% % B2 = TTB.CreateTT(-0.125,-0.55,0.72, 0);
% PlaceObject('testTubeB.ply', [-0.125,-0.55,0.72]);
% 
% % B3 = TTB.CreateTT(-0.125,-0.62,0.72, 0);
% PlaceObject('testTubeB.ply', [-0.125,-0.62,0.72]);

%% BLUE TEST TUBE RACK
PlaceObject('testTubeRack.ply', [-0.1,-0.3,0.62]);

%Placement of third rack and 3 test tubes coloured Green
TTG = testTubeG();
%% GREEN TEST TUBES
% % G1 = TTG.CreateTT(0.075,-0.48,0.72, 0);
% PlaceObject('testTubeG.ply', [0.075,-0.48,0.72]);
% 
% % G2 = TTG.CreateTT(0.075,-0.55,0.72, 0); 
% PlaceObject('testTubeG.ply', [0.075,-0.55,0.72]);
% 
% % G3 = TTG.CreateTT(0.075,-0.62,0.72, 0);
% PlaceObject('testTubeG.ply', [0.075,-0.62,0.72]);
%% GREEN TEST TUBE RACK
PlaceObject('testTubeRack.ply', [0.1,-0.3,0.62]);



PlaceObject('fireExtinguisherElevated.ply', [-2.5,1.5,0.45]);
PlaceObject('fireBlanket.ply', [-2,1.6,0.7]);
% PlaceObject('firstAidKit.ply', [-1.2,1.6,0.7]);
PlaceObject('lightCurtain.ply', [0.5,1,0]);
PlaceObject('lightCurtain2.ply', [-2.7,1,0]);
PlaceObject('lightCurtain3.ply', [0.5,-3.5,0]);
PlaceObject('lightCurtain4.ply', [-2.7,-3.5,0]);
PlaceObject('cardReader.ply', [0.7,-4,0.6]);

% PlaceObject('TestTubeRackFilled.ply',[0.18,-1.6,0.72]);
TTF = testTubeRackFilled();

TTF1 = TTF.CreateTT(0.18,-1.6,0.72,0);

%Placement of UR3 robot
baseLUR3 = transl([0.0,0,0.7])*trotz(0);
lur3 = LinearUR3(baseLUR3);
% lur3.model.animate(lur3.model.getpos());
lur3startpos = [-0.0100         0         0         0         0   -1.5708         0];
lur3.model.animate(lur3startpos);
PlaceObject('emergencyStopButton.ply', [-1.1,0,0.7]);

%Placement of TM5-900 robot
baseTM5 = transl([-0.3,-1.0,0.7])*trotz(-pi);
tm5 = TM5(baseTM5);
tm5startpos = [1.5708   -1.5708    1.5708   -1.5708   -1.5708    3.1416];
% tm5.model.animate(tm5.model.getpos());
tm5.model.animate(tm5startpos);
% PlaceObject('emergencyStopButton.ply', [-1.1,-1.0,0.7]);

tm5.model.teach(tm5.model.getpos());



% tm5secondpos = [0.5236   -1.0472    1.3090   -2.0944   -1.8326    3.4034];

%%

% r1initial= 0;
% r2initial= 0;
% r3initial= 0;
% 
% g1initial= 0;
% g2initial= 0;
% g3initial= 0;
% 
% b1initial= 0;
% b2initial= 0;
% b3initial= 0;
% 
% 
% 
% 
% 
r1finalpos = [-0.325,-0.48,0.72];
r2finalpos = [-0.325,-0.55,0.72];
r3finalpos = [-0.325,-0.62,0.72];

g1finalpos = [0.075,-0.48,0.72];
g2finalpos = [0.075,-0.55,0.72];
g3finalpos = [0.075,-0.62,0.72];

b1finalpos = [-0.125, -0.48, 0.72];
b2finalpos = [-0.125,-0.55,0.72];
b3finalpos = [-0.125,-0.62,0.72];

pause();

%% TM5 MOVES FROM START POS TO TEST TUBE RACK WITH ASSORTED TEST TUBES

steps = 100;


tm5grabrack = [2.3562   -2.1817   -1.4600   -1.0223    1.6955    4.1233];

movefrominitialtorandTT = jtraj(tm5.model.getpos(),tm5grabrack, steps);

for i = 1:length(movefrominitialtorandTT)
    
    tm5.model.animate(movefrominitialtorandTT(i,:))
        drawnow();
end

%% TM5 MOVES ASSORTED TEST TUBE RACK TO SORTING START POS

TTFsortstartlocation = [-0.6732   -1.9074   -1.8035   -1.0223    1.6955    4.1233];

movefromTTtostartpos = jtraj(tm5.model.getpos(), TTFsortstartlocation, steps);

for i = 1:length(movefromTTtostartpos)
    
    tm5.model.animate(movefromTTtostartpos(i,:))
        

        TTF1.base = tm5.model.fkine(tm5.model.getpos());
        TTF1.animate(0);
        drawnow();
end

TTF1.base = transl([-0.6,-0.6,0.7])* trotx(0)*troty(0)*trotz(0);
TTF1.animate(0);

% PlaceObject('TestTubeRackWhole.ply', [-0.6,-0.6,0.7]);

%% MOVE LUR3 from start to sort start

lur3sortstart = [-0.6840         0   -0.6233   -1.3422    0.3491    1.5708         0];

sortstarttraj = jtraj(lur3.model.getpos(), lur3sortstart, steps);

for i = 1:length(sortstarttraj)
    
    lur3.model.animate(sortstarttraj(i,:))

        drawnow();
end


%% testtube start locations

r1startlocation = lur3.model.fkineUTS(lur3sortstart)*transl(0,-0.48,-0.122);

r2startlocation = r1startlocation*transl(-0.08,0,0);

r3startlocation = 0;

g1startlocation = 0;

g2startlocation = 0;

g3startlocation = 0;

b1startlocation = 0;

b2startlocation = 0;

b3startlocation = 0;

%% TM5 moves up to see all test tubes

endpos = [-0.6732   -1.4337   -1.0735   -1.8700    1.6955    4.1233];

tm5endtraj = jtraj(tm5.model.getpos(), endpos, steps);

for i = 1:length(tm5endtraj)
    
    tm5.model.animate(tm5endtraj(i,:))

        drawnow();
end




%% LUR3 moves to R1

lur3toR1 = [-0.6840         0   -0.6233   -1.3422    0.3491   1.5708         0];

r1starttraj = jtraj(lur3.model.getpos(), lur3toR1, steps);

for i = 1:length(r1starttraj)
    
    lur3.model.animate(r1starttraj(i,:))

        drawnow();
end

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


% R1 = TTR.CreateTT(-0.325,-0.48,0.72, 0);
PlaceObject('testTubeR.ply', [-0.325,-0.48,0.72]);


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

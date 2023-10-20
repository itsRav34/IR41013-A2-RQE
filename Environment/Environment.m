% function test()
close all
clc
hold on
PlaceObject('tableBrown2.1x1.4x0.5m.ply',[0,0,0]);

baseTR = transl([0.15,0,0.5])*trotz(-pi);
r = LinearUR3(baseTR);
r.model.animate(r.model.getpos());
PlaceObject('emergencyStopButton.ply', [0.15,0.5,0.5]);

% for i = -1:0.1:-0.8
    PlaceObject('testTubeGreen.ply', [-0.2,0.22,0.5]);
    PlaceObject('testTubeRed.ply', [-0.2,0,0.5]);
    PlaceObject('testTubeBlue.ply', [-0.2,-0.22,0.5]);
    PlaceObject('fireExtinguisherElevated.ply', [1,1,0.45]);

% end
    % hold on
    % PlaceObject('testTubeRack.ply', [-1,0.22,0.5]);
    % PlaceObject('barrier1.5x0.2x1m.ply', [0,-1,0]);
    % PlaceObject('barrier1.5x0.2x1m.ply', [0,1,0]);

    
    
    
    
% % function test()
% close all
% clc
% hold on
% PlaceObject('tableBrown2.1x1.4x0.5m.ply',[0,0,0]);
% 
% baseTR = transl([-0.2,0,0.5])*trotz(-pi);
% r = LinearUR3(baseTR);
% r.model.animate(r.model.getpos());
% 
% for i = -1:0.1:-0.8
%     PlaceObject('testTube.ply', [i,0.22,0.5]);
%     PlaceObject('testTube.ply', [i,0,0.5]);
%     PlaceObject('HalfSizedRedGreenBrick.ply', [i,-0.22,0.5]);
% 
% end
% 
%     PlaceObject('barrier1.5x0.2x1m.ply', [0,-1,0]);
%     PlaceObject('barrier1.5x0.2x1m.ply', [0,1,0]);
%     PlaceObject('fireExtinguisherElevated.ply', [1,1,0.45]);


















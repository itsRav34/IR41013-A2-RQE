% function test()
close all
clc
hold on
PlaceObject('tableBrown2.1x1.4x0.5m.ply',[0,0,0]);

baseTR = transl([-0.2,0,0.5])*trotz(-pi);
r = LinearUR3(baseTR);
r.model.animate(r.model.getpos());

for i = -1:0.1:-0.8
    PlaceObject('HalfSizedRedGreenBrick.ply', [i,0.22,0.5]);
    PlaceObject('HalfSizedRedGreenBrick.ply', [i,0,0.5]);
    PlaceObject('HalfSizedRedGreenBrick.ply', [i,-0.22,0.5]);

end

    PlaceObject('barrier1.5x0.2x1m.ply', [0,-1,0]);
    PlaceObject('barrier1.5x0.2x1m.ply', [0,1,0]);
    PlaceObject('fireExtinguisherElevated.ply', [1,1,0.45]);



















% load('ur3_q.mat');
% r = UR3;
% 
% figure(1)
% for i=1:1851
%     newQ = q(i,:);
%     r.model.animate(newQ);
%     drawnow();
% end













% cow = RobotCows(1);
% axis([-2,2,-2,2,0,4])
% cow.cowModel{1}.base = r.model.fkine(r.model.getpos());
% qPath = jtraj(r.model.qlim(:,1)',r.model.qlim(:,2)',200);
% for i = 1.length(qPath)
%     r.model.animate(qPath(i,:))
%     drawnow();
%     cow.cowModel{1}.base = r.model.fkine(r.model.getpos())
%     cow.cowModel{1}.animate(0);
%     drawnow();
%             input('Enter');
%         pause(0)
%     end
% end

% function test()
%     close all
%     obj = Brick();
%     r = LinearUR3;
%     x1 = 0;
%     x2 = 0;
%     y1 = 0;
%     y2 = 0;
%     z1 = 0;
%     z2 = 0;
%     % r.TestMoveJoints;
% 
%     % Instantiate Brick objects
%     brick1 = Brick();
%     brick2 = Brick();
%     % Add more bricks as needed
% 
%     axis([-2, 2, -2, 2, 0, 4])
% 
%     % % Set initial positions for bricks
%     brick1.setPosition([x1, y1, z1]);
%     brick2.setPosition([x2, y2, z2]);
%     % % Set positions for additional bricks
% 
%     qPath = jtraj(r.model.qlim(:, 1)', r.model.qlim(:, 2)', 200);
% 
%     for i = 1:length(qPath)
%         r.model.animate(qPath(i, :))
%         drawnow();
% 
%         % % % Update brick positions based on robot or other factors
%         brick1.setPosition([newX1, newY1, newZ1]);
%         brick2.setPosition([newX2, newY2, newZ2]);
%         % % Update positions for additional bricks
% 
%         % Animate and render bricks
%         brick1.animate();
%         brick2.animate();
%         % Animate and render additional bricks
% 
%         drawnow();
%         pause(0);
% end
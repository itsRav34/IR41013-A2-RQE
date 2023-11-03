function Movetolocation(robot,endpos,testtube)
steps = 100;
if nargin<3

    robottoendpos = (transl(endpos)*transl(0,0,0.13))*trotx(deg2rad(180));
    currenttoendpos = robot.model.ikcon(robottoendpos,robot.model.getpos());



movementTraj = jtraj(robot.model.getpos(), currenttoendpos, steps);

for i = 1:length(movementTraj)
    
    robot.model.animate(movementTraj(i,:))

        drawnow();
end


else
    robottoendpos = (transl(endpos)*transl(0,0,0.26))*trotx(deg2rad(180));
currenttoendpos = robot.model.ikcon(robottoendpos,robot.model.getpos());



movementTraj = jtraj(robot.model.getpos(), currenttoendpos, steps);

for i = 1:length(movementTraj)
    
    robot.model.animate(movementTraj(i,:))

    robotpos = transl(transl(robot.model.fkineUTS(robot.model.getpos())))*transl(0,0,-0.13);
    flip = trotx(0,'deg');
    testtube.model.base = robotpos*flip;
    testtube.model.animate(0);

    drawnow();
end


end
function RaiseRobot(robot, currentpos)

steps = 100;

current = robot.model.fkineUTS(currentpos);

futurepos = current*transl(0,0,-0.13);

q = robot.model.ikcon(futurepos,currentpos);

raisetraj = jtraj(currentpos, q,steps);

    for i = 1:steps
        
        robot.model.animate(raisetraj(i,:))
        drawnow();

    end
end
function RaiseRobot(robot, currentpos, testtube)

steps = 100;

current = robot.model.fkineUTS(currentpos);

futurepos = current*transl(0,0,-0.13);

q = robot.model.ikcon(futurepos,currentpos);

raisetraj = jtraj(currentpos, q,steps);

    if nargin <3
        for i = 1:steps
        
        robot.model.animate(raisetraj(i,:))
        drawnow();

        end
            else
                for i = 1:steps
        
                    robot.model.animate(raisetraj(i,:))

                    robotpos = transl(transl(robot.model.fkineUTS(robot.model.getpos())))*transl(0,0,-0.13);
                    flip = trotx(0,'deg');
                    testtube.model.base = robotpos*flip;
                    testtube.model.animate(0);

                    drawnow();

                end
    end
end
classdef TM5 < RobotBaseClass

    properties (Access = public)
        plyFileNameStem = 'TM5';
    end

    methods
        % Constructor
        function self = HandELeft(baseTr)
            if nargin < 1
                baseTr = eye(4);
            end
            self.CreateModel();
            self.model.base = self.model.base.T * baseTr * trotx(pi/2)* transl(0,0,0.03); %* troty(0); %;            

            % Plot and color the robot
            self.PlotAndColourRobot();
        end

        function CreateModel(self)           

            %[THETA D A ALPHA SIGMA]
            link(1) = Link('d',0.1452,'a',0,'alpha',pi/2,'qlim',deg2rad([-360 360]), 'offset',0);
            link(2) = Link('d',0,'a',-0.429,'alpha',0,'qlim', deg2rad([-360 360]), 'offset',0);
            link(3) = Link('d',0,'a',-0.4115,'alpha',0,'qlim', deg2rad([-360 360]), 'offset', 0);
            link(4) = Link('d',0.106,'a',0,'alpha',pi/2,'qlim',deg2rad([-360 360]),'offset', 0);
            link(5) = Link('d',0.1135,'a',0,'alpha',-pi/2,'qlim',deg2rad([-360,360]), 'offset',0);
            link(6) = Link('d',	0.0921,'a',0,'alpha',0,'qlim',deg2rad([-360,360]), 'offset', 0);

            % Define the name property (you can customize it)
            self.name = 'TM5';

            % Create the robot model
            self.model = SerialLink(link, 'name', self.name);
        end
    end
end
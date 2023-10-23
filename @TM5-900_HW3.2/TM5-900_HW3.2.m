classdef HandELeft < RobotBaseClass

    properties (Access = public)
        plyFileNameStem = 'TM5_900_HW3_2';
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
            link(1) = Link([ 0, 0.15005, 0, -pi/2, 1], 'standard');
            link(1).qlim = [-0.045 -0.01];
            % link(1).a = -0.0146;     

            % Define the name property (you can customize it)
            self.name = 'TM5_900_HW3_2';

            % Create the robot model
            self.model = SerialLink(link(1), 'name', self.name);
        end
    end
end
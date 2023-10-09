classdef EERight < RobotBaseClass

    properties (Access = public)
        plyFileNameStem = 'EERight';
    end

    methods
        % Constructor
        function self = EERight(baseTr)

            self.CreateModel();
            self.model.base = self.model.base.T * baseTr * trotx(pi/2) * troty(pi) * transl(0, 0, -0.03);
            % Check if baseTr is provided; otherwise, use the identity matrix
            if nargin < 1
                baseTr = eye(4);
            end

            % Plot and color the robot
            self.PlotAndColourRobot();
        end

        function CreateModel(self)
            L1 = Link([ 0, 0.15, 0, -pi/2, 1]);
            L1.qlim = [-0.03 -0.001];
            
            % Define the name property (you can customize it)
            self.name = 'EERight';

            % Create the robot model
            self.model = SerialLink(L1, 'name', self.name);
        end
    end
end
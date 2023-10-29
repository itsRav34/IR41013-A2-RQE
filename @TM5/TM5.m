classdef TM5 < RobotBaseClass
    %% LinearUR5 UR5 on a non-standard linear rail created by a student

    properties(Access = public)              
        plyFileNameStem = 'TM5';
    end
    
    methods
%% Define robot Function 
        function self = TM5(baseTr)
			self.CreateModel();
            if nargin < 1			
				baseTr = eye(4);				
            end
            self.model.base = self.model.base.T * baseTr;
            
            self.PlotAndColourRobot();         
        end

%% Create the robot model
        function CreateModel(self)   
            % Create the UR3 model mounted on a linear rail
            link(1) = Link('d',0.1452,'a',0,'alpha',pi/2,'qlim',deg2rad([-270 270]), 'offset',0);
            link(2) = Link('d',0,'a',-0.429,'alpha',0,'qlim', deg2rad([-180 0]), 'offset',0);
            link(3) = Link('d',0,'a',-0.4115,'alpha',0,'qlim', deg2rad([-155 155]), 'offset', 0);
            link(4) = Link('d',0.106,'a',0,'alpha',pi/2,'qlim',deg2rad([-180 180]),'offset', 0);
            link(5) = Link('d',0.106,'a',0,'alpha',-pi/2,'qlim',deg2rad([-180,180]), 'offset',0);
            link(6) = Link('d',	0.1135,'a',0,'alpha',0,'qlim',deg2rad([-270,270]), 'offset', 0);
            
            self.model = SerialLink(link,'name',self.name);
        end
     
    end
end

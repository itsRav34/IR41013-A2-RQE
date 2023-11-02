classdef testTubeRack < ObjectBaseClass
    %% LinearUR5 UR5 on a non-standard linear rail created by a studenttestTubeRack

    properties(Access = public)              
        plyFileNameStem = 'testTubeRack';
    end
    
    methods
%% Define Object Function 
        function self = testTubeRack(baseTr)
			self.CreateModel();
            if nargin < 1			
				baseTr = eye(4);				
            end
            self.model.base = self.model.base.T * baseTr;
            
            self.PlotAndColourObject();         
        end

%% Create the Object model
        function CreateModel(self)   
            % Create the UR3 model mounted on a linear rail
            link(1) = Link('d',0.13,'a',0.0,'alpha', 0.0,'offset',0);
            
            self.model = SerialLink(link,'name',self.name);
        end
     
    end
end

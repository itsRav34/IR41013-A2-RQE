classdef testTubeR < handle
    %TTS A class that creates a set of TTs
    %   The TTs can be positioned and oriented manually.

    properties (Constant)
        %> Max height is for plotting of the workspace
        maxHeight = 10;
    end

    properties
        %> Number of TTs
        TTCount = 0;

        %> A cell structure of TTs
        TTModel;

        %> Dimensions of the workspace
        workspaceDimensions;
    end

    methods
        %% Constructors
        function self = testTubeR()
            self.workspaceDimensions = [-3, 3, -3, 3, 0, self.maxHeight];
        end

        %% CreateTT
        function TTModel = CreateTT(self, x, y, z, rotation)
            self.TTCount = self.TTCount + 1;

            if nargin < 5
                rotation = 0;
            end

            TTModel = self.GetTTModel(['testTubeR', num2str(self.TTCount)]);
            pose = transl(x,y,z) * trotz(rotation);
            TTModel.base = pose;

            % Plot 3D model
            plot3d(TTModel, 0, 'workspace', self.workspaceDimensions, 'view', [-8, 10], 'delay', 0, 'noarrow', 'nowrist');

            axis equal;
            if isempty(findobj(get(gca, 'Children'), 'Type', 'Light'))
                camlight;
            end
        end
    end

    methods (Static)
        %% GetTTModel
        function model = GetTTModel(name)
            if nargin < 1
                name = 'testTubeR';
            end
            [faceData, vertexData] = plyread('testTubeR.ply', 'tri');
            link1 = Link('alpha', 0, 'a', 0, 'd', 0, 'offset', 0);
            model = SerialLink(link1, 'name', name);
            
            % Changing order of cell array from {faceData, []} to 
            % {[], faceData} so that data is attributed to Link 1
            % in plot3d rather than Link 0 (base).
            model.faces = {[], faceData};

            % Changing order of cell array from {vertexData, []} to 
            % {[], vertexData} so that data is attributed to Link 1
            % in plot3d rather than Link 0 (base).
            model.points = {[], vertexData};
        end
    end
end

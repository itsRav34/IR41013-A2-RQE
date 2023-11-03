function Estop
    % f = figure;
    % ax = axes(f);
    % ax.Units = 'pixels';
    % ax.Position = [75 75 325 280];
    c = uicontrol;
    c.String = 'STOP';
    c.Callback = @pauseScript;
    
    % Add Pause button
    pauseBtn = uicontrol('Style', 'pushbutton', 'String', 'Pause', ...
        'Position', [75 20 60 30], 'Callback', @pauseScript);


    function pauseScript(~, ~)
        disp('Script paused. Press any key to continue...');
        pause();
    end
end
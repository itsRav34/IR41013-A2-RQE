
function k = kbhit
    % Check if a key has been pressed
    k = false;
    if ~isempty(get(get(0,'CurrentFigure'),'CurrentCharacter'))
        k = true;
    end
end

function key = getkey
    % Get the key that has been pressed
    key = get(get(0,'CurrentFigure'),'CurrentCharacter');
    % Flush the keyboard buffer
    while kbhit
        get(get(0,'CurrentFigure'),'CurrentCharacter');
    end
end





stopFlag = false;

while ~stopFlag
    % Your robot control code goes here

    % Check for user input asynchronously
    if kbhit
        key = getkey;
        if key == 'q' % Check for a specific key (e.g., 'q') to stop
            stopFlag = true;
        end
    end
end


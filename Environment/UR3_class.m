%% UR3
% Create a UR3 robot model
ur3 = UR3;

% Specify the joint configuration
q = [0,pi/10,0,0,0,0];  % Joint angles

% Compute the end effector pose for the specified joint configuration
T_end_effector = ur3.model.fkine(q);

% Extract the z-coordinate of the end effector position
end_effector_z = T_end_effector.t(3);

% Table height from the ground (0.4 meters)
table_height = 0.4;

% Calculate the distance from the end effector to the floor (in meters)
distance_to_floor = end_effector_z + table_height;

% Round the distance to 4 decimal places
rounded_distance_to_floor = round(distance_to_floor, 4);

disp(['The distance from the end effector to the floor is approximately ', num2str(rounded_distance_to_floor), ' meters.']);
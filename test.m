clear all;
clc;
close all;

hold on;

x=0;
y=0;
z=0;

onel = PlaceObject('LabTable.ply',[x,y,z]);
hold off;

for i=1:5

    x = i;
    y = i;
    z = i;

    PlaceObject('LabTable.ply',[x,y,z]);

    drawnow();
end

hold off;
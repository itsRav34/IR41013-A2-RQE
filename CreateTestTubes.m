function CreateTestTubes()
%% TEST TUBE LOCATIONS

R1o = TTRE.model.base*transl(transl(-0.176,0.164, 0.02));
R2o = TTRE.model.base*transl(transl(-0.113,0.164,0.02));
R3o = TTRE.model.base*transl(transl(-0.046,0.104,0.02));

G1o = TTRE.model.base*transl(transl(-0.046,0.164,0.02));
G2o = TTRE.model.base*transl(transl(-0.113,0.104,0.02));
G3o = TTRE.model.base*transl(transl(-0.046, 0.041,0.02));

B1o = TTRE.model.base*transl(transl(-0.176,0.104,0.02));
B2o = TTRE.model.base*transl(transl(-0.176,0.041,0.02));
B3o = TTRE.model.base*transl(transl(-0.113, 0.041,0.02));

%% Create Test Tubes
R1 = testTubeR(transl(R1o));
R2 = testTubeR(transl(R2o));
R3 = testTubeR(transl(R3o));

G1 = testTubeG(transl(G1o));
G2 = testTubeG(transl(G2o));
G3 = testTubeG(transl(G3o));

B1 = testTubeB(transl(B1o));
B2 = testTubeB(transl(B2o));
B3 = testTubeB(transl(B3o));
end
initSim

%LoadMassSweep = [linspace(0.92108,0.92148,20), linspace(2,2.0030,20)];
LoadMassSweep = linspace(0.95,1.05,5);

%LoadMassSweep = linspace(0.85,0.95,100); % ABORT LOW
%LoadMassSweep = linspace(1.95,2.05,100); % ABORT HIGH

numRuns = length(LoadMassSweep);

in(1:numRuns) = Simulink.SimulationInput('point_Dynamics_a');
for i = numRuns:-1:1
    in(i) = in(i).setBlockParameter('point_Dynamics_a/LoadMass', ...
        'Value', num2str(LoadMassSweep(i)));

    in(i) = in(i).setModelParameter('Description', num2str(LoadMassSweep(i)));
    
    in(i) = in(i).setVariable('cableLength',cableLength);
    in(i) = in(i).setVariable('gravity',gravity);
    in(i) = in(i).setVariable('loadMass',loadMass);
    in(i) = in(i).setVariable('maxCargoWeight',maxCargoWeight);
    in(i) = in(i).setVariable('quadMass',quadMass);
    in(i) = in(i).setVariable('quadrotor',quadrotor);
    in(i) = in(i).setVariable('tensionLowerBound',tensionLowerBound);
    in(i) = in(i).setVariable('tensionUpperBound',tensionUpperBound);
    in(i) = in(i).setVariable('initQuadPos',initQuadPos);
    in(i) = in(i).setVariable('initLoadPos',initLoadPos);
end

out = parsim(in, 'ShowSimulationManager','on','ShowProgress','on');

Simulink.sdi.view;
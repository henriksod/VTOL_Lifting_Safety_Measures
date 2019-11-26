clear all, close all
mdl_quadrotor
quadrotor.m = 1;
quadrotor.ell = 4;

initQuadPos = [1 1 -2]';
initLoadPos = [0 0 -0.11]';

global gravity quadMass cableLength loadMass tensionLowerBound tensionUpperBound maxCargoWeight
gravity = quadrotor.g;
quadMass = quadrotor.M;
loadMass = quadrotor.m;
cableLength = quadrotor.ell;
tensionLowerBound = 0.1; % percentage
tensionUpperBound = 0.1; % percentage
maxCargoWeight = quadrotor.M/2; % 2 kg

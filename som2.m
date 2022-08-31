
function [net,outputs,Class,nClass]=som2(datain)
%% Load Data
inputs = datain;
inputs;
%% Create and Train SOM
% Create a Self-Organizing Map
LatticeSize=[2 2];
CoverSteps=20;
InitNeighbor=3;
Tolology='hextop';
Distance='dist';
net = selforgmap(LatticeSize,CoverSteps,InitNeighbor,Tolology,Distance);
net.TrainParam.ShowWindow=true;
net.TrainParam.ShowCommandLine=false;
net.TrainParam.Show=1;
net.TrainParam.Epochs=100;
% Train the Network
[net tr] = train(net,inputs);

%% Simulate Networkth

% Test the Network
outputs = net(inputs);
Class=vec2ind(outputs);
nClass=size(outputs,1);

%% Plots
 view(net)
figure;
plotsomtop(net)
set(gcf,'Toolbar','figure');
figure;
plotsomnc(net);
set(gcf,'Toolbar','figure');
figure;
plotsomnd(net);
set(gcf,'Toolbar','figure');
% figure;
% plotsomplanes(net);
% set(gcf,'Toolbar','figure');
figure;
plotsomhits(net,inputs);
set(gcf,'Toolbar','figure');

figure;
Colors=0.9*hsv(nClass);
Colors=Colors(randperm(nClass),:);
plotsompos(net);
hold on;
for c=1:nClass
    plot(inputs(1,Class==c),inputs(2,Class==c),'.','Color',Colors(c,:));
end
set(gcf,'Toolbar','figure');
end



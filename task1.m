%% Initialisation

clear
close all
load("resources/Brain.mat"); % loads data 
% T1 brought into environment - contains all our slices
% Index T1 using T1(:,:,i) to get each slice, where i is the index (1-10)
% label contains the data pre-segmented
% index label similarly to T1

WAIT_TIME = 1;

%% Task 1
%%% Develop and apply different segmentation algorithms, based on any
%%% technique you have learnt to each slice of the MRI data
%%% You need to apply exactly the same algorithm to every slice
%%% HINT: This will more than likely be a combination of different techniques
%%% Note: we want 5 tissue layers (6 layers total inc. air aka our
%%% background)

% threshold_slices = segment_slices(T1, @wthreshold, WAIT_TIME); % apply Otsu's thresholding (note @ needed to pass functions)
snake_slices = segment_slices(T1, @wsnakes, WAIT_TIME); % apply active contours
% watershed_slices = segment_slices(T1, @wwatershed); % apply active contours
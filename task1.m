%%% Task 1 %%%
%%% Develop and apply different segmentation algorithms, based on any
%%% technique you have learnt to each slice of the MRI data
%%% You need to apply exactly the same algorithm to every slice
%%% HINT: This will more than likely be a combination of different techniques
%%% Note: we want 5 tissue layers (6 layers total inc. air aka our
%%% background)

%% Initialisation
%%% Clear environment, close all existing figures, load data
%%% Also set default constants

clear
close("all");
slices = load("resources/Brain.mat"); % loads data 
% T1 brought into environment - contains all our slices
% Index T1 using T1(:,:,i) to get each slice, where i is the index (1-10)
% label contains the data pre-segmented
% index label similarly to T1

WAIT_TIME = 0;
REGION_NO = 5;

%% Calling Segmentation Algorithms
%%% Using *region-based* segmentation functionality only
%%% Boundary-based would just give a border, but not our specified and overlapping regions
%%% Selected: Otsu's multi-level thresholding, K-means clustering

threshold_slices = segment_slices(slices.T1, @wthreshold, REGION_NO, WAIT_TIME); % apply Otsu's thresholding (note @ needed to pass functions)
kmeans_slices = segment_slices(slices.T1, @wkmeansclustering, REGION_NO, WAIT_TIME); % apply Otsu's thresholding (note @ needed to pass functions)
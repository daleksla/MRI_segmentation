%%% Task 3 %%%
%%% Think about and implement a 3D image segmentation algorithm that can be applied to all slices, simultaneously.
%%% Discuss why the use of the proposed algorithm is better/worse than
%%% those in Task 1 (by utilising the same evaluation metric applied in Task 2)

%% Initialisation
%%% Check that task2.m was run (or rather, that we have it's outputs)
%%% Then load slices - we want label AND t1 this time

if ~exist('threshold_score','var') || ~exist('kmeans_score', 'var') % we need evaluation results
    quit(1, "Performance of segmentation algorithms slices not available for comparison")
end

slices = load("resources/Brain.mat"); % load slices

%% Calling 3D-Segmentation Algorithm
%%% We use the thresholding & K-means clustering technique (again)
%%% This time, we create the regions / segments for our single 3D MRI

threshold3d_slice = wthreshold(slices.T1, REGION_NO);
kmeans3d_slice = wkmeansclustering(slices.T1, REGION_NO);

%% Calling evaluation algorithm
%%% We use the same metric - sensitivity and specificity - to generate an
%%% evaluation metric for our segmentation results on the 3d image,
%%% compared to the pre-segmentation results
%%% Finally, we can compare the results to the performance of our previous
%%% algorithms

threshold3d_slice = categorical(threshold3d_slice, 0:REGION_NO); % make categorical
kmeans3d_slice = categorical(kmeans3d_slice, 0:REGION_NO);

[threshold3d_sensitivity, threshold3d_specificity, threshold3d_score] = group_performance(threshold3d_slice, c_label);
[kmeans3d_sensitivity, kmeans3d_specificity, kmeans3d_score] = group_performance(kmeans3d_slice, c_label);

fprintf("Average 3D threshold sensitivity: %f, 3D threshold specificity: %f\n", threshold3d_sensitivity, threshold3d_specificity);
fprintf("Average 3D k-means sensitivity: %f, 3D k-means specificity: %f\n", kmeans3d_sensitivity, kmeans3d_specificity);
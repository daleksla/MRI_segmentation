%%% Task 3 %%%
%%% Think about and implement a 3D image segmentation algorithm that can be applied to all slices, simultaneously.
%%% Discuss why the use of the proposed algorithm is better/worse than
%%% those in Task 1 (by utilising the same evaluation metric applied in Task 2)

%% Initialisation
%%% Check that task2.m was run (or rather, that we have it's outputs)
%%% Then load slices - we want label AND t1 this time

if ~exist('threshold_performance','var') || ~exist('kmeans_performance', 'var') % we need evaluation results
    quit(1, "Performance of segmentation algorithms slices not available for comparison")
end

slices = load("resources/Brain.mat"); % load slices

%% Apply image registration algorithm
%%% We use ??? as our technique to create a 3d atlas of raw slices & pre-segmented regions
%%% We need our raw segmented slices to be stitched so we can segment them
%%% with possible new outlooks, and the pre-segmented slices for later
%%% comparison

...

%% Calling 3D-Segmentation Algorithm
%%% We use the ??? technique to create regions / segment our single 3D MRI

%% Calling evaluation algorithm
%%% We use the same metric - sensitivity and specificity - to generate an
%%% evaluation metric for our segmentation results on the 3d image,
%%% compared to the pre-segmentation results
%%% Finally, we can compare the results to the performance of our previous
%%% algorithms

...

function [average_metric] = evaluate_performance(segmented_slice, truth_slice)
%EVALUATE_PERFORMANCE Meta function to create confusion matrix between
%ground truth and algorithm x's segmentation result. We then extract and
%average the sensitivity and specificity values
    ...
end

%%% Task 2 %%%
%%% Compare your segmented results for each algorithm to the ground-truth label provided
%%% Justify and explain the metric used to assess accuracy
%%% Based on your evaluation and results, highlight the best algorithm to be used

%% Initialisation
%%% Check that task1.m was run (or rather, that we have it's outputs)
%%% Then load slices - we want label this time

if ~exist('threshold_slices','var') || ~exist('kmeans_slices', 'var') % we need segmented slices
    quit(1, "Segmented slices not available for analysis")
end

slices = load("resources/Brain.mat"); % load slices

%% Calling evaluation algorithm
%%% Using sensitivity & sensitivity as our metric

threshold_performance = evaluate_performance(threshold_slices, label);
kmeans_performance = evaluate_performance(kmeans_slices, label);

function [average_metric] = evaluate_performance(segmented_slice, truth_slice)
%EVALUATE_PERFORMANCE Meta function to create confusion matrix between
%ground truth and algorithm x's segmentation result. We then extract and
%average the sensitivity and specificity values
    ...
end
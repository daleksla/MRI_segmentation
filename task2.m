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

if ~iscategorical(threshold_slices)
    threshold_slices = categorical(threshold_slices, 0:REGION_NO); % convert to categorical type - needed format as single is not acceptable
end

if ~iscategorical(kmeans_slices)
    kmeans_slices = categorical(kmeans_slices, 0:REGION_NO);
end

c_label = categorical(slices.label, 0:REGION_NO); % also make ground truth values categorical (interpretted as mat of 2d mat of singles otherwise)

%% Calling evaluation algorithm
%%% Using sensitivity & sensitivity as our metric

[threshold_sensitivity, threshold_specificity, threshold_score] = group_performance(threshold_slices, c_label);
[kmeans_sensitivity, kmeans_specificity, kmeans_score] = group_performance(kmeans_slices, c_label);

fprintf("Average threshold sensitivity: %f, threshold specificity: %f\n", threshold_sensitivity, threshold_specificity);
fprintf("Average k-means sensitivity: %f, k-means specificity: %f\n", kmeans_sensitivity, kmeans_specificity);
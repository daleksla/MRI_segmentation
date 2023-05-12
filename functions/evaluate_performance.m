function [sensitivity, specificity] = evaluate_performance(segmented_slice, truth_slice)
%EVALUATE_PERFORMANCE Function to return average sensitivity and specificity metrics
% Function creates a confusion matrix between ground truth and algorithm x's segmentation result
% We then extract and average the sensitivity and specificity values
%
% segmented_slice - image we wish to evaluate correctness of
% truth_slice - image to be used as absolute truth
% sensitivity - calculated sensitivity metric
% specificity - calculated specificity metric
%
    conf_mat = segmentationConfusionMatrix(segmented_slice, truth_slice);
    
    true_positives = zeros(5, 1); % correctly identifying present
    false_positives = zeros(5, 1); % falsely identifying present (is absent)
    false_negatives = zeros(5, 1); % falsely identifying absent (is present)
    true_negatives = zeros(5, 1); % correctly identifying absent

    for i = 1:5 % iterate through each class, to calculate metrics per class 
        true_positives(i) = conf_mat(i, i); % count true positives for class i
        false_positives(i) = sum(conf_mat(:, i)) - true_positives(i); % count false positives for class i
        false_negatives(i) = sum(conf_mat(i, :)) - true_positives(i); % count false negatives for class i
        true_negatives(i) = sum(conf_mat(:)) - true_positives(i) - false_positives(i) - false_negatives(i); % count true negatives for class i
    end
    
    sensitivity = sum(true_positives) / (sum(true_positives) + sum(false_negatives));
    specificity = sum(true_negatives) / (sum(true_negatives) + sum(false_positives));
end
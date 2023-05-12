function [average_sensitivity, average_specificity, score_table] = group_performance(test_slices, truth_slices)
%GROUP_PERFORMANCE Function to return average sensitivity and specificity
%metrics
% Function calculates, for all relevant slices, each's sensitivity and
% specificity
% We then extract and average the sensitivity and specificity values
%
% test_slice - image we wish to evaluate correctness of
% truth_slice - image to be used as absolute truth
% average_sensitivity - calculated sensitivity metric
% average_specificity - calculated specificity metric
% score_table - table containing, with entry for each relevant slice block's, evaluation scores 
%
    slice_count = size(truth_slices, 3);

    slice_names = 1:slice_count+1; % last one is avg
    sensitivity_ress = zeros(1, slice_count + 1);
    specificity_ress = zeros(1, slice_count + 1);

    for i = 1:slice_count
        [sensitivity, specificity] = evaluate_performance(...
            test_slices(:, :, i), truth_slices(:, :, i)...
        );

        sensitivity_ress(i) = sensitivity;
        specificity_ress(i) = specificity;
    end

    average_sensitivity = mean(sensitivity_ress(1:slice_count));
    sensitivity_ress(slice_count + 1) = average_sensitivity;

    average_specificity = mean(specificity_ress(1:slice_count));
    specificity_ress(slice_count + 1) = average_specificity;

    score_table = table(slice_names, sensitivity_ress, specificity_ress);
end
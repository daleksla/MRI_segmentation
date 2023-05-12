function [average_sensitivity, average_specificity, score_table] = group_performance(test_slices, truth_slices)
%     if ~islogical(test_slices(:, :, 1))
%         fprintf("Test slices bad format\n");
%         return;
%     elseif ~islogical(truth_slices(:, :, 1))
%         fprintf("Truth slices bad format\n");
%         return;
%     end

    slice_count = size(truth_slices, 3);

    slice_names = 1:slice_count+1; % last one is avg
    sensitivity_ress = zeros(1, slice_count + 1);
    specificity_ress = zeros(1, slice_count + 1);

    for i = 1:slice_count
%         fprintf("Loop %d, ", i);
        [sensitivity, specificity] = evaluate_performance(...
            test_slices(:, :, i), truth_slices(:, :, i)...
        );

        sensitivity_ress(i) = sensitivity;
        specificity_ress(i) = specificity;
    end
%     fprintf("\n");

    average_sensitivity = mean(sensitivity_ress(1:slice_count));
    sensitivity_ress(slice_count + 1) = average_sensitivity;

    average_specificity = mean(specificity_ress(1:slice_count));
    specificity_ress(slice_count + 1) = average_specificity;

    score_table = table(slice_names, sensitivity_ress, specificity_ress);
end
function [modified_slices] = segment_slices(original_slices, segmentation_algorithm, wait_time)
%SEGMENT_SLICES Meta function to apply, display and return segmentated slices as a result of a supplied algorithm
    if ~exist('wait_time','var')
        wait_time = 0;
    end

    modified_slices = original_slices; % We create copies of the slices, so that we can modify each and cmp later
    for i = 1:size(modified_slices, 3) % loop over all slices (image is 2d, so 1D mat of mat is 3d)
        modified_slices(:, :, i) = segmentation_algorithm(modified_slices(:, :, i)); % overwrite old slice with result of segmentation
        img = show_image(modified_slices(:, :, i), sprintf("Slice #%d",  i));
        pause(wait_time);
        close(img);
    end
end
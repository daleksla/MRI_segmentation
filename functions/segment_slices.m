function [modified_slices] = segment_slices(original_slices, segmentation_algorithm, region_no, wait_time)
%SEGMENT_SLICES Meta function to apply, display and return segmentated slices as a result of a supplied algorithm
%
% original_slices - array of unsegmented slice(s)
% segmentation_algorithm - function pointer to segmentation algorithm.
%   Should take in 1 matrix, return 1 of the equal dimensions
% region_no - number of distinct foreground regions that we desire
% wait_time - constant as to whether it should display images or not
%   To not display images, set wait_time to 0 or don't supply argument
% modified_slices - array of segmented slices, of same length as the
%   original slices arg
%
    if ~exist('wait_time','var')
        wait_time = 0;
    end

    modified_slices = original_slices; % We create copies of the slices, so that we can modify each and cmp later
    for i = 1:size(modified_slices, 3) % loop over all slices (image is 2d, so 1D mat of mat is 3d)
        modified_slices(:, :, i) = segmentation_algorithm(modified_slices(:, :, i), region_no); % overwrite old slice with result of segmentation
        img = show_image(modified_slices(:, :, i), sprintf("Slice #%d",  i));
        pause(wait_time);
        close(img);
    end
end
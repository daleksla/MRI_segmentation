%% Initialisation

clear
close all
load("resources/Brain.mat"); % loads data 
% T1 brought into environment - contains all our slices
% Index T1 using T1(:,:,i) to get each slice, where i is the index (1-10)
% label contains the data pre-segmented
% index label similarly to T1

WAIT_TIME = 1;

%% Calling Segmentation Algorithms
%%% Develop and apply different segmentation algorithms, based on any
%%% technique you have learnt to each slice of the MRI data
%%% You need to apply exactly the same algorithm to every slice
%%% HINT: This will more than likely be a combination of different techniques
%%% Note: we want 5 tissue layers (6 layers total inc. air aka our
%%% background)

% threshold_slices = segment_2d_slices(T1, @wthreshold, WAIT_TIME); % apply Otsu's thresholding (note @ needed to pass functions)

function [modified_slices] = segment_2d_slices(original_slices, segmentation_algorithm, wait_time)
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
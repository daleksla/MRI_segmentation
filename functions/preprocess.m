function [slice] = preprocess(slice)
%PREPROCESS Preprocesses provided image slice, mainly to get rid of noise
%
% slice - image to preprocess for optimal performance for segmentation algorithms
%
    %% Perform Morphological Operations
    %%% This will eliminate noise by removing small objects and noise,
    %%% but later restoring the shape
    se = strel('disk', 5); % Define the structuring element
    slice = imerode(slice, se); % perform erosion to remove small objects and noise
    slice = imdilate(slice, se); % perform dilation to restore the shape and size of the objects
end


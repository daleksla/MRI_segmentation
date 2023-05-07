function [slice] = preprocess(slice)
%PREPROCESS Preprocesses provided image slice, mainly to get rid of noise
%     %% Perform Morphological Operations
%     %%% This will eliminate noise
%     %%% I've commented out this code because it just made everything way
%     too blurry
%      se = strel('disk', 5); % Define the structuring element
%      slice = imerode(slice, se); % perform erosion to remove small objects and noise
%      slice = imdilate(slice, se); % perform dilation to restore the shape and size of the objects
end


function [slice] = wthreshold(slice, region_no)
%WTHRESHOLD Applies the thresholding technique to segment a given slice
%
% slice - Image to apply Otsu Variance Thresholding upon
% region_no - number of regions to a) calculate thresholds for, b) images
%   to combine regions of
%
    slice = preprocess(slice);
    threshs = multithresh(slice, region_no); % multilevel image thresholds using (automatic) Otsu's method
                                             % we ask for 5 thresholds, to get us
                                             % five distinct regions (excluding bg)
    slice = imquantize(slice, threshs, 0:region_no); % we provide 5 thresholds & the slice to a function to organise based on pixel intensity
end
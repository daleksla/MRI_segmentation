function [slice] = wthreshold(slice)
%WTHRESHOLD Applies the thresholding technique to segment a given slice
    REGION_NO = 5;
    threshs = multithresh(slice, REGION_NO); % multilevel image thresholds using (automatic) Otsu's method
                                             % we ask for 5 thresholds, to get us
                                             % five distinct regions (excluding bg)
    slice = imquantize(slice, threshs); % we provide 5 thresholds & the slice to a function to organise based on pixel intensity
end
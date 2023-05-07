function [slice] = wwatershed(slice)
%WWATERSHED Applies the watershed technique to segment a given slice
    cleaned_slice = preprocess(slice);
    grad_slice = imgradient(cleaned_slice);
    slice = watershed(grad_slice);
end
function [slice] = wkmeansclustering(slice)
%WKMEANSCLUSTERING Applies k-means clustering, where k = 5
    slice = imsegkmeans(slice, 5);
end
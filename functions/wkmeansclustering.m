function [slice] = wkmeansclustering(slice, region_no)
%WKMEANSCLUSTERING Applies k-means clustering
%
% slice - image to apply k-means clustering upon
% region_no - numbers of clusters we wish (i.e. k)
%
    slice = preprocess(slice);
    if size(slice, 3) > 1 % if 3D (viable 3rd dimension)
        tmp = imsegkmeans3(slice, region_no, NumAttempts=100, MaxIterations=200, NormalizeInput=true);
        for i = 1:size(tmp, 1) % make labels 0->5, rather than 1->6
            for j = 1:size(tmp, 2)
                for k = 1:size(tmp, 3)
                    tmp(i, j, k) = tmp(i, j, k) - 1;
                end
            end
        end
        slice = tmp;
    else % if 2D
        tmp = imsegkmeans(slice, region_no);
        for i = 1:size(tmp, 1) % make labels 0->5, rather than 1->6
            for j = 1:size(tmp, 2)
                tmp(i, j) = tmp(i, j) - 1;
            end
        end
        slice = tmp;
    end
end
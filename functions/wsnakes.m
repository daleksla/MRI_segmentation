function [slice] = wsnakes(slice)
%WSNAKES Applies the active contour / snakes technique to segment a given slice
    s = load("resources/snakes_masks/air.mat");
    mask = s.ans2;
    slice = activecontour(slice, mask, 20000); 
end
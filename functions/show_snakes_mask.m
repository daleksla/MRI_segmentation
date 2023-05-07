function show_snakes_mask(slice, mask)
%SHOW_SNAKES_MASK Applies ROI mask to slice for visualisation
    hd = show_image(slice);
    hold on;
    visboundaries(mask, 'Color', 'b');
    pause();
    hold off;
    close(hd);
end


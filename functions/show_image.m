function [fig] = show_image(img, fig_name)
% SHOW_IMAGE Image
     if ~exist('fig_name','var')
         % third parameter does not exist, so default it to something
          fig_name = "";
     end

    fig = figure('Name', fig_name); % creates a new Figure window
    colormap(gray);
    imagesc(img);
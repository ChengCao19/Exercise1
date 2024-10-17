function cmap = ColorMap()
% Define the colormap used by fresh cotton leaf dataset.
 
cmap = [
     000 000 000 % Back
     255 000 000 % leaf
     
        ];
 
% Normalize between [0 1].
cmap = cmap ./ 255;
end
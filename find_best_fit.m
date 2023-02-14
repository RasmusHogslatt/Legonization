function index = find_best_fit(subimage, cielab_colors)
% Checks mean CIELAB color of subimage and finds best fit in a list of 
% given CIELAB colors.
% subimage is in RGB.

img_mean = mean_color(rgb2lab(subimage,'ColorSpace','srgb','WhitePoint','d65'));
index = 1;
residual = realmax;
for i=1:size(cielab_colors, 2)
    temp = compare_lab(img_mean, cielab_colors{i});
    if temp < residual
        residual = temp;
        index = i;
    end
end
end
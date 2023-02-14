function output = mean_color(img)
% Returns mean rgb values of an image or subimage.
output = [mean2(img(:,:,1)) mean2(img(:,:,2)) mean2(img(:,:,3))];
end
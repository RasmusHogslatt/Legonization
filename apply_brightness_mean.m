function final_image = apply_brightness_mean(reference_image, reproduced_image, factor)
% reference image is RGB of original image
% reproduced image is RGB of reproduced image
% factor is scaling factor between [0, 1]

final_image = reproduced_image;
lab_final_image = rgb2lab(reproduced_image,"ColorSpace","srgb","WhitePoint","d65");
lab_ref_img = rgb2lab(reference_image,"ColorSpace","srgb","WhitePoint","d65");
mean_lab_value = mean(mean(lab_ref_img(:,:,1))) / 100;
for i=1:size(reproduced_image, 2)
    for j=1:size(reproduced_image, 1)
        l_value = lab_final_image(j,i,1) / 100;

        brightness = (l_value - mean_lab_value);
        final_image(j, i, :) = brighten(final_image(j, i, :), brightness*factor);
    end
end

end
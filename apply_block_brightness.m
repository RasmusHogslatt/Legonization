function final_image = apply_block_brightness(reference_image, reproduced_image, factor, block_size)
% reference image is RGB of original image
% reproduced image is RGB of reproduced image
% factor is scaling factor between [0, 1]

final_image = reproduced_image;
lab_final_image = rgb2lab(reproduced_image,"ColorSpace","srgb","WhitePoint","d65");
lab_ref_img = rgb2lab(reference_image,"ColorSpace","srgb","WhitePoint","d65");
mean_lab_value = mean(mean(lab_ref_img(:,:,1))) / 100;

l_value = 0.5;
for i=1:block_size:size(reproduced_image, 2)-block_size
    for j=1:block_size:size(reproduced_image, 1) -block_size
        l_value = mean(mean(lab_final_image(j:j+block_size-1,i:i+block_size-1,1))) / 100;

        brightness = (l_value - mean_lab_value);
        final_image(j:j+block_size-1, i:i+block_size-1, :) = brighten(final_image(j:j+block_size-1, i:i+block_size-1, :), brightness*factor);
    end
end

end
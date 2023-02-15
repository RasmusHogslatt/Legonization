function [delta_mean, delta_max] = compute_deltaE(original_lab, reproduced_lab)

delta = deltaE(original_lab(1:size(reproduced_lab,1), 1:size(reproduced_lab,2), :), reproduced_lab, "isInputLab", true);
delta_mean = mean(mean(delta));
delta_max = max(max(delta));

end
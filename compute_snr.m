function snr = compute_snr(original, reproduction)
% Computes SNR
% Original is original image
% Reproduction is the reproduced image

noise = original(1:size(reproduction, 1), 1:size(reproduction,2)) - reproduction;
snr=10*log10(sum(original(:).^2)/sum(noise(:).^2));

end
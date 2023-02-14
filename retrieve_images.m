function output = retrieve_images(folder)
% Retrieves PNG images in folder as a cell array.
output = {};
original_files=dir([folder '/*.png']); 
for k=1:length(original_files)
    filename=[folder '/' original_files(k).name];
    output{k} = im2double(imread(filename));
end
end
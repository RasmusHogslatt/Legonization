function rgb_out = create_4x2_block(blocks, colors, size)
% size: pixels of element (size x size) pixels
bright = 0.5;
dark = -0.5;
%new_blocks = cell(length(blocks, 1));
%temp = zeros(size*2, size, 3);
for i=1:length(blocks)
    current_rgb = hex2rgb(colors{i, 1});
    
    temp = [cell2mat(blocks{i}); cell2mat(blocks{i})];

    temp(2*size-3:2*size+3,:, 1) = current_rgb(1);
    temp(2*size-3:2*size+3,:, 2) = current_rgb(2);
    temp(2*size-3:2*size+3,:, 3) = current_rgb(3);

    temp(2*size-3:2*size+3,1:2, :) = brighten(temp(2*size-3:2*size+3,1:2, :), bright);
    temp(2*size-3:2*size+3,2*size-1:2*size, :) = brighten(temp(2*size-3:2*size+3,2*size-1:2*size, :), dark);
    
    new_blocks{i,1 } = {temp};
end
rgb_out = new_blocks;
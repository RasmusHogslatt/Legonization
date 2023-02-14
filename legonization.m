function [output, color_placement] = legonization(blocks, ref, block_size, cielab_colors)

rows = floor(size(ref, 1) / block_size) * block_size;
cols = floor(size(ref, 2) / block_size) * block_size;

output = zeros(rows, cols, 3);
color_placement = zeros(rows, cols, 1);

% 1x1
row = 1;
col = 1;
while col < cols
    while row < rows
        temp = ref(row:row+block_size-1, col:col+block_size-1, :);
        best_1x1_index = find_best_fit(temp, cielab_colors);
        output(row:row+block_size-1, col:col+block_size-1, :) = blocks{1, best_1x1_index};
        color_placement(row:row+block_size-1, col:col+block_size-1, :) = best_1x1_index;
        row = row + block_size;
    end
    row = 1;
    col = col + block_size;
end
[output, color_placement] = fit_larger_blocks(blocks, color_placement, block_size, output, rows, cols, 5, [2 4]);
[output, color_placement] = fit_larger_blocks(blocks, color_placement, block_size, output, rows, cols, 6, [4 2]);
[output, color_placement] = fit_larger_blocks(blocks, color_placement, block_size, output, rows, cols, 4, [2 2]);
[output, color_placement] = fit_larger_blocks(blocks, color_placement, block_size, output, rows, cols, 2, [1 2]);
[output, color_placement] = fit_larger_blocks(blocks, color_placement, block_size, output, rows, cols, 3, [2 1]);
end
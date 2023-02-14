function [output, placement] = fit_larger_blocks(blocks, color_placement,block_size, image, rows, cols, type_index, offset)
output = image;
placement = color_placement;
col = 1;
row = 1;
while col < cols-(offset(2)-1)*block_size
    while row < rows-(offset(1)-1)*block_size
        submatrix = placement(row:row+offset(1)*block_size-1, col:col+offset(2)*block_size-1);
        if numel(unique(submatrix))==1
            output(row:row+offset(1)*block_size-1, col:col+offset(2)*block_size-1, :) = blocks{type_index, submatrix(1,1)};
            %placement(2,2) = -1;
            %placement(offset(1)*block_size)
            for i=1:offset(2)
                for j=1:offset(1)
                    submatrix(j*block_size-2, i*block_size-2) = -1;
                end
            end
            placement(row:row+offset(1)*block_size-1, col:col+offset(2)*block_size-1) = submatrix;
            row = row + offset(1)*block_size;
        else
            row = row + block_size;
        end
    end
    row = 1;
    col = col + offset(2)*block_size;
end

end
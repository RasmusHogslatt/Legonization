function hex_colors = random_hex_colors(n)
% Generates a cell array of hex colors

hex_colors = cell(n, 1);

for i=1:n
    hex_colors{i} = dec2hex(randi([0 255], 1, 3), 2)';
end
hex_colors = hex_colors';
end
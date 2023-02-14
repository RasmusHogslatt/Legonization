function export_elements_as_PNG(elements, type)
% Export to png in range [0,1]

mkdir('images', type);
for i=1:length(elements)
    imwrite(cell2mat(elements{i,1}), append('images/', type, '/', num2str(i), '.png'), 'png');
end
end
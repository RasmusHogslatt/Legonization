function result = compare_lab(lab1, lab2)
% Compares two CIELAB values with euclidean distance

result = norm(lab2-lab1);
end
function rgb_out = create_1x1_block(colors, size)
% size: pixels of element (size x size) pixels

rgb_elements = cell(length(colors), 1);

p_center = size/2; % Center of piece

bright = 0.5;
dark = -0.5;
bright_plupp = 0.3;
dark_plupp = -0.4;


radius = size*(3/4.8)/2;
theta_bright = linspace(-pi, -pi/2, round(4 * pi * radius));
theta_dark = linspace(0, pi/2, round(4 * pi * radius));

x_bright = radius*cos(theta_bright)+p_center;
y_bright = radius*sin(theta_bright)+p_center;
x_dark = radius*cos(theta_dark)+p_center;
y_dark = radius*sin(theta_dark)+p_center;

for i=1:length(colors)
    temp = zeros(size, size, 3);

    rgb_color = hex2rgb(colors(i, 1));

    % Assign full element a main color
    temp(:,:,1) = rgb_color(1);
    temp(:,:,2) = rgb_color(2);
    temp(:,:,3) = rgb_color(3);

    % Construct border
    border_size = 2;
    for j=1:border_size
        temp(j,:,:) = brighten(temp(j,:,:), bright);
        temp(:,j,:) = brighten(temp(:,j,:), bright);
        temp(size-j+1,:,:) = brighten(temp(size-j+1,:,:), dark);
        temp(:,size-j+1,:) = brighten(temp(:,size-j+1,:), dark);
    end

    for j=1:length(x_bright)
        row_bright = round(y_bright(j));
        col_bright = round(x_bright(j));
        row_dark = round(y_dark(j));
        col_dark = round(x_dark(j));

        temp(row_bright, col_bright, :) = brighten(temp(row_bright,col_bright,:), bright_plupp);
        temp(row_dark, col_dark, :) = brighten(temp(row_dark,col_dark,:), dark_plupp);
    end
    rgb_elements{i} = {temp};
    
end
rgb_out = rgb_elements;
end
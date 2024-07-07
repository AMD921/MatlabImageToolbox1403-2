%transformImage(image1)
function transformedImage = transformImage(image)
    % Get the size of the image
    [rows, cols, channels] = size(image);

    % Calculate the midpoint
    midRow = floor(rows / 2);
    midCol = floor(cols / 2);

    % Split the image into four quadrants, handling even and odd dimensions
    topLeft = image(1:midRow, 1:midCol, :);
    topRight = image(1:midRow, midCol+1:end, :);
    bottomLeft = image(midRow+1:end, 1:midCol, :);
    bottomRight = image(midRow+1:end, midCol+1:end, :);

    % Create the transformed image
    transformedImage = zeros(rows, cols, channels, 'like', image);
    
    % Handle even and odd dimensions separately
    if mod(rows, 2) == 0 && mod(cols, 2) == 0
        % Both dimensions are even
        transformedImage(1:midRow, 1:midCol, :) = bottomRight;
        transformedImage(1:midRow, midCol+1:end, :) = bottomLeft;
        transformedImage(midRow+1:end, 1:midCol, :) = topRight;
        transformedImage(midRow+1:end, midCol+1:end, :) = topLeft;
    else
        % At least one dimension is odd
        if mod(rows, 2) ~= 0
            % If rows are odd, include the middle row in the top quadrants
            midRow = midRow + 1;
        end
        if mod(cols, 2) ~= 0
            %If columns are odd, include the middle column in the left quadrants
            midCol = midCol + 1;
        end
        
        transformedImage(1:midRow, 1:midCol, :) = bottomRight(1:midRow, 1:midCol, :);
        transformedImage(1:midRow, midCol+1:end, :) = bottomLeft(1:midRow, 1:cols-midCol, :);
        transformedImage(midRow+1:end, 1:midCol, :) = topRight(1:rows-midRow, 1:midCol, :);
        transformedImage(midRow+1:end, midCol+1:end, :) = topLeft(1:rows-midRow, 1:cols-midCol, :);
    end

    % Display the original and transformed images
    figure;
    subplot(1, 2, 1);
    imshow(image);
    title('Original Image');
    
    subplot(1, 2, 2);
    imshow(transformedImage);
    title('Transformed Image');
end

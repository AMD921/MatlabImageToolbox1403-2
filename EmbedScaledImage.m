%finalImage = EmbedScaledImage(image1, 50)
function finalImage = EmbedScaledImage(img, s)
    % Validate the scalar value
    if s < 1 || s > 100
        error('The scalar value must be between 1 and 100.');
    end
    
    % Display the original size of the image
    disp(['Original size of the image: ' num2str(size(img))]);
    
    % Calculate the scaling factor
    scaleFactor = s / 100;
    
    % Compute the new dimensions for the scaled image
    newSize = round(size(img) * scaleFactor);
    
    % Resize the image
    scaledImg = imresize(img, newSize(1:2));
    
    % Display the new size of the scaled image
    disp(['New size of the scaled image: ' num2str(size(scaledImg))]);
    
    % Determine where to place the scaled image on the original image
    [rows, cols, ~] = size(img);
    [rowsScaled, colsScaled, ~] = size(scaledImg);
    
    % Calculate the position to place the scaled image (centered)
    startRow = floor((rows - rowsScaled) / 2) + 1;
    startCol = floor((cols - colsScaled) / 2) + 1;
    
    % Create a copy of the original image to embed the scaled image into
    finalImage = img;
    
    % Embed the scaled image into the original image
    finalImage(startRow:startRow+rowsScaled-1, startCol:startCol+colsScaled-1, :) = scaledImg;
    
    % Plot the original and final images
    figure;
    subplot(1, 2, 1); imshow(img); title('Original Image');
    subplot(1, 2, 2); imshow(finalImage); title(['Final Image with Embedded Scaled Image (' num2str(s) '%)']);
end

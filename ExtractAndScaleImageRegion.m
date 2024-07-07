%function finalImage = ExtractAndScaleImageRegion(image1, 50, 25, 50, 25)
function finalImage = ExtractAndScaleImageRegion(originalImage, x, y, w, u)
    % Validate inputs
    if nargin ~= 5
        error('You must provide exactly five input arguments.');
    end
    
    % Check if coordinates are within image bounds
    [rows, cols, ~] = size(originalImage);
    if x < 1 || x > cols || y < 1 || y > rows || w < 1 || u < 1 || x + w - 1 > cols || y + u - 1 > rows
        error('Invalid coordinates or dimensions. They must be within image bounds.');
    end
    
    % Display original image size (optional)
    disp(['Original image size: ' num2str(size(originalImage))]);
    
    % Extract the region of interest from the original image
    croppedImage = originalImage(y:y+u-1, x:x+w-1, :);
    
    % Scale the original image to fit within dimensions (w, u)
    scaledImage = imresize(originalImage, [u, w]);
    
    % Create a blank canvas to embed the scaled image
    finalImage = zeros(u, w, size(originalImage, 3), 'like', originalImage);
    
    % Embed the scaled image into the blank canvas at position (x, y)
    finalImage(1:size(scaledImage, 1), 1:size(scaledImage, 2), :) = scaledImage;
    
    % Display images (optional)
    figure;
    subplot(1, 3, 1); imshow(originalImage); title('Original Image');
    subplot(1, 3, 2); imshow(croppedImage); title('Extracted Region');
    subplot(1, 3, 3); imshow(finalImage); title('Final Image with Scaled Region');
    
    % Optionally return the final image
    % finalImage = uint8(finalImage); % Convert to uint8 if necessary
end

%ScaleImage(image1, 22)
function scaledImage = ScaleImage(img, k)
    % Validate the scalar value
    if k < 1 || k > 100
        error('The scalar value must be between 1 and 100.');
    end
    
    % Display the original size of the image
    disp(['Original size of the image: ' num2str(size(img))]);
    
    % Calculate the scaling factor
    scaleFactor = k / 100;
    
    % Compute the new dimensions
    newSize = round(size(img) * scaleFactor);
    
    % Resize the image
    scaledImage = imresize(img, newSize(1:2));
    
    % Display the new size of the image
    disp(['New size of the image: ' num2str(size(scaledImage))]);
    
    % Plot the original and scaled images
    figure;
    subplot(1, 2, 1); imshow(img); title('Original Image');
    subplot(1, 2, 2); imshow(scaledImage); title(['Scaled Image (' num2str(k) '%)']);
end

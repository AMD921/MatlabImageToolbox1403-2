% rotatedImage = rotateImage(image1, 90)
function rotatedImage = rotateImage(inputImage, angle)
    % Validate inputs
    if nargin < 2
        error('Not enough input arguments. Please provide inputImage and angle.');
    end
    
    % Rotate the image
    rotatedImage = imrotate(inputImage, angle, 'bilinear', 'crop');
    
    % Display the rotated image (optional)
    figure;
    imshow(rotatedImage);
    title(sprintf('Rotated Image by %.1f degrees', angle));
end

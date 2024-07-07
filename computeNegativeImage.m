% negativeImage = computeNegativeImage(image1)
function negativeImage = computeNegativeImage(inputImage)
    % Validate input
    if ndims(inputImage) > 3 || ndims(inputImage) < 2
        error('Input must be a grayscale or RGB image.');
    end
    
    % Compute negative image
    if ndims(inputImage) == 3  % RGB image
        negativeImage = 255 - inputImage;
    else  % Grayscale image
        negativeImage = 255 - inputImage;
    end
    
    % Convert to uint8 if necessary
    if ~isa(negativeImage, 'uint8')
        negativeImage = uint8(negativeImage);
    end
    
    % Display the negative image (optional)
    figure;
    imshow(negativeImage);
    title('Negative Image');
end

% flippedImage = flipImage(image1, 'vertical')
function flippedImage = flipImage(inputImage, direction)
    % Validate inputs
    if nargin < 2
        direction = 'horizontal'; % Default direction
    end
    
    % Perform flipping
    switch lower(direction)
        case 'horizontal'
            flippedImage = flip(inputImage, 2);
        case 'vertical'
            flippedImage = flip(inputImage, 1);
        otherwise
            error('Direction must be ''horizontal'' or ''vertical''.');
    end
    
    % Display the flipped image (optional)
    figure;
    imshow(flippedImage);
    title(sprintf('Flipped Image (%s)', direction));
end

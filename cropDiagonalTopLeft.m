%croppedImage = cropDiagonalTopLeft(image1)
function croppedImage = cropDiagonalTopLeft(inputImage)
    % Validate input
    if nargin < 1
        error('Not enough input arguments. Please provide inputImage.');
    end
    
    % Get size of input image
    [rows, cols, channels] = size(inputImage);
    
    % Initialize cropped image matrix
    if channels == 1
        croppedImage = zeros(rows, cols, 'like', inputImage);
    else
        croppedImage = zeros(rows, cols, channels, 'like', inputImage);
    end
    
    % Perform diagonal cropping from top left
    for y = 1:rows
        for x = 1:cols
            if x <= y
                croppedImage(y, x, :) = inputImage(y, x, :);
            end
        end
    end
    
    % Convert cropped image to uint8 if necessary
    if ~isa(croppedImage, 'uint8')
        croppedImage = uint8(croppedImage);
    end
    
    % Display the cropped image (optional)
    figure;
    imshow(croppedImage);
    title('Diagonally Cropped Image (Top Left)');
end

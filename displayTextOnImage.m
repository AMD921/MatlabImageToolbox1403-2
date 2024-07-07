%outputImage = displayTextOnImage(image1, "I love Matlab <3", "2x")
function outputImage = displayTextOnImage(inputImage, textString, scale)
    % Validate inputs
    if nargin < 3
        error('Not enough input arguments. Please provide inputImage, textString, and scale.');
    end
    
    % Validate scale
    validScales = {'normal', '2x', '4x', '10x'};
    if ~any(strcmpi(scale, validScales))
        error('Invalid scale. Valid scales are: normal, 2x, 4x, 10x.');
    end
    
    % Create a copy of the input image
    outputImage = inputImage;
    
    % Determine text size based on scale
    switch lower(scale)
        case 'normal'
            textSize = 12;
        case '2x'
            textSize = 24;
        case '4x'
            textSize = 48;
        case '10x'
            textSize = 120;
    end
    
    % Get image size
    imageSize = size(inputImage);
    imageHeight = imageSize(1);
    imageWidth = imageSize(2);
    
    % Calculate text position at the center of the image
    textPosition = [imageWidth/2, imageHeight/2];
    
    % Insert text on the image
    outputImage = insertText(outputImage, textPosition, textString, ...
        'FontSize', textSize, 'TextColor', 'white', 'BoxColor', 'black', ...
        'BoxOpacity', 0.7, 'AnchorPoint', 'Center');
    
    % Display the output image (optional)
    figure;
    imshow(outputImage);
    title('Image with Text');
end

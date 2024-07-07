%outputImage = applyMathOperationToImage(image1, 'cos(x)', 'x', 26)
function outputImage = applyMathOperationToImage(inputImage, expression, axis, range)
    % Validate inputs
    if ~ischar(expression)
        error('Input expression must be a character string.');
    end
    
    % Evaluate the mathematical expression
    x = linspace(0, range * pi, size(inputImage, 2));
    y = linspace(0, range * pi, size(inputImage, 1));
    
    if strcmpi(axis, 'x')
        [X, Y] = meshgrid(x, y);
    elseif strcmpi(axis, 'y')
        [Y, X] = meshgrid(y, x); % Swap to match y as rows and x as columns
    else
        error('Axis must be either ''x'' or ''y''.');
    end
    
    % Evaluate the expression
    result = eval(expression);
    
    % Convert result to the same data type as inputImage
    result = cast(result, class(inputImage));
    
    % Apply the result as a coefficient to all elements of the input image
    outputImage = inputImage .* result;
    
    % Display the original and modified images (optional)
    figure;
    subplot(1, 2, 1); imshow(inputImage); title('Original Image');
    subplot(1, 2, 2); imshow(outputImage); title('Modified Image');
end

%shiftedImage = ShiftImage(image1, 50, 250)
function shiftedImage = ShiftImage(image, p, t)
    % Validate inputs
    if nargin ~= 3
        error('You must provide exactly three input arguments.');
    end
    
    % Perform circular shifts
    shiftedImage = circshift(image, [p, t]);
    
    % Display original and shifted images (optional)
    figure;
    subplot(1, 2, 1); imshow(image); title('Original Image');
    subplot(1, 2, 2); imshow(shiftedImage); title(['Shifted Image (p=' num2str(p) ', t=' num2str(t) ')']);
end

%plotHistogram(image1)
function plotImageHistogram(inputImage)
    % Check if inputImage is grayscale or RGB
    if ndims(inputImage) == 3
        % Convert RGB image to grayscale
        inputImage = rgb2gray(inputImage);
    end
    
    % Calculate histogram
    [counts, bins] = imhist(inputImage);
    
    % Plot histogram
    figure;
    bar(bins, counts, 'hist');
    title('Histogram of Input Image');
    xlabel('Pixel Intensity');
    ylabel('Frequency');
    
    % Display the input image
    figure;
    imshow(inputImage);
    title('Input Image');
end

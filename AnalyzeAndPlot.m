%AnalyzeAndPlot(image1)
function AnalyzeAndPlot(img)
    % Display image size
    disp(['Size of the image: ' num2str(size(img))]);
    
    % Check if image is color or grayscale
    if ndims(img) == 3
        % Image is color (RGB)
        disp('The image is a color image (RGB).');
        
        % Separate RGB channels
        R = img(:,:,1);
        G = img(:,:,2);
        B = img(:,:,3);
        
        % Create color images for each channel
        redImage = cat(3, R, zeros(size(R), 'like', R), zeros(size(R), 'like', R));
        greenImage = cat(3, zeros(size(G), 'like', G), G, zeros(size(G), 'like', G));
        blueImage = cat(3, zeros(size(B), 'like', B), zeros(size(B), 'like', B), B);
        
        % Plot RGB channels
        figure;
        subplot(1, 3, 1); imshow(redImage); title('Red Channel');
        subplot(1, 3, 2); imshow(greenImage); title('Green Channel');
        subplot(1, 3, 3); imshow(blueImage); title('Blue Channel');
        
        sgtitle('RGB Channels');
    else
        % Image is grayscale
        disp('The image is a grayscale image.');
        
        % Plot the grayscale image
        figure;
        imshow(img);
        title('Grayscale Image');
    end
end

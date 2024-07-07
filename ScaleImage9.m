% scaled_image = ScaleImage9(image1, 50)
function scaled_image = scaleImage9(image, scale)
    % Check if image is grayscale or color (RGB)
    if ndims(image) == 2
        % Grayscale image
        avg_value = mean(image(:));  % Calculate average pixel value
        scaled_avg = avg_value * scale;  % Scale the average
        
        % Scale the image
        scaled_image = image * (scaled_avg / avg_value);
        
    elseif ndims(image) == 3 && size(image, 3) == 3
        % Color image (assuming RGB format)
        avg_r = mean(mean(image(:,:,1)));  % Average red channel
        avg_g = mean(mean(image(:,:,2)));  % Average green channel
        avg_b = mean(mean(image(:,:,3)));  % Average blue channel
        
        % Scale the averages
        scaled_avg_r = avg_r * scale;
        scaled_avg_g = avg_g * scale;
        scaled_avg_b = avg_b * scale;
        
        % Create scaled image
        scaled_image = image;
        scaled_image(:,:,1) = image(:,:,1) * (scaled_avg_r / avg_r);
        scaled_image(:,:,2) = image(:,:,2) * (scaled_avg_g / avg_g);
        scaled_image(:,:,3) = image(:,:,3) * (scaled_avg_b / avg_b);
    else
        error('Unsupported image format. Please provide grayscale or RGB image.');
    end
    % Display original and scaled images
    figure;
    
    % Original image
    subplot(1, 2, 1);
    imshow(image);
    title('Original Image');
    
    % Scaled image
    subplot(1, 2, 2);
    imshow(scaled_image);
    title(['Scaled Image (scale = ' num2str(scale) ')']);
end

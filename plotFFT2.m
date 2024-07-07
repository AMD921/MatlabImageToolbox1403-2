% plotFFT2(image1, image2)
function plotFFT2(image1, image2)
    % Validate inputs
    if nargin ~= 2
        error('You must provide exactly two input images: image1 and image2.');
    end
    
    % Calculate FFT for image1
    fftImage1 = fft2(image1);
    fftShifted1 = fftshift(fftImage1);
    magnitude1 = abs(fftShifted1);
    phase1 = angle(fftShifted1);
    
    % Calculate FFT for image2
    fftImage2 = fft2(image2);
    fftShifted2 = fftshift(fftImage2);
    magnitude2 = abs(fftShifted2);
    phase2 = angle(fftShifted2);
    
    % Display original images
    figure;
    subplot(2, 4, 1); imshow(image1); title('Original Image 1');
    subplot(2, 4, 5); imshow(image2); title('Original Image 2');
    
    % Display FFT magnitude and phase for image1
    subplot(2, 4, 2); imagesc(log(1 + magnitude1)); colormap jet; colorbar;
    title('Magnitude Spectrum Image 1 (log scale)');
    subplot(2, 4, 3); imagesc(phase1); colormap jet; colorbar;
    title('Phase Spectrum Image 1');
    
    % Display FFT magnitude and phase for image2
    subplot(2, 4, 6); imagesc(log(1 + magnitude2)); colormap jet; colorbar;
    title('Magnitude Spectrum Image 2 (log scale)');
    subplot(2, 4, 7); imagesc(phase2); colormap jet; colorbar;
    title('Phase Spectrum Image 2');
    
    % Display reconstructed images (optional)
    reconstructedImage1 = ifft2(ifftshift(fftImage1));
    reconstructedImage2 = ifft2(ifftshift(fftImage2));
    subplot(2, 4, 4); imshow(uint8(abs(reconstructedImage1))); title('Reconstructed Image 1');
    subplot(2, 4, 8); imshow(uint8(abs(reconstructedImage2))); title('Reconstructed Image 2');
end

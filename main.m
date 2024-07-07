%[image1, image2] = main('4.jpg', '5.jpg')

function [aks1, aks2] = main(F, G)
    % Check number of input arguments
    if nargin ~= 2
        error('Not enough input arguments. Please provide exactly two image filenames.');
    end
    
    % Read images
    aks1 = imread(F);
    aks2 = imread(G);
    return
end

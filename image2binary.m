function [image_bits, image_original_dimensions] = image2binary(image_filename, resize_scale, bit_depth)
%% Convert image to grayscale 1D vector
image_gray = rgb2gray(imread(image_filename));
image_resized = imresize(image_gray, 1/resize_scale);
image_original_dimensions = size(image_resized);
image_1d = reshape(image_resized,1,[]);

%% Convert 1D vector of uint8s into bit_depth*pixels long vector of bits
stride = bit_depth;
MSB = 8 - bit_depth + 1;
image_bits = zeros(1,length(image_1d)*bit_depth); % Pre-allocate space
ii = 1;
for i = 1:length(image_1d)
    image_bits(ii:ii+(stride-1)) = bitget(image_1d(i),8:-1:MSB);
    ii = ii + stride;
end

end
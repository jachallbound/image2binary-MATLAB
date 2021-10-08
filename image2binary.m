function [image_bits, image_original_dimensions] = image2binary(image, resize_scale, bit_depth, NameValueArgs)
arguments
    image
    resize_scale = 1
    bit_depth = 8
    NameValueArgs.Image = true
end

%% Convert image to grayscale 1D vector
if NameValueArgs.Image
    image = rgb2gray(imread(image));
    image = imresize(image, 1/resize_scale);
else
    image = uint8(char(image));
    bit_depth = 8;
end
image_original_dimensions = size(image);
image_1d = reshape(image,1,[]);

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
clear; close all;
tic
%% Driver script to demonstrate usage of image2binary and binary2image
image_filename = "sherlock.jpg"; % Built-in MATLAB image of a golden retriever
resize_scale = 8; % lol
bit_depth = 2; % choose 1-8, color_depth = bit_depth^2
pad_flag = "one"; % fill 8-bit_depth bits with ones or zeros when converting back to uint8

[image_bits, image_original_dimensions] = ...
    image2binary(image_filename, resize_scale, bit_depth);
    
image_rebuilt = ...
    binary2image(image_bits, bit_depth, pad_flag, image_original_dimensions);

figure;
imshow(imresize(image_rebuilt,resize_scale));
% imshow(image_rebuilt);
toc
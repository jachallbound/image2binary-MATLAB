clear; close all;

%% Driver script to demonstrate usage of image2binary and binary2image
image_filename = "sherlock.jpg"; % Built-in MATLAB image of a golden retriever
resize_scale = 16; % lol
bit_depth = 8; % choose 1-8, color_depth = bit_depth^2

[image_resized, image_bits, image_original_dimensions] = ...
    image2binary(image_filename, resize_scale, bit_depth);
    
image_display = ...
    binary2image(image_bits, resize_scale, bit_depth, image_original_dimensions);

figure;
imshow(imresize(image_resized,resize_scale));

figure;
imshow(image_display);
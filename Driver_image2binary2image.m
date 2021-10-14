clear; close all;
tic
%% Driver script to demonstrate usage of image2binary and binary2image
image_filename = "sherlock.jpg"; % Built-in MATLAB image of a golden retriever
resize_scale = 8; % lol
bit_depth = 8; % choose 1-8, color_depth = bit_depth^2
pad_flag = "one"; % fill 8-bit_depth bits with ones or zeros when converting back to uint8

[image_bits, image_original_dimensions] = ...
    image2binary(image_filename, resize_scale, bit_depth);
    
image_rebuilt = ...
    binary2image(image_bits, image_original_dimensions, bit_depth, pad_flag);

figure;
imshow(imresize(image_rebuilt,resize_scale));

toc


%% Also works for converting a byte to binary array
% just set NameValueArg "Image" to false
message = "Hello";
[byte_bits, byte_array_length] = ...
    image2binary(message, "Image", false);

% Then convert back to bytes
message_bytes = binary2image(byte_bits, byte_array_length);

disp("message_bytes: "+string(char(message_bytes)))

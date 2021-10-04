function image_display = binary2image(image_bits, resize_scale, bit_depth, image_original_dimensions)

%% Convert bit vector to uints
% convert int to string, string to char, then remove extra dimension
image_bits_string = squeeze(char(string(image_bits)));
% char vector in to rows of 8, to be converted to decimal
image_bits_string_reshaped = reshape(image_bits_string,8,[]).';
% bin2dec converts 8 chars of 0,1 into a decimal number
% then convert double into uin8
image_bits_binary = uint8(bin2dec(image_bits_string_reshaped)');

%% Reshape image to original size and display
% I guess you would need to copy the values in 'image_original_dimensions' from transmitter
% script to here
image_reshaped = reshape(image_bits_binary,image_original_dimensions);
% Stretch it so it is easier to see, maybe remove this because it might make it hard to see which
% pixels changed
image_display = imresize(image_reshaped,resize_scale);
% Display received image, maybe also display original image
% imshow(image_stretched);

end
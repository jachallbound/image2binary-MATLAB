clear; close all;
%% Convert image to grayscale vector then to bit array
% File to load in
original_image_filename = "sherlock.jpg";
resize_scale = 16;
%% Load image and process
% immediately load into grayscale
image_gray = rgb2gray(imread(original_image_filename));
% Reduce pixel count by 16x (or is it 16^2x?)
image_resized = imresize(image_gray, 1/resize_scale);
% Save original size for reshaping later
image_original_dimensions = size(image_resized);
% Reshape to 1d vector
image_1d = reshape(image_resized,1,[]);

%% Create vector of the bits that makeup the uints of image vector
% TODO: Cut out lower bits and only send the 2 highest bits for a color-depth of 4
% 		(Just another way of bit size of transmission)
image_bits = zeros(1,length(image_1d)*8); % Pre-allocate space
ii = 1;
for i = 1:length(image_1d)
    image_bits(ii:ii+7) = bitget(image_1d(i),8:-1:1);
    ii = ii + 8;
end
% image_bits is what can be sent through the testbed

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% This code should go into the receiver and be used for turning received
% bits back into the image, if only sending 2 out of 8 bits per uint8, this
% is where you would have to zeropad back up to 8 bits.

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
image_stretched = imresize(image_reshaped,resize_scale);
% Display received image, maybe also display original image
imshow(image_stretched);
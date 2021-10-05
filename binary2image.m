function image_reshaped = binary2image(image_bits, bit_depth, pad_flag, image_original_dimensions)


%% Convert bit vector to uints
% convert int to string, string to char, then remove extra dimension
image_bits_char = squeeze(char(string(image_bits)));

image_bits_char_reshaped = reshape(image_bits_char,bit_depth,[]).';

%% Create padding for bit_depth < 8
if bit_depth < 8
    padding_double = ones(length(image_bits_char_reshaped(:,1)),8-bit_depth);
    switch lower(pad_flag)
    case "zero"
        padding_double = padding_double - 1;
    end
    padding = squeeze(char(string(padding_double)));
%     switch lower(pad_flag)
%     case "one"
%         padding = squeeze(char(string(ones(length(image_bits_char_reshaped(:,1)),8-bit_depth))));
%     case "zero"
%         padding = squeeze(char(string(zeros(image_original_dimensions(1),8-bit_depth))));
%     end
    
    image_bits_char_padded = horzcat(image_bits_char_reshaped, padding);
else
    image_bits_char_padded = image_bits_char_reshaped;
end

image_bits_uint8 = uint8(bin2dec(image_bits_char_padded)');

image_reshaped = reshape(image_bits_uint8, image_original_dimensions);
% % char vector in to rows of 8, to be converted to decimal
% image_bits_string_reshaped = reshape(image_bits_string,8,[]).';
% 
% % bin2dec converts 8 chars of 0,1 into a decimal number
% % then convert double into uint8
% image_bits_binary = uint8(bin2dec(image_bits_string_reshaped)');
% 
% %% Reshape image to original size and display
% image_reshaped = reshape(image_bits_binary,image_original_dimensions);
% Stretch it so it is easier to see, maybe remove this because it might make it hard to see which
% pixels changed
% image_display = imresize(image_reshaped,resize_scale);
% Display received image, maybe also display original image
% imshow(image_stretched);

end
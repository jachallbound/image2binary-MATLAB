function image_reshaped = binary2image(image_bits, image_original_dimensions, bit_depth, pad_flag)
arguments
    image_bits
    image_original_dimensions
    bit_depth = 8
    pad_flag = "one"
end

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
    image_bits_char_padded = horzcat(image_bits_char_reshaped, padding);
else
    image_bits_char_padded = image_bits_char_reshaped;
end

image_bits_uint8 = uint8(bin2dec(image_bits_char_padded)');

image_reshaped = reshape(image_bits_uint8, image_original_dimensions);
end
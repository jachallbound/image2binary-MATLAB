# image2binary-MATLAB
Matlab functions to convert an image to binary and back.

Converts images to grayscale: each pixel is only 1 uint8.

Can control bit depth of each pixel: i.e. instead of 8 bits of grayscale, set only 2 bits (like original GameBoy).

Can also operate on vector of bytes (i.e. char/uint8).
Just pass the NameValueArg `"Image", false` to `image2binary` function.
Example in `Driver_image2binary2image.m`.

## Requirements
+ R2019b+ (from use of arguments keyword)
+ This probably requires MATLAB's Image Processing Toolbox.

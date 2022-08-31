function [z] = cnn(v3,x3)
%convolution of the image with filters
y = convn(v3(:, :), x3(:, :), 'same');  %same
[I_POOLING] = pooling(y);
z=I_POOLING;
end
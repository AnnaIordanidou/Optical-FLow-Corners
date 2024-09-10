hVideoSrc = VideoReader('video1 (1).avi');

im1 = im2single(readFrame(hVideoSrc));
im2 = im2single(readFrame(hVideoSrc));

im1gray = im2double(rgb2gray(im1));
im2gray = im2double(rgb2gray(im2));

threshold = 0.05;
windowSize = 5;

[corners_x, corners_y] = cornerDetection (im1gray, windowSize, threshold);

[u, v] = LucasKanade(im1gray, im2gray, windowSize, threshold);

corners_u = [];
corners_v = [];

for i = 1:length(corners_x)

        corners_u = u(corners_x{i}, corners_y{i});
        corners_v = v(corners_x{i}, corners_y{i});
end

figure;
imshow(im2);
hold on;
quiver(ucorners, corners_v);
title('Optical flow vectors in corners');
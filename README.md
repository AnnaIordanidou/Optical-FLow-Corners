• Isolates pixels setting an angle for visual flow calculation.
• Converts video frames to double precision and grayscale.
• Calls cornerDetection function and LucaKanade.
• Initializes two tables to calculate angle and optical flow values.
• Creates loop iterating over detected corner points.
• Extracts horizontal and vertical displacement values from optical flow estimates.
• Stores offset values in corners_u and corners_v vectors at the i-th position.


cornerDetection Function • Function takes input from im_gray image, window size, and threshold. • Derivatives computed using convolution and dx difference filter. • Factors calculated using A11, A12, A21, A22. • Harris angles calculated using formula based on difference of determinant and product of constant factor and trace square. • Empty corners_x and corners_y cell arrays defined for each case. • Find function used to determine row and column indices of elements in R array. • 2x2 matrix A constructed from corresponding elements in matrices A11, A12, A21, and A22. • Eigenvalues calculated using eig function. • Four cases distinguished: positive, negative, positive, negative, or flat region. • Corners' x and y coordinates stored in appropriate cell arrays.


LucasKanade function • The function takes two images as arguments, window size and threshold, and returns vectors u and v. • The output of the convolutional layer is the same size as its output entrance, achieved by adding padding to the input. • Convolution is used to calculate Ix, Iy, and It, using image 1 for the first two and the difference of the two images for It. • System components are calculated for each pixel to estimate optical flow vectors, using gradients of the first frame, the difference between the two frames, and their products. • The filtered products are used to calculate the elements of the matrix A and the vector b. • The process iterates over all pixels in the image, except for a border equal to the window size. • For each pixel (i,j), a 2x2 matrix A_window and a vector b_window are calculated by averaging over a local window centered at (i,j). • The eigenvalues of A_window are calculated to check if the array is invertible. If the smallest eigenvalue is less than the limit, the optical flow for that pixel is set to zero. • The optical flow for pixel (i,j) is calculated as nu = -inv(A_window) * b_window.



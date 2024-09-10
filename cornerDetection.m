function [corners_x, corners_y] = cornerDetection (im_gray, windowSize, threshold)

% Derivatives of the image
dx = [-1 1; -1 1];
Ix = conv2(im_gray, dx, 'same');
Iy = conv2(im_gray, dx', 'same');


Ix2 = Ix .* Ix;
Iy2 = Iy .* Iy;
Ixy = Ix .* Iy;

% sums 
filter = ones(windowSize);
A11 = conv2(Ix2, filter, 'same');
A12 = conv2(Ixy, filter, 'same');
A21 = conv2(Ixy, filter, 'same');
A22 = conv2(Iy2, filter, 'same');

% Harris corner 
k = 0.04;
R = (A11.*A22 - A12.*A21) - k*(A11 + A22).^2;

%peritta
% Find corners using eigenvalues of A matrix
corners_x = cell(4,1);
corners_y = cell(4,1);
[row, col] = find(R > threshold);
for i = 1:length(row)
    r = row(i);
    c = col(i);
    A = [A11(r,c) A12(r,c); A21(r,c) A22(r,c)];
    eig_vals = eig(A);
    if min(eig_vals) > threshold
        if eig_vals(1) > 0 && eig_vals(2) > 0
            corners_x{1} = [corners_x{1} c];
            corners_y{1} = [corners_y{1} r];
        elseif eig_vals(1) > 0 && eig_vals(2) < 0
            corners_x{2} = [corners_x{2} c];
            corners_y{2} = [corners_y{2} r];
        elseif eig_vals(1) < 0 && eig_vals(2) > 0
            corners_x{3} = [corners_x{3} c];
            corners_y{3} = [corners_y{3} r];
        else
            corners_x{4} = [corners_x{4} c];
            corners_y{4} = [corners_y{4} r];
        end
    end
    
end



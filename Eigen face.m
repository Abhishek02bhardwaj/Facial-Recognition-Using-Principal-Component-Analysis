function [m, A, Eigenfaces] = EigenfaceCore(T)
% Calculating the mean image 
m = mean(T,2); % Computing the average face image m = (1/P)*sum(Tj's)    (j = 1 : P)
Train_Number = size(T,2);
% Calculating the deviation of each image from mean image
A = [];  
for i = 1 : Train_Number
    temp = double(T(:,i)) - m; % Computing the difference image for each image in the training set Ai = Ti - m
    A = [A temp]; % Merging all centered images
end

L = A'*A; % L is the surrogate of covariance matrix C=A*A'.
[V D] = eig(L); % Diagonal elements of D are the eigenvalues for both L=A'*A and C=A*A'.

L_eig_vec = [];
for j = 1 : size(V,2) 
    if( D(j,j)>1 )
        L_eig_vec = [L_eig_vec V(:,j)];
    end
end

Eigenfaces = A * L_eig_vec; % A: centered image vectors

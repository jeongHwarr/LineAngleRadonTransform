clear all;

%% read image

row=2304; col=3072; 
% row=400; col=600; 
% row=600; col=400; 

fin = fopen('1.raw', 'r');
I = fread(fin, row*col, '*int16');
Z=reshape(I,row,col);
Z=Z';
Z=rescale(Z);
imshow(Z)

one_mat = ones(col,row);

%% Radon Transform
theta = 0:0.1:179;
[R,xp] = radon(Z,theta);

%% plot result of Radon Transform
% figure
% imagesc(theta, xp, R); colormap(hot);
% xlabel('\theta (degrees)');
% ylabel('x^{\prime} (pixels from center)');
% title('R_{\theta} (x^{\prime})');
% colorbar

%% find the angle with the largest value.

maxR = max(R(:));
[rowOfMax, columnOfMax] = find(R == maxR);

fprintf('The angle of the line is %0.1f\n',columnOfMax/10-0.1)
%%Load Image
myImage=imread('matchstick.jpg');  %Read the image   
imshow(myImage)                    %Display image loaded
title('My Image');                 %Image displayed with title
%% RGB to Grayscale
grayImage=rgb2gray(myImage);       %Converting RGB image to gray-scale
imshow(grayImage)                  %Display grayscale image
title('Gray Image');               %Gray Image displayed with title
%% RGB to HSV
hsv_myImage=rgb2hsv(myImage);      %Converting RGB image to HSV
imshow(hsv_myImage)                %Display HSV Image  
title('HSV Image');                %HSV image displayed with title
%% Binarize the Image
thresholdValue = 50;              % Assigning threshold value=50
binaryImage=grayImage>thresholdValue;  % Condition to check the quality of image
subplot(1,2,1);                   % row 1, column 2, position 1
imshow(myImage);                  % Display original RGB image
title('Original Image in RGB');   % Title assigned to RGB image 
subplot(1,2,2);                   % row 1, column 2, position 2
imshow(binaryImage);              % Display binarized image
title('Threshold 50');            % Title assigned to binarized image
%% Binarize the Image
thresholdValue = 100;             % Assigning threshold value=100
binaryImage=grayImage>thresholdValue; % Condition to check the quality of image
subplot(1,2,1);                   % row 1, column 2, position 1
imshow(myImage);                  % Display original RGB image
title('Original Image in RGB');   % Title assigned to RGB image
subplot(1,2,2);                   % row 1, column 2, position 2
imshow(binaryImage);              % Display binarized image
title('Threshold 100');           % Title assigned to binarized image
%% Binarize the Image
thresholdValue = 150;             % Assigning threshold value=150
binaryImage=grayImage>thresholdValue;% Condition to check the quality of image
subplot(1,2,1);                   % row 1, column 2, position 1                  
imshow(myImage);                  % Display original RGB image
title('Original Image in RGB');   % Title assigned to RGB image
subplot(1,2,2);                   % row 1, column 2, position 2
imshow(binaryImage);              % Display binarized image
title('Threshold 150');           % Title assigned to binarized image
%% Image Translation
tx = 50;                          % shift in x-direction
ty = 30;                          % shift in y-direction
translatedImage = imtranslate(myImage, [tx, ty]);% To perform translation in original image
figure;
imshow(translatedImage);          % Display translated image
title('Translated Image');        % Title assigned to translated image
%% Image Rotation
angle = 45;                       % rotation angle in degrees
rotatedImage = imrotate(translatedImage, angle); % To perform translation on the image
figure;                            % Creating a figure window
imshow(rotatedImage);              % Display rotated image
title('Rotated Image');            % Title assigned to rotated image
%% Mean filtering Method
filter_size=3;                     % Define size of filter=3
mean_filter = ones(filter_size)/filter_size^2; %Creating a mean filter by dividing matrix by filter-size
smoothenedImage=imfilter(myImage,mean_filter); %Applying mean filter to image
figure;                            % Creating a figure window
subplot(1,2,1);                    % row 1, column 2, position 1
imshow(myImage);                   % Display original image
title('My Image');                 % Title assigned to original image
subplot(1,2,2);                   % row 1, column 2, position 2
imshow(smoothenedImage);          % Display mean smoothened image
title('Mean Smoothened Image');    % Title assigned to mean smoothened image
%% Mean filtering Method
filter_size=8;                    % Define size of filter=8
mean_filter = ones(filter_size)/filter_size^2; %Creating a mean filter by dividing matrix by filter-size
smoothenedImage=imfilter(myImage,mean_filter); %Applying mean filter to image
figure;                            % Creating a figure window
subplot(1,2,1);                    % row 1, column 2, position 1
imshow(myImage);                   % Display original image
title('My Image');                 % Title assigned to original image
subplot(1,2,2);                    % row 1, column 2, position 2
imshow(smoothenedImage);           % Display mean smoothened image
title('Mean Smoothened Image');    % Title assigned to mean smoothened image
%% Gaussian filtering Method
sigma=2;                           %Define sigma value as 2
gaussianImage=imgaussfilt(myImage, sigma); % Applying gaussian filter to original image
subplot(1,2,1);                    % row 1, column 2, position 1
imshow(myImage);                   % Display original image
title('My Image');                 % Title assigned to original image
subplot(1,2,2);                    % row 1, column 2, position 2
imshow(gaussianImage);             % Display gaussian filtered image
title('Gaussian Smoothened Image');% Title assigned to gaussian smoothened image
%% Gaussian filtering Method
sigma=7;                           % Define sigma value as 7
gaussianImage=imgaussfilt(myImage, sigma); % Applying gaussian filter to original image
subplot(1,2,1);                    % row 1, column 2, position 1
imshow(myImage);                   % Display original image
title('My Image');                 % Title assigned to original image
subplot(1,2,2);                    % row 1, column 2, position 2
imshow(gaussianImage);             % Display gaussian filtered image
title('Gaussian Smoothened Image'); % Title assigned to gaussian smoothened image
%% Load "peppers" Image
peppersImage=imread('peppers.png'); % Load color image of peppers image
imshow(peppersImage)              % Display color image of peppers image
title('Peppers Image');           % Title assigned to "peppers" image
%% Size of the image
whos peppersImage                 % Determine the size of peppers image
%% Gray Image of "Peppers Image"
peppersgray=rgb2gray(peppersImage); % Coverting RGB image of peppers to gray-scale 
imshow(peppersgray)                 % Display gray image of peppers image
title('Gray Image Peppers');        % Title assigned to "peppers" image
%% Changing the intensity range [0 255] to lower range [0 N]
N=150;                             % Define value as N=150
peppersNew=imadjust(peppersgray, [0 1], [0 N/255]); %Adjusting the intensity values
imshow(peppersNew)                 % Display the new adjusted image
title('Peppers New');              % Title assigned for new adjusted image
%% Changing the intensity range [0 255] to lower range [0 N]
N=100;                             % Define value as N=100
peppersNew=imadjust(peppersgray, [0 1], [0 N/255]); %Adjusting the intensity values
imshow(peppersNew)                % Display the new adjusted image
title('Peppers New');             % Title assigned for new adjusted image
%% For what value of N due you begin to see some distortion
% Defining range of values for N to test
N_values=[50, 100, 150, 200]; % Defining array of values
for i=1:length(N_values)  % Iterating through each value of N
    N=N_values(i)         % Converting the image to [0 N] range
    convertedImage=uint8(double(peppersImage)*(N/255));
    % Displaying the modified image
    subplot(2, length(N_values), i+length(N_values)); % Divide figure window & assign subplot
    imshow(convertedImage);                 % Display modified image
    title(['Image with N value =' num2str(N)]); % Title assigned to displayed image
end









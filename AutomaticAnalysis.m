%Insert Your Input image Here
imageFile = 'Input_image.jpg'; 

% Load & Display Original Image
img = imread(imageFile);
figure('Name','Original Image');
imshow(img);

% Convert to Grayscale if needed
if size(img,3) == 3
    grayImg = rgb2gray(img);
else
    grayImg = img;
end

% Display Grayscale Image
figure('Name','Grayscale Image');
imshow(grayImg);

% Show Image Histogram
figure('Name','Image Histogram');
imhist(grayImg);
title('Grayscale Pixel Histogram');

% Edge Detection
edges = edge(grayImg,'Canny');
figure('Name','Edge Detection (Canny)');
imshow(edges);
title('Edge Map');

% Compute and Display Image Statistics
imgMean = mean(grayImg(:));
imgVar = var(double(grayImg(:)));
disp(['Mean pixel intensity: ', num2str(imgMean)]);
disp(['Variance of pixel intensity: ', num2str(imgVar)]);

% Intensity Boxplot Visualization
figure('Name','Intensity Boxplot');
boxplot(double(grayImg(:)));
title('Boxplot of Pixel Intensities');

% Pie Plot
low = sum(grayImg(:) < 85);
mid = sum(grayImg(:) >= 85 & grayImg(:) < 170);
high = sum(grayImg(:) >= 170);
figure('Name','Intensity Segmentation Pie Chart');
pie([low mid high], {'Low','Medium','High'});
title('Intensity Range Distribution (Low/Mid/High)');


summaryTable = table(imgMean, imgVar, low, mid, high, ...
    'VariableNames',{'MeanIntensity','Variance','LowCount','MidCount','HighCount'});
disp(summaryTable);
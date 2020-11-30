function OverlapTumorOnMRI(MRIplane,TumorImage,OutLabel)
%... ez2290@columbia.edu......
% TumorImage = Tumor image. example: T1_Ax
% OutLabel = The saved figure label. example:'T1_Ax'
% MRIplane : The lable of MRI plane. example: 'axial'

baseImage = imread([MRIplane,'.png']);
baseImage = imresize(baseImage,[512,512]);
parameterROIImage = TumorImage;
bwROIlocations = TumorImage==0;
rgbSlice  = baseImage(:,:,[1 1 1]);        % converting to RGB (ignore colormaps)
imshow(parameterROIImage, []);             % show parametric image
colormap('jet');                           % apply colormap
hold on;
h = imshow(rgbSlice);                      % superimpose anatomical image
set(h, 'AlphaData', bwROIlocations);      % make pixels in the ROI transparent
%     colorbar;
xlm = xlim;
ylm = ylim;
xmid = floor(xlm(2)/2);
ymid = floor(ylm(2)/2);
plot([xmid,xmid],[ylm(1),ylm(2)],'--','color',[255,223,0]./255,'LineWidth',2)
plot([xlm(1),xlm(2)],[ymid,ymid],'--','color',[255,223,0]./255,'LineWidth',2)
axis equal
%..... corp and save the output
saveas(gcf,[OutLabel,'.png']);
Image = imread([OutLabel,'.png']); % Load and crop image
croped_image = rgb2gray(Image);
sz = size(croped_image);
croped_image;
[mn,mx] = find(croped_image==0);
x1 = min(mn);y1 = min(mx);x2 = max(mn);y2 = max(mx);
croped_image = Image(x1:x2,y1:y2,:);
axis square
imwrite(croped_image,[OutLabel,'.png']) % Save croped image

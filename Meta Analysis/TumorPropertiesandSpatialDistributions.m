%% Distribution of Tomurs
%.... By Erfan Zabeh 2020.....
%......ez2290@columbia.edu......
clear all;clc;close all
data_dir = 'C:\Users\Erfan\Desktop\Projects\Tumor detection QuickNat\Data\';
%run ManualRegisteration.m
load('ExpertAnotationMap.mat')
%% .............Spatial Distribution of Tumors.............
%..........................................................
%..........................................................
%..........................................................

figure(1)
%...................Tumor Type 1
figure(1);subplot(3,3,1)
imagesc(T1_Ax)
MRIplane = 'Axial';
TumorImage = T1_Ax;
OutLabel = 'T1_Ax';
figure
OverlapTumorOnMRI(MRIplane,TumorImage,OutLabel)

figure(1);subplot(3,3,2)
imagesc(T1_Cor)
MRIplane = 'Coronal';
TumorImage = T1_Cor;
OutLabel = 'T1_Cor';
figure
OverlapTumorOnMRI(MRIplane,TumorImage,OutLabel)

figure(1);subplot(3,3,3)
imagesc(T1_Sag)
MRIplane = 'Sagital';
TumorImage = T1_Sag;
OutLabel = 'T1_Sag';
figure
OverlapTumorOnMRI(MRIplane,TumorImage,OutLabel)

%...................Tumor Type 2......
figure(1);subplot(3,3,4)
imagesc(T2_Ax)
MRIplane = 'Axial';
TumorImage = T2_Ax;
OutLabel = 'T2_Ax';
figure
OverlapTumorOnMRI(MRIplane,TumorImage,OutLabel)

figure(1);subplot(3,3,5)
imagesc(T2_Cor)
MRIplane = 'Coronal';
TumorImage = T2_Cor;
OutLabel = 'T2_Cor';
figure
OverlapTumorOnMRI(MRIplane,TumorImage,OutLabel)

figure(1);subplot(3,3,6)
imagesc(T2_Sag)
MRIplane = 'Sagital';
TumorImage = T2_Sag;
OutLabel = 'T2_Sag';
figure
OverlapTumorOnMRI(MRIplane,TumorImage,OutLabel)

%...................Tumor Type 3
figure(1);subplot(3,3,7)
imagesc(T3_Ax)
MRIplane = 'Axial';
TumorImage = T3_Ax;
OutLabel = 'T3_Ax';
figure
OverlapTumorOnMRI(MRIplane,TumorImage,OutLabel)

figure(1);subplot(3,3,8)
imagesc(T3_Cor)
MRIplane = 'Coronal';
TumorImage = T3_Cor;
OutLabel = 'T3_Cor';
figure
OverlapTumorOnMRI(MRIplane,TumorImage,OutLabel)

figure(1);subplot(3,3,9)
imagesc(T3_Sag)
MRIplane = 'Sagital';
TumorImage = T3_Sag;
OutLabel = 'T3_Sag';
figure
OverlapTumorOnMRI(MRIplane,TumorImage,OutLabel)

%% (3D image) combining Sagital, Coronal, and Axial views
%..........................................................
%..........................................................
%..........................................................
close all
h = figure(1);
scrsz = get(0,'ScreenSize');
set(h,'position',scrsz)

TumorLabel = {['Meningioma'],['Glioma'], ['Pituitary']};

for TumorType = 1:3
subplot(1,3,TumorType)

hold on;
ax = imread(['T',num2str(TumorType),'_Ax.png']);
sag = imread(['T',num2str(TumorType),'_Sag.png']);
cor = imread(['T',num2str(TumorType),'_Cor.png']);
s1 = imsurf(cor,[],[-1  0 0],[0 -1 0],0.3);
s2 = imsurf(ax,[],[0 0 -1],[0 -1 0],0.3);
s3 = imsurf(sag,[],[0  -1 0],[1  0 0],0.3);

axis square
view([35 -35]);
s1.EdgeColor = [255,223,0]./255;
s2.EdgeColor = [255,223,0]./255;
s3.EdgeColor = [255,223,0]./255;
axis off
title ({['Spatial Distribution of'];[TumorLabel{TumorType}, ' Tumor']})
end
save2pdf(['TumorSpatialDistribution'],gcf,600)
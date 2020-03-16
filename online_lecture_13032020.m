%% Online Session 6.1 (13th March 2020) 

% assignment info: 
% figures with subplots e.g. one anatomy, one histogram of intensities, one sample tc
% subplot(rows, columns, 1, 2, [3,4]) to divide up 
% use data from feat folder

%% Make a figure with 3 panels (from FSL data) 

%keep the script with the dafni code
% ~/matlab/dafni/myassignment
datadir = '/Users/rebecca/imaging_analysis/data/subject-C.feat/';

addpath(genpath('/Users/rebecca/imaging_analysis/myDAFNIexample'));
% change directory to data directory 
currentdir = pwd();
cd(datadir)

%%
fig = figure();

% make panel A; slice of the anatomy file
% hint: returnSlice, look in reg folder, imagesc
subplot(2,2,1)

anatomy = niftiread('reg/highres.nii.gz');
size(anatomy); %to double check is all good 

% use returnSlice to get one slice
s = returnSlice(anatomy, 160, 3);
% make it look nice
imagesc(s)
colormap(gray())
axis('off')
view(-90,90) %rotates 
axis('image') %stops stretching 
title('(A) example anatomy', 'HorizontalAlignment', 'right')
%% panel B; histogram 
% hint data 3d array turn into one long vector data(:) and feed into
% histogram 
subplot(2,2,2)

%lots of 0s which isn't interesting so only show non-zero voxels
idx = (anatomy > 0);
histogram(anatomy(idx))
title('(B) histogram', 'HorizontalAlignment', 'right')
%% panel C; timecourse plot
% hint folder tsplot_zstat1.txt info from the 'best' voxel highest zstat
% value
subplot(2,2,[3,4])

ts = load('tsplot/tsplot_zstat1.txt');
%1st col = actual data, 2nd = design matrix explan var (prediction)
%3rd col = model with all explan variables, 4th = ?look into?

plot(ts(:,[1,3]));
legend('data', 'model')
title('(C) timeseries', 'HorizontalAlignment', 'right')
%% return back to where my script is
cd(currentdir)

% - how to make sure the fig has correct font size for A4 page
% we saved the figure in a variable 'fig' which we can now edit
fig.PaperSize = [15 10];
fig.PaperUnits = 'centimeters';
fig.PaperPosition = [0 0 15 10];

% now save as pdf, this allows the to resize thing
% shows in A4 size, so can know what size you want text to be etc 
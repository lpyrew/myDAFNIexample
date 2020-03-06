%% outline script for thinking about image display

% re: session 5 of DAFNI 6/3/2020 RW

%% Preliminaries

%think about some commands/functions

% 1. reading nifti files: niftiread()
% niftiinfo()
% volumeViewer(V) (found by denis recently...) 

% 2. displaying images
% image() axis/orientation/range a bit weird sometimes
% imagesc() scaled range for colours 
% returnSlice() from previous work... 

%% Plan for makeMontage

% given 3D data, how to display using montage: montage(D)
% but this looks dark... has an annoying singleton! Convert 4D into 3D
    % D_3d = squeeze(D);
% montage(D_3d) is exactly the same, so this isn't the issue.. 
% want to stretch the colourmap over the most interesting bits (ignoring
% lower and upper 5%) 

% how change which images/slices are being displayed 
    % use parameter 'Indices' e.g. montage(data, map, 'Indices', 1:4)

% how change the range of colours that are being displayed 
    % montage(D_3d, 'DisplayRange',[40,80])
    
%% Use actual data from class

fname = '~/data/subject-C/mprage.nii.gz';
data = niftiread(fname);

% 1. find the slices you want to display
% montage(data) gives all 256 slices (the 3rd dim), but really dark and small
nSlices = size(data,3);
nDisplay = 25;
% linspace(1, nSlices, nDisplay); % but this can give decimals if not an even division
idx = round(linspace(1, nSlices, nDisplay));

% 2. find 5 and 95 percentile for better colourmap
robust_range = prctile(data(:), [5,95]);

% 3. in this case, the orientation is wrong (x and y are the wrong way
% around) so need to permute the dims

dataP = permute(data, [2, 1, 3]); % specifying the new version will have y, x, z

% make a montage of these defined slices, changing the range of colours
montage(dataP, 'Indices', idx, 'DisplayRange', robust_range);

% want to turn it into a useful function!!!





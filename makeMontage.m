function makeMontage(fname, nDisplay)
% make a montage from data in the file (fname) of nDisplay images equally
% spaced in the dataset's number of slices
%
% example: makeMontage('~/data/subject-C/mprage.nii.gz', 20)
% 
% Note: this function displays the robust range for easier visualisation


data = niftiread(fname);

% 1. find 5 and 95 percentile for better colourmap
robust_range = prctile(data(:), [5,95]);

% 2. Permute the dims to switch x and y
%TODO: would be nice to have a more generic solution that always works... 
dataP = permute(data, [2, 1, 3]); % specifying the new version will have y, x, z

% 3. find the slices you want to display
nSlices = size(dataP,3);
idx = round(linspace(1, nSlices, nDisplay)); %rounded for integers

% 4. make a montage of these defined slices, changing the range of colours
montage(dataP, 'Indices', idx, 'DisplayRange', robust_range);
end
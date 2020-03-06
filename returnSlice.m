function s = returnSlice(array, sliceNum, orientation)
% returnSlice - return a 2d slice from a 3d array in given orientation 
%
% ds, 2019-11-05, for matlab class

% add some reality check about sizes... just in case
% potential problem: user can ask for sliceNum that goes beyond size of
% array

% find out sizes of the data cube
% then index into the appropriate orientation.
% THIS GIVES the maximum slice number we don't want to exceed
% this version just ask for the size in particular orientation..
if sliceNum >  size(array, orientation)
    error('UHOH! asking for a slice# too high')
end

if orientation == 1
    % do one thing
    s = array(sliceNum, :,:  );
    
elseif orientation == 2
    % do the other thing
    s = array(:, sliceNum, : );
    
elseif orientation == 3
    % third way of slicing
    s = array(: , :, sliceNum );   
    
else
   error('orientation needs to be 1, 2, or 3'); 
end

% deal with weird singleton dimensions
s = squeeze(s);

end % ends function

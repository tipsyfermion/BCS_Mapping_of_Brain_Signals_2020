function [blinks, X_blink_removed, Y_blink_removed] = detect_blinks(X, Y, padding)
%DETECT_BLINKs This function detects and removes the blinks.
%   This function produces a mask to indentify the saccades. 0 means a lack
%   of saccades wheras a 1 means that a saccade is present and has been
%   detected by the thresholding mechanism.
%   
%   The eyetracking data gives impossible values when a blink occours. The
%   gaze position is reccorded to be beyond the screen. The way that this
%   function works is by capturing the thresholding the blink positions.
%
%**********************************************************************%
% Author: Debaditya Bhattacharya                                       %
% Contact: debbh922 (at) gmail (dot) com                               %
%**********************************************************************%
%

    %Get the size of dimentions of the data.
    [no_of_trials, no_of_timestamps] = size(X);
    
    %Apply thresholds.
    blinks_x = X<-30;
    blinks_y = Y>20;
    
    %Combine thresholds
    blinks = logical(blinks_x + blinks_y);
    
    %Apply Padding.
    for i= 1:no_of_trials
        
        %Get endpoint trimmed variable.
        blinks_t = blinks(i, padding : no_of_timestamps - padding);
        
        %Find where blinks are.
        where_blink = find(blinks_t);
        
        %Iterate through where blinks are and add padding.
        for j = 1:length(where_blink)
            
            blinks(i, where_blink(j) + 1 : where_blink(j) + (2*padding)) = 1;
            
        end %Iterate through where blinks are and add padding.
        
    end %Apply Padding.
    
    %Terminate function if blink removed is not asked for.
    if nargout == 1
        
        return
        
    end %Terminate function if blink removed is not asked for.
    
    %Initialize _blink_removed.
    X_blink_removed = X;
    Y_blink_removed = Y;
    
    %Remove blinks.
    X_blink_removed(blinks) = NaN;
    Y_blink_removed(blinks) = NaN;
    
end %detect_blinks


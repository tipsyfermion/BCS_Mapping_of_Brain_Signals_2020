function [saccades, X_saccade_removed, Y_saccade_removed] = detect_saccades(vX, vY, padding, std_scaler, X, Y)
%DETECTS_SACCADES This function takes vX, vY and a padding and captures saccades based on a threshold. 
%   This function produces a mask to indentify the saccades. 0 means a lack
%   of saccades wheras a 1 means that a saccade is present and has been
%   detected by the thresholding mechanism.
%
%   The V i.e. the total velocity is calculated after which the mean and
%   the std of V is calculated. The cuttoff velocity has been taken as 
%   mean + 2std.
%
%**********************************************************************%
% Author: Debaditya Bhattacharya                                       %
% Contact: debbh922 (at) gmail (dot) com                               %
%**********************************************************************%
%

    %Calculate the total velocity.
    V = sqrt(vX.*vX + vY.*vY);
    
    %Get the dimentions of the velocity matrix
    [no_of_trials, no_of_timestamps] = size(V);
    
    %Initialize a variable to store a saccade mask
    saccades = zeros(no_of_trials, no_of_timestamps);
    
    %Loop through trials
    for trial = 1:no_of_trials
        
        %Local Variable with Trimmed values of
        Vt_trim = V(trial, ~isnan(V(trial, :)));
        
        %Calculate the avg and the std for the local velocity.
        Vt_avg = mean(smoothdata(Vt_trim,'movmedian',50));
        Vt_std = std(smoothdata(Vt_trim,'movmedian',50));
        
        %Update the saccade variable
        saccades(trial, :) = V(trial, :) > 1*Vt_avg + std_scaler*Vt_std;
        
        %ADD PADDING
        %Get endpoint trimmed variable.
        saccades_t = saccades(trial, padding : no_of_timestamps - padding);
        
        %Find where saccades are.
        where_saccade = find(saccades_t);
        
        %Iterate through where saccades are and add padding.
        for j = 1:length(where_saccade)
            
            saccades(trial, where_saccade(j) + 1 : where_saccade(j) + (2*padding)) = 1;
            
        end %Iterate through where saccades are and add padding.
        
    end %Loop through trials
    
    %Terminate function if saccade removed is not asked for.
    if nargout == 1
        
        return
        
    end %Terminate function if blink removed is not asked for.
    
    %Initialize _saccade_removed.
    X_saccade_removed = X;
    Y_saccade_removed = Y;
    
    %Remove blinks.
    X_saccade_removed(saccades) = NaN;
    Y_saccade_removed(saccades) = NaN;
    
    
end %detect_saccades


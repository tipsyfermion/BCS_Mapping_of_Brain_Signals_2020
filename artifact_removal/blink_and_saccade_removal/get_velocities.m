function [vX, vY] = get_velocities(X, Y, param)
%GET_VELOCITIES This function calculates the velocity.
%   There are two ways in which this function can produce the velocity. The
%   default way and the way represented by the param = 'diff' will return
%   the simple velocity calculated with the help of the function diff.
%   
%   The other parm = 'conv' which uses a covolutional method to calculate
%   the velocity.
%
%**********************************************************************%
% Author: Debaditya Bhattacharya                                       %
% Contact: debbh922 (at) gmail (dot) com                               %
%**********************************************************************%
%
    
    %Take care of lack of param / incorrect param.
    if ((~strcmp(param,'diff'))||(~strcmp(param,'conv')))
        param = 'diff';
    end %Take care of lack of param / incorrect param.
    
    %Get size of variables
    [no_of_trials, no_of_timestamps] = size(X);
    
    %Intialize variables
    vX = NaN(no_of_trials, no_of_timestamps);
    vY = NaN(no_of_trials, no_of_timestamps);
    
    %Run for conv case
    if strcmp(param,'conv')
        
        %Define kernel
        kernel = [-1,-1-1,0,1,1,1];
        
        %Add weights to kernel based on units.
        kernel = kernel*(1000)/12;
        
        %Iterate through the data
        for trial = 1:no_of_trials
            
            %Pick out one trial
            x = X(trial,:);
            y = Y(trial,:);
               
            %Apply the convolution
            vx = conv(x,kernel,'same');
            vy = conv(y,kernel,'same');
            
            %Store the variables
            vX(trial,:) = vx;
            vY(trial,:) = vy;
            
        end%Iterate through the data
        
    else %Run the default case
    
       %Iterate through the data
        for trial = 1:no_of_trials
            
            %Pick out one trial
            x = X(trial,:);
            y = Y(trial,:);

            %Apply the diff function. Multiply by 1000 to get the units
            %correct.
            vx = diff(x)*1000;
            vy = diff(y)*1000;
            
            %Store the variables
            vX(trial,:) = [vx,nan];
            vY(trial,:) = [vy,nan];
            
        end %Run the default case
        
    end %Run for conv case
    
end %get_velocities


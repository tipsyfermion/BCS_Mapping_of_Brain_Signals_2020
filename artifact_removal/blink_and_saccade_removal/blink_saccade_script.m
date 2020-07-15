%BLINK_SACCADE_SCRIPT This script finds the blinks and saccades.
%
%**********************************************************************%
% Author: Debaditya Bhattacharya                                       %
% Contact: debbh922 (at) gmail (dot) com                               %
%**********************************************************************%
%

%Detect the blinks & remove the blinks. Padding used is 75ms.
blink_padding = 75;
[blinks, X, Y] = detect_blinks(M1EyeX_, M1EyeY_, blink_padding);

%Smoothen the data by using custom gaussian filter with 20ms std.
smoothening_std = 20;
[X0, Y0] = smoothen_data(X, Y, smoothening_std);

%Calculate the velocty by using the simple diff().
[vX, vY] = get_velocities(X0, Y0, 'diff');

%Fix the initial two values to 0 (This fix is required because for some
%reason there is an unusual spiking in the initial velocity. The exact
%reason has not been figured out yet.
vX(:,1:2) = 0;
vY(:,1:2) = 0;

%Run the detect_saccades algorithms to detect saccades.
saccade_padding = 20; %20ms of padding
saccade_std_multiplier = 1.8;
[Saccades] = detect_saccades(vX, vY, saccade_padding, saccade_std_multiplier);
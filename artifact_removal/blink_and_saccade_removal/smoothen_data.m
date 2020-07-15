function [X_smooth,Y_smooth] = smoothen_data(X, Y, SD)
%SMOOTHEN_DATA This function used to smoothen the data by using a gaussian
%filter.
%
%**********************************************************************%
% Author: Debaditya Bhattacharya                                       %
% Contact: debbh922 (at) gmail (dot) com                               %
%**********************************************************************%
%
    X_smooth = smoothdata(X,2,'gaussian',5*SD,'includenan');
    Y_smooth = smoothdata(Y,2,'gaussian',5*SD,'includenan');
    
end


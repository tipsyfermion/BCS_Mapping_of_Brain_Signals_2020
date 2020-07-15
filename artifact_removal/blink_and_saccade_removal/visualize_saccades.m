function visualize_saccades(vX,vY,X0,Y0,X,Y,blinks,saccades,trial)
%VISUALIZE_SACCADES This function plots the saccades.
%
%**********************************************************************%
% Author: Debaditya Bhattacharya                                       %
% Contact: debbh922 (at) gmail (dot) com                               %
%**********************************************************************%
%
    %Close all present windows and hold off.
    close all;
    hold off;
    
    %Create a subplot 1 for the position values
    pos_t = subplot(2,1,1);
    figure(1);
   
    hold on;
    %The general timestep range
    time_steps = 1:12000;
    
    %Plot X0 and Y0
    plot(X0(trial,:));
    plot(Y0(trial,:));
    
    %Overlap with saccades
    plot(time_steps(saccades(trial,:)>0),X0(trial,saccades(trial,:)>0),'.');
    plot(time_steps(saccades(trial,:)>0),Y0(trial,saccades(trial,:)>0),'.');
    
    %Formatting
    xlabel('Time (ms)');
    ylabel('Displacement (deg)');
    legend('X Displacement','Y Displacement','Saccade','Saccade');
    title('Position-Time for Trial: '+string(trial));
    
    hold off;
    
    %Subplot 2
    vel_t = subplot(2,1,2);
    
    %Calculate velocity.
    V = sqrt(vX.*vX + vY.*vY);
    
    %Plot the velocity
    plot(V(trial,:));
    
    hold on;
    
    %Plot the saccades.
    plot(time_steps(saccades(trial,:)>0),V(trial,saccades(trial,:)>0),'.');
    
    %Formatting
    xlabel('Time (ms)');
    ylabel('Velocity (deg/sec)');
    legend('Velocity','Saccade');
    title('Velocity-Time for Trial: '+string(trial));
    linkaxes([pos_t vel_t],'x');
    
    hold off;
    
    %Create a new figure.
    figure(2);
    
    %Plot the positions of eye on a graph.
    plot(X0(trial,:),Y0(trial,:),'.');
    
    hold on;
    
    %Plot the saccades
    plot(X0(trial,saccades(trial,:)>0),Y0(trial,saccades(trial,:)>0),'.');
    
    %Formatting
    xlabel('X position (deg)');
    ylabel('Y position (deg)');
    legend('X vs Y','Saccade');
    title('Position for Trial: '+string(trial));
    hold off;
    
end

%  This is the data analysis of eye data for a particular trail in EEG.
%    In this program you will be basically find that the changes in the
%    eye movewment with respect to trail, to find saccades and blink .
%    the artifacts present in the trail will be removed and then replaced
%    by NaN
%    In this program the velocity of eye movement in a particular trail is
%    found
%
%**********************************************************************%
% Author:  Rakesh Potnuru                                               %
% Contact: potnururakesh97 (at) gmail (dot) com                               %
%**********************************************************************%
%
i=  2; %train interval which is to be found
temp_x= M1EyeX_(i,:); %%temperory variables storing
temp_y= M1EyeY_(i,:);
temp_x_b=M1EyeX_(i,:);
temp_y_b=M1EyeY_(i,:);
temp_x_b= temp_x_b(~(isnan(temp_x)));
temp_y_b= temp_y_b(~(isnan(temp_y)));
vel_x1=abs(diff(temp_x_b));
vel_y1=abs(diff(temp_y_b));
mag_b=sqrt((vel_x1.^2)+(vel_y1.^2));
velocity_b = mean(mag_b)
max(mag_b)
k=1:1:12000;
subplot(2,3,1)
plot (k, temp_x,'r')
title('before removing saccade and blink')
ylabel('movement in x (Deg)')
xlabel('time stamp(ms)')
subplot(2,3,2)
plot (k, temp_y,'b')
title('before removing saccade and blink')
ylabel('movement in y (Deg)')
xlabel('time stamp(ms)')
subplot(2,3,3)
plot(temp_x,temp_y, '.')
title('before removing saccade and blink')
xlabel('movement in x (Deg)')
ylabel('movement in y (Deg)')
%plot (k, temp_x,'r',k,temp_y, 'b' )
for j=1:12000 % time instances
        
        
        if temp_x(1,j) <=-10 || temp_x(1,j)>=10
           % disp ('ampltitude thershold crossed may be a blink or saccade') 
            
            time(1,j)=j;  %time instances wher blink or saccades happen
            
            %should note the point of time 
        end
        
        
end
% pulse width code
temp_x= temp_x(~(isnan(temp_x)));
temp_y= temp_y(~(isnan(temp_y)));
W =pulsewidth( temp_x);
for a=1:length(W)
    
  if (W(1,a) >=1)
    disp ( 'it a blink')
  else 
    disp('its a saccade')
    
  end  
end  
temp_x1=temp_x;
temp_y1=temp_y;
for j= 1:length(temp_x)
    if  temp_x(1,j) <=-5 || temp_x(1,j)>=5  || temp_y(1,j)>=5 || temp_y(1,j) <=-5 
       temp_x1(1,j)=NaN;  
        temp_y1(1,j)=NaN;  
       temp_x1(1,j+150)=NaN;  
       temp_x1(1,j-150)=NaN; 
       temp_y1(1,j+150)=NaN;  
        temp_y1(1,j-150)=NaN;  
    end
    
end
subplot(2,3,4)
x=1:length(temp_x1);
plot (x,temp_x1,'r' )
xlabel('time stamp(ms)')
ylabel('movement in x (Deg)')
title('after removing saccade and blink')
subplot(2,3,5)
y=1:length(temp_y1);
plot (x,temp_y1,'b' )
ylabel('movement in y (Deg)')
xlabel('time stamp(ms)')
title('after removing saccade and blink')
subplot(2,3,6)
x=1:length(temp_x1);
plot (temp_x1,temp_y1 ,'.')
xlabel('movement in x (Deg)')
ylabel('movement in y (Deg)')
title('after removing saccade and blink')
% to find velocity of the signal 
vel_x=abs(diff(temp_x1));
vel_y=abs(diff(temp_y1));
figure
subplot(2,1,1)
mag=sqrt((vel_x.^2)+(vel_y.^2));
velocity = mean(mag)
max(mag)
x1=1:(length(mag));
plot(x1,mag,'-r.' )
ylim=[-1 12]
xlabel('Time in (ms)')
ylabel('velocity in (Deg/sec)')
title('after removing saccade and blink')
subplot(2,1,2)
mag_b_l=1:length(mag_b);
plot(mag_b_l,mag_b)
%ylim=[0 7000]
xlabel('Time in (ms)')
ylabel('velocity in (Deg/sec)')
title('before removing saccade and blink')
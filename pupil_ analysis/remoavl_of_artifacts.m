
%  This is the basic data analysis of pupil data for a particular trail .
%    In this program you will be basically find that the changes in the
%    pupil size with respect to trail,saccades and blink .
%    the artifacts present in the trail will be removed and then replaced
%    by NaN
%    In this program the pupil data is compared with eye data too
%
%**********************************************************************%
% Author: Rakesh Potnuru                                               %
% Contact: potnururakesh97 (at) gmail (dot) com                               %
%**********************************************************************%
%
 
i=5;                        %%trail number%%
x1= M1Pupil_(i,:);          %%temperory variables storing %%
x1_e= M1EyeX_(i,:);         %%temperory variables storingfor eye data%
x1= x1(~(isnan(x1)));
x1_e= x1_e(~(isnan(x1_e)));
k=1:length(x1);

xx= smooth(x1,'sgolay',3);     %%amoothening of data%
xx_e= smooth(x1_e,'sgolay',3);
xx=transpose(xx);

cof=ones(1 ,length(xx));       %filtering of data
f=filter(cof,1,xx);
s=gradient(f);
for z= 50:length(x1);
 if s(1,z)<0
    xx(1,z-50)=NaN;             % finding artifacts and replacing with NaN
    xx(1,z)=NaN;
    xx(1,z+50)=NaN;
 end
end
subplot(2,1,1)
plot(k,x1)
title('Before removal')
subplot(2,1,2)
plot (k,xx)
title('After removal')

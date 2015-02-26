% dehm_test - examples on how to use dehm utility functions 
% bambang@chiba-u.jp 
% 2015.02.26

% display a dehm file in current folder
dehm_show('5339.dehm');
title('5339.dehm');
% default colormap is pink, try the following line for other
colormap jet;

% down sampling, do it like slide 21 of "stamps step by step presentation"
dehm_downsample('5339.dehm','downsampled.dehm', 2000,2500);
% display result 
dehm_show('downsampled.dehm', 2000, 2500);
colormap jet;

% merge vertically
dehm_merge('5339.dehm', '5340.dehm', 'merged3940.dehm');

% display
dehm_show('merged3940.dehm',18000, 6000);
colormap jet;
title('Merged 5339 and 5340');
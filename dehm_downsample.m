% dehm_downsample.m - downsample dehm file by 50% 
% usage:
% dehmdownsample(f, w, h, o)
% f: input file 
% w: output width 
% h: output height
% o: output file name
%
% Bambang Setiadi 
% 2015.02.24
function dehm_downsample(f,o, w, h)
    if (nargin == 0) or (nargin == 1)
        %error('showdehm: wrong number of argument.');
        fprintf('Wrong number of argument.\n');
        fprintf('usage: dehmdownsample(dehmfilename, outputwidth, outputheight, ratio, outputfilename).\n');
        return;
    elseif nargin == 2  
        w = 9000 / 2;   % set default width 
        h = 6000 / 2;   % set default height
        h = 2;
    elseif nargin == 3
        h = 9000 / 2;   % set default height
        h = 2;
    elseif nargin > 4 
        fprintf('Wrong number of argument.\n');
        fprintf('usage: dehmdownsample(dehmfilename, outputwidth, outputheight, ratio, outputfilename).\n');
        return;        
    end    
    
    nopix = 9000; noline=6000; % original pix and line size of a dehm file
    fdem1 = fopen(f);
    dem1 = single(fread(fdem1, [nopix,noline], 'float32'));
    % get the odd element
    dem1 = dem1(1:2:2*w,1:2:2*h);
    % save 
    fout = fopen(o,'w');
    fwrite(fout, dem1, 'float32');
    fclose(fout);
    fclose(fdem1);
end

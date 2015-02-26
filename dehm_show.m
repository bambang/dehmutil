% dehm_show(file1, nopix, noline) - display dehm file  
% file1: dehm file 
% nopix: number of pixel per line 
% noline: number of line to display 
% example: 
% showdehm('file1.dehm', 9000, 6000)
% showdehm('file1.dehm') 
function dehm_show(file1, nopix, noline)
    if nargin == 1
        nopix = 9000;
        noline = 6000;
    elseif nargin == 2
        noline = 6000;
    elseif nargin == 3
        % do nothing
    else
        %error('showdehm: wrong number of argument.');
        fprintf('wrong number of argument.\n');
        fprintf('usage: showdehm(file1, nopix, noline).\n');
        return;
    end
    
    try
        fdem1 = fopen(file1);
        if (fdem1==-1)
            fprintf('File not found: %s\n', file1);
            return;
        end
        dem1 = single(fread(fdem1, [nopix,noline], 'float32'));
        figure; imagesc(dem1');   
        colormap pink;
        axis equal tight; 
        colorbar; 
        fclose(fdem1);
    catch ME
        fprintf( ME.message );
    end 
end
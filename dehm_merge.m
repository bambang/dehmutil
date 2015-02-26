% dehm_merge.m - merge two dehm file horizontally 
% usage: mergedehm(inputfile1, inputfile2, outputfile)
% Last updated: 2015.02.24 
% Bambang Setiadi (bambang@chiba-u.jp)

% Usage example: 
%  mergedehm('file1.dehm','file2.dehm')
%  output is fout.dehm
%  mergedehm('file1.dehm','file2.dehm', 'mergedfile.dehm'), 
%  output is mergedfile.dehm
function result = dehm_merge(file1, file2, fileout)
    % open input file 
    % Check number of inputs.
    if nargin < 2
        error('mergedehm: requires two input files');
    end
    
    if nargin==2
        fileout ='fout.dehm';
    end 
    
    fdem1 = fopen(file1);
    if (fdem1==-1)
        fprintf('File not found: %s\n', file1);
        return;
    end
    fdem2 = fopen(file2);
    if (fdem1==-1)
        fprintf('File not found: %s\n', file2);
        return;
    end
    
    % open output file 
    fout  = fopen(fileout,'w'); 

    for (i=1:6000)
        line1 = single(fread(fdem1, 9000,'float32'));
        line2 = single(fread(fdem2, 9000,'float32'));
        % write line interleaved
        fwrite(fout, line1, 'single');
        fwrite(fout, line2, 'single');
    end
    fclose(fout);
    fclose(fdem1);
    fclose(fdem2);
    result = 0;
end
[baseName, folder] = uigetfile('*.*');
fullFileName = fullfile(folder, baseName);
fid= fopen(fullFileName);
fid2 = fopen( 'mem.mif', 'wt' );
A=fread(fid,inf, 'uint16','ieee-le'); % little endian data
 
L=length(A);
 
 


fprintf(fid2,'%s%u%s','DEPTH = ',L,';');
fprintf(fid2,'%c\n','');
fprintf(fid2,'%s%u%s','WIDTH = 16;');
fprintf(fid2,'%c\n','');
fprintf(fid2,'%s','ADDRESS_RADIX = HEX;');
fprintf(fid2,'%c\n','');
fprintf(fid2,'%s','DATA_RADIX = HEX;');
fprintf(fid2,'%c\n','');
fprintf(fid2,'%s','CONTENT');
fprintf(fid2,'%c\n','');
fprintf(fid2,'%s\n','BEGIN');
fprintf(fid2,'%c\n','');

for i=1:L
fprintf(fid2,'%X', (i-1));
fprintf(fid2,'%s', ' : ');
fprintf(fid2,'%04X', A(i));
fprintf(fid2,'%s\n', ';');
end

fprintf(fid2,'%s\n', '');
fprintf(fid2,'%s', 'END;');

fclose(fid);
fclose(fid2);



%change input file with new PU ARRIVAL VARIABLE
function switch_input_variable_pu_arrival_rate (pu_arrival_rate)

fid = fopen('inputs.txt','r');
i = 1;
tline = fgetl(fid);
A{i} = tline;
while ischar(tline)
    splitted_line = strsplit(tline);
    if(strcmp(splitted_line(1),'flo_pu_arrival_rate'))
        line_number_to_be_changed = i;
    end
    i = i+1;
    tline = fgetl(fid);
    A{i} = tline;
end
fclose(fid);

% Change cell 
str_new_pu_arrival_rate = num2str(pu_arrival_rate);
new_string = strcat('flo_pu_arrival_rate',{' '},str_new_pu_arrival_rate);
new_string = strjoin(new_string);
A{line_number_to_be_changed} = sprintf('%s',new_string);
% Write cell into txt

fid = fopen('inputs.txt', 'w');
for i = 1:numel(A)
    if (A{i+1} == -1)
        fprintf(fid,'%s', A{i});
        break
    else
        fprintf(fid,'%s\n', A{i});
    end
end
fclose(fid);

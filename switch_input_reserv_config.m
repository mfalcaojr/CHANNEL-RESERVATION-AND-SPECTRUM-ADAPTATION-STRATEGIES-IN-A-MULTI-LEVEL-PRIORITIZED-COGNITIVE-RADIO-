%change input file with new bandwidth configuration

function switch_input_reserv_config (int_su1_reserved_channels, int_su2_reserved_channels)

array_of_line_number_to_be_changed = zeros(1,2);
fid = fopen('inputs.txt','r');
i = 1;
index_of_line_number_to_be_changed = 1;
tline = fgetl(fid);
A{i} = tline;
while ischar(tline)
    splitted_line = strsplit(tline);
    if(strcmp(splitted_line(1),'int_su1_reserved_channels'))
        array_of_line_number_to_be_changed(index_of_line_number_to_be_changed) = i;
        index_of_line_number_to_be_changed = index_of_line_number_to_be_changed +1;
    elseif (strcmp(splitted_line(1),'int_su2_reserved_channels'))
        array_of_line_number_to_be_changed(index_of_line_number_to_be_changed) = i;
        index_of_line_number_to_be_changed = index_of_line_number_to_be_changed +1;
    end
    i = i+1;
    tline = fgetl(fid);
    A{i} = tline;
end
fclose(fid);

% Change cells
    str_new_int_su1_reserved_channels = num2str(int_su1_reserved_channels);
    str_new_int_su2_reserved_channels = num2str(int_su2_reserved_channels);
    
    for index_of_inputs=1:numel(array_of_line_number_to_be_changed)
        if(index_of_inputs == 1)
            new_string = strcat('int_su1_reserved_channels',{' '},str_new_int_su1_reserved_channels);
            new_string = strjoin(new_string);
            A{array_of_line_number_to_be_changed(index_of_inputs)} = sprintf('%s',new_string);
        elseif(index_of_inputs == 2)
            new_string = strcat('int_su2_reserved_channels',{' '},str_new_int_su2_reserved_channels);
            new_string = strjoin(new_string);
            A{array_of_line_number_to_be_changed(index_of_inputs)} = sprintf('%s',new_string);
        end

    end

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

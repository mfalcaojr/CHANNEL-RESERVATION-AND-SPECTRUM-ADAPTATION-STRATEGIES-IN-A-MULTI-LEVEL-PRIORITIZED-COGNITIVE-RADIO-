%change input file with new bandwidth configuration

function switch_input_bandwidth_config (int_total_channel_number,int_pu_bandwidth,int_su1_bandwidth,int_su2_min_bandwidth,int_su2_max_bandwidth)

array_of_line_number_to_be_changed = zeros(1,5);
fid = fopen('inputs.txt','r');
i = 1;
index_of_line_number_to_be_changed = 1;
tline = fgetl(fid);
A{i} = tline;
while ischar(tline)
    splitted_line = strsplit(tline);
    if(strcmp(splitted_line(1),'int_total_channel_number'))
        array_of_line_number_to_be_changed(index_of_line_number_to_be_changed) = i;
        index_of_line_number_to_be_changed = index_of_line_number_to_be_changed +1;
    elseif (strcmp(splitted_line(1),'int_pu_bandwidth'))
        array_of_line_number_to_be_changed(index_of_line_number_to_be_changed) = i;
        index_of_line_number_to_be_changed = index_of_line_number_to_be_changed +1;
    elseif(strcmp(splitted_line(1),'int_su1_bandwidth'))
        array_of_line_number_to_be_changed(index_of_line_number_to_be_changed) = i;
        index_of_line_number_to_be_changed = index_of_line_number_to_be_changed +1;
    elseif(strcmp(splitted_line(1),'int_su2_min_bandwidth'))
        array_of_line_number_to_be_changed(index_of_line_number_to_be_changed) = i;
        index_of_line_number_to_be_changed = index_of_line_number_to_be_changed +1;
    elseif(strcmp(splitted_line(1),'int_su2_max_bandwidth'))
        array_of_line_number_to_be_changed(index_of_line_number_to_be_changed) = i;
        index_of_line_number_to_be_changed = index_of_line_number_to_be_changed +1;
    end
    i = i+1;
    tline = fgetl(fid);
    A{i} = tline;
end
fclose(fid);

% Change cells
    str_new_int_total_channel_number = num2str(int_total_channel_number);
    str_new_int_pu_bandwidth = num2str(int_pu_bandwidth);
    str_new_int_su1_bandwidth = num2str(int_su1_bandwidth);
    str_new_int_su2_min_bandwidth = num2str(int_su2_min_bandwidth);
    str_new_int_su2_max_bandwidth = num2str(int_su2_max_bandwidth);
    
    for index_of_inputs=1:numel(array_of_line_number_to_be_changed)
        if(index_of_inputs == 1)
            new_string = strcat('int_total_channel_number',{' '},str_new_int_total_channel_number);
            new_string = strjoin(new_string);
            A{array_of_line_number_to_be_changed(index_of_inputs)} = sprintf('%s',new_string);
        elseif(index_of_inputs == 2)
            new_string = strcat('int_pu_bandwidth',{' '},str_new_int_pu_bandwidth);
            new_string = strjoin(new_string);
            A{array_of_line_number_to_be_changed(index_of_inputs)} = sprintf('%s',new_string);
        elseif(index_of_inputs == 3)
            new_string = strcat('int_su1_bandwidth',{' '},str_new_int_su1_bandwidth);
            new_string = strjoin(new_string);
            A{array_of_line_number_to_be_changed(index_of_inputs)} = sprintf('%s',new_string);
        elseif(index_of_inputs == 4)
            new_string = strcat('int_su2_min_bandwidth',{' '},str_new_int_su2_min_bandwidth);
            new_string = strjoin(new_string);
            A{array_of_line_number_to_be_changed(index_of_inputs)} = sprintf('%s',new_string);
        elseif(index_of_inputs == 5)
            new_string = strcat('int_su2_max_bandwidth',{' '},str_new_int_su2_max_bandwidth);
            new_string = strjoin(new_string);
            A{array_of_line_number_to_be_changed(index_of_inputs)} = sprintf('%s',new_string); 
            % Write cell into txt
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

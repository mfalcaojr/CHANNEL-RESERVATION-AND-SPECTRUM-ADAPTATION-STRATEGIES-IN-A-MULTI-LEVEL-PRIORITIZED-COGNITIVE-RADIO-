%Compare array and matrix

function string_answer = array_and_matrix_comparison()

clear all;
global int_total_channel_number
global int_pu_bandwidth
global int_su1_bandwidth
global int_su2_min_bandwidth
global int_su2_max_bandwidth
global int_su1_reserved_channels
global int_su2_reserved_channels

int_total_channel_number = str2double(getFromInput('int_total_channel_number'));

int_pu_bandwidth = str2num(getFromInput('int_pu_bandwidth'));
int_su1_bandwidth = str2num(getFromInput('int_su1_bandwidth'));
int_su2_min_bandwidth = str2num(getFromInput('int_su2_min_bandwidth'));
int_su2_max_bandwidth = str2num(getFromInput('int_su2_max_bandwidth'));

int_su1_reserved_channels = str2num(getFromInput('int_su1_reserved_channels'));
int_su2_reserved_channels = str2num(getFromInput('int_su2_reserved_channels'));

    string_array = 'array_out';
    string_matrix = 'matrix_into';
    string_extension_new = '_new.mat';
    string_extension = '.mat';
    
    string_total_channel_number = num2str(int_total_channel_number);
    string_pu_bandwidth = num2str(int_pu_bandwidth);
    string_su1_bandwidth = num2str(int_su1_bandwidth);
    string_su2_min_bandwidth = num2str(int_su2_min_bandwidth);
    string_su1_reserved_channels = num2str(int_su1_reserved_channels);
    string_su2_reserved_channels = num2str(int_su2_reserved_channels);

    string_array_1 = strcat(string_array,'_bp=',string_pu_bandwidth,'_bs1=',string_su1_bandwidth,'_bs2=',string_su2_min_bandwidth,'_N=',string_total_channel_number,'_R1=',string_su1_reserved_channels,'_R2=',string_su2_reserved_channels,string_extension);
    string_matrix_1 = strcat(string_matrix,'_bp=',string_pu_bandwidth,'_bs1=',string_su1_bandwidth,'_bs2=',string_su2_min_bandwidth,'_N=',string_total_channel_number,'_R1=',string_su1_reserved_channels,'_R2=',string_su2_reserved_channels,string_extension);

    string_array_2 = strcat(string_array,'_bp=',string_pu_bandwidth,'_bs1=',string_su1_bandwidth,'_bs2=',string_su2_min_bandwidth,'_N=',string_total_channel_number,'_R1=',string_su1_reserved_channels,'_R2=',string_su2_reserved_channels,string_extension_new);
    string_matrix_2 = strcat(string_matrix,'_bp=',string_pu_bandwidth,'_bs1=',string_su1_bandwidth,'_bs2=',string_su2_min_bandwidth,'_N=',string_total_channel_number,'_R1=',string_su1_reserved_channels,'_R2=',string_su2_reserved_channels,string_extension_new);

array_out_config_1 = load(string_array_1);
array_out_config_2 = load(string_array_2);

matrix_into_config_1 = load(string_matrix_1);
matrix_into_config_2 = load(string_matrix_2);

if (isequal(array_out_config_1,array_out_config_2))
      disp ('arrays are equal');
else
    disp ('arrays are NOT equal');
end

if(isequal(matrix_into_config_1,matrix_into_config_2))
   disp ('matrixes are equal');
else
      disp ('matrixes are NOT equal');
end



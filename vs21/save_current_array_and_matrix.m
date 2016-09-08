function no_return =  save_current_array_and_matrix(array_out_of_state,matrix_into_state)

global int_total_channel_number
global int_pu_bandwidth
global int_su1_bandwidth
global int_su2_min_bandwidth
global int_su2_max_bandwidth
global int_su1_reserved_channels
global int_su2_reserved_channels
global flo_pu_arrival_rate
global flo_su1_arrival_rate
global flo_su2_arrival_rate 
global flo_pu_service_rate 
global flo_su1_service_rate 
global flo_su2_service_rate

int_total_channel_number = str2double(getFromInput('int_total_channel_number'));

int_pu_bandwidth = str2num(getFromInput('int_pu_bandwidth'));
int_su1_bandwidth = str2num(getFromInput('int_su1_bandwidth'));
int_su2_min_bandwidth = str2num(getFromInput('int_su2_min_bandwidth'));
int_su2_max_bandwidth = str2num(getFromInput('int_su2_max_bandwidth'));

int_su1_reserved_channels = str2num(getFromInput('int_su1_reserved_channels'));
int_su2_reserved_channels = str2num(getFromInput('int_su2_reserved_channels'));

flo_pu_arrival_rate = str2num(getFromInput('flo_pu_arrival_rate'));
flo_su1_arrival_rate = str2num(getFromInput('flo_su1_arrival_rate'));
flo_su2_arrival_rate = str2num(getFromInput('flo_su2_arrival_rate'));
flo_pu_service_rate = str2num(getFromInput('flo_pu_service_rate'));
flo_su1_service_rate = str2num(getFromInput('flo_su1_service_rate'));
flo_su2_service_rate = str2num(getFromInput('flo_su2_service_rate'));

    string_array = 'array_out';
    string_matrix = 'matrix_into';
    string_extension_new = '_new.mat';
    
    string_total_channel_number = num2str(int_total_channel_number);
    string_pu_bandwidth = num2str(int_pu_bandwidth);
    string_su1_bandwidth = num2str(int_su1_bandwidth);
    string_su2_min_bandwidth = num2str(int_su2_min_bandwidth);
    string_su1_reserved_channels = num2str(int_su1_reserved_channels);
    string_su2_reserved_channels = num2str(int_su2_reserved_channels);
    
    string_array = strcat(string_array,'_bp=',string_pu_bandwidth,'_bs1=',string_su1_bandwidth,'_bs2=',string_su2_min_bandwidth,'_N=',string_total_channel_number,'_R1=',string_su1_reserved_channels,'_R2=',string_su2_reserved_channels,string_extension_new);
    string_matrix = strcat(string_matrix,'_bp=',string_pu_bandwidth,'_bs1=',string_su1_bandwidth,'_bs2=',string_su2_min_bandwidth,'_N=',string_total_channel_number,'_R1=',string_su1_reserved_channels,'_R2=',string_su2_reserved_channels,string_extension_new);
    
    save(string_array,'array_out_of_state')
    save(string_matrix,'matrix_into_state')


tic;
%MAIN
clear all;
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

global int_total_number_of_states

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
flo_pu_service_rate = flo_pu_service_rate*int_pu_bandwidth;
flo_su1_service_rate = str2num(getFromInput('flo_su1_service_rate'));
flo_su1_service_rate = flo_su1_service_rate*int_su1_bandwidth;
flo_su2_service_rate = str2num(getFromInput('flo_su2_service_rate'));
flo_su2_service_rate = flo_su2_service_rate*int_su2_min_bandwidth;

if (1)%check_inputs() == 1)
    array_out_of_state = trans_from_ijk();
    int_total_number_of_states = numel (array_out_of_state);
    
    matrix_into_state = trans_into_ijk(int_total_number_of_states);
    
    %save_current_array_and_matrix(array_out_of_state,matrix_into_state);
    
    vec_steady_state_prob = steady_state_prob (array_out_of_state,matrix_into_state);
    
    [flo_su1_blockingProbability,flo_su1_droppingProbability,flo_su1_spectrumUtilization,flo_su1_throughput] = su1_performance_metrics(vec_steady_state_prob);
    [flo_su2_blockingProbability,flo_su2_droppingProbability,flo_su2_spectrumUtilization,flo_su2_throughput] = su2_performance_metrics(vec_steady_state_prob);
   
    stats_from_model = [flo_su1_blockingProbability, flo_su2_blockingProbability, flo_su1_droppingProbability, flo_su2_droppingProbability,flo_su1_spectrumUtilization,flo_su2_spectrumUtilization,flo_su1_throughput,flo_su2_throughput];
    elapsed_time = toc
else
    disp('Input Error');
end
%save_current_array_and_matrix(array_out_of_state,matrix_into_state);
save('stats_from_model.mat', 'stats_from_model');

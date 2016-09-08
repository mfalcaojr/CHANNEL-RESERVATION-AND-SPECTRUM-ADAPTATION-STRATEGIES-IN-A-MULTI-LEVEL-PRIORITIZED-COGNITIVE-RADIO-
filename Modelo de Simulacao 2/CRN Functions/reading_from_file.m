function [] = reading_from_file()

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
global int_simulationTime

int_total_channel_number = str2double(getFromInput('int_total_channel_number'));
int_pu_bandwidth = str2double(getFromInput('int_pu_bandwidth'));
int_su1_bandwidth = str2double(getFromInput('int_su1_bandwidth'));
int_su2_min_bandwidth = str2double(getFromInput('int_su2_min_bandwidth'));
int_su2_max_bandwidth = str2double(getFromInput('int_su2_max_bandwidth'));
int_su1_reserved_channels = str2double(getFromInput('int_su1_reserved_channels'));
int_su2_reserved_channels = str2double(getFromInput('int_su2_reserved_channels'));
flo_pu_arrival_rate = str2double(getFromInput('flo_pu_arrival_rate'));
flo_su1_arrival_rate = str2double(getFromInput('flo_su1_arrival_rate'));
flo_su2_arrival_rate = str2double(getFromInput('flo_su2_arrival_rate'));
flo_pu_service_rate = str2double(getFromInput('flo_pu_service_rate'));
flo_pu_service_rate = flo_pu_service_rate*int_pu_bandwidth;
flo_su1_service_rate = str2double(getFromInput('flo_su1_service_rate'));
flo_su1_service_rate = flo_su1_service_rate*int_su1_bandwidth;
flo_su2_service_rate = str2double(getFromInput('flo_su2_service_rate'));
flo_su2_service_rate = flo_su2_service_rate*int_su2_min_bandwidth;
int_simulationTime = str2double(getFromInput('simulationTime'));
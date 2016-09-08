%{
Configs for 1st experiment

config1: 4 4 2 1 1 
config2: 4 4 1 2 2

config3: 4 1 4 2 2
config4: 4 2 4 1 1

config5: 4 2 1 4 4
config6: 4 1 2 4 4
%}

global string_configuration_number

string_configuration_number = '_config_one';


%config1
int_total_channel_number = 4;
int_pu_bandwidth = 4;
int_su1_bandwidth = 2;
int_su2_min_bandwidth = 1;
int_su2_max_bandwidth = 1;

switch_input_bandwidth_config (int_total_channel_number,int_pu_bandwidth,int_su1_bandwidth,int_su2_min_bandwidth,int_su2_max_bandwidth);
[matrix_of_mean_stats_from_simulation_config1, matrix_of_stats_from_model_config1] = run_simulation_and_model_various_pu_arr_rates ();
save('matrix_of_mean_stats_from_simulation_config1.mat', 'matrix_of_mean_stats_from_simulation_config1');
save('matrix_of_stats_from_model_config1.mat', 'matrix_of_stats_from_model_config1');
%}

%{
%config2
int_total_channel_number = 4;
int_pu_bandwidth = 4;
int_su1_bandwidth = 1;
int_su2_min_bandwidth = 2;
int_su2_max_bandwidth = 2;

switch_input_bandwidth_config (int_total_channel_number,int_pu_bandwidth,int_su1_bandwidth,int_su2_min_bandwidth,int_su2_max_bandwidth);
[matrix_of_mean_stats_from_simulation_config2, matrix_of_stats_from_model_config2] = run_simulation_and_model_various_pu_arr_rates ();

save('matrix_of_mean_stats_from_simulation_config2.mat', 'matrix_of_mean_stats_from_simulation_config2');
save('matrix_of_stats_from_model_config2.mat', 'matrix_of_stats_from_model_config2');
%}

%{
%config3
int_total_channel_number = 4;
int_pu_bandwidth = 1;
int_su1_bandwidth = 4;
int_su2_min_bandwidth = 2;
int_su2_max_bandwidth = 2;

switch_input_bandwidth_config (int_total_channel_number,int_pu_bandwidth,int_su1_bandwidth,int_su2_min_bandwidth,int_su2_max_bandwidth);
[matrix_of_mean_stats_from_simulation_config3, matrix_of_stats_from_model_config3] = run_simulation_and_model_various_pu_arr_rates ();

save('matrix_of_mean_stats_from_simulation_config3.mat', 'matrix_of_mean_stats_from_simulation_config3');
save('matrix_of_stats_from_model_config3.mat', 'matrix_of_stats_from_model_config3');
%}

%{
%config4
int_total_channel_number = 4;
int_pu_bandwidth = 2;
int_su1_bandwidth = 4;
int_su2_min_bandwidth = 1;
int_su2_max_bandwidth = 1;

switch_input_bandwidth_config (int_total_channel_number,int_pu_bandwidth,int_su1_bandwidth,int_su2_min_bandwidth,int_su2_max_bandwidth);
[matrix_of_mean_stats_from_simulation_config4, matrix_of_stats_from_model_config4] = run_simulation_and_model_various_pu_arr_rates ();

save('matrix_of_mean_stats_from_simulation_config4.mat', 'matrix_of_mean_stats_from_simulation_config4');
save('matrix_of_stats_from_model_config4.mat', 'matrix_of_stats_from_model_config4');
%}

%{
%config5
int_total_channel_number = 4;
int_pu_bandwidth = 2;
int_su1_bandwidth = 1;
int_su2_min_bandwidth = 4;
int_su2_max_bandwidth = 4;

switch_input_bandwidth_config (int_total_channel_number,int_pu_bandwidth,int_su1_bandwidth,int_su2_min_bandwidth,int_su2_max_bandwidth);
[matrix_of_mean_stats_from_simulation_config5, matrix_of_stats_from_model_config5] = run_simulation_and_model_various_pu_arr_rates ();

save('matrix_of_mean_stats_from_simulation_config5.mat', 'matrix_of_mean_stats_from_simulation_config5');
save('matrix_of_stats_from_model_config5.mat', 'matrix_of_stats_from_model_config5');
%}

%{
%config6
int_total_channel_number = 4;
int_pu_bandwidth = 1;
int_su1_bandwidth = 2;
int_su2_min_bandwidth = 4;
int_su2_max_bandwidth = 4;

switch_input_bandwidth_config (int_total_channel_number,int_pu_bandwidth,int_su1_bandwidth,int_su2_min_bandwidth,int_su2_max_bandwidth);
[matrix_of_mean_stats_from_simulation_config6, matrix_of_stats_from_model_config6] = run_simulation_and_model_various_pu_arr_rates ();

save('matrix_of_mean_stats_from_simulation_config6.mat', 'matrix_of_mean_stats_from_simulation_config6');
save('matrix_of_stats_from_model_config6.mat', 'matrix_of_stats_from_model_config6');
%}
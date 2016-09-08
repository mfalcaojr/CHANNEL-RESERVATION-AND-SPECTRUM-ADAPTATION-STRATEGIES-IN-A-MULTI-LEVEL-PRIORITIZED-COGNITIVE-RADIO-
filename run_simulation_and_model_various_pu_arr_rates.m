%experiment 1 run simulation and model within a range of PU ARRIVAL RATES 1 1.5 2 2.5 3 3.5 and 4
function [matrix_of_mean_stats_from_simulation, matrix_of_stats_from_model] = run_simulation_and_model_various_pu_arr_rates ()
global string_configuration_number
global pu_arr_rate_value

pu_arrival_rate = 1;%sempre começa com 1
switch_input_variable_pu_arrival_rate (pu_arrival_rate);
pu_arrival_rate_limit = 4.5;%era 4.5 mudei para 
index = 1;
pu_arrival_rate_step = 0.5;

matrix_of_mean_stats_from_simulation = zeros(7,8);
matrix_of_stats_from_model = zeros(7,8);

while (pu_arrival_rate < pu_arrival_rate_limit)
pu_arr_rate_value = pu_arrival_rate; 
%[matrix_of_stats_from_simulation,array_of_mean_simulation_stats_values] = run_simulation_100_times (); 

save workspace.mat   
run('/Users/mfalcaojr/Documents/MATLAB/vs21/main.m');
load('workspace.mat')  
load('/Users/mfalcaojr/Documents/MATLAB/vs21/stats_from_model.mat', 'stats_from_model');

    for column_number=1:8
        %matrix_of_mean_stats_from_simulation(index,column_number) = array_of_mean_simulation_stats_values(column_number);
        matrix_of_stats_from_model(index,column_number) = stats_from_model(column_number);
    end


pu_arrival_rate = pu_arrival_rate + pu_arrival_rate_step;
index = index + 1;
switch_input_variable_pu_arrival_rate (pu_arrival_rate);
end

%diff = abs (matrix_of_mean_stats_from_simulation - matrix_of_stats_from_model);

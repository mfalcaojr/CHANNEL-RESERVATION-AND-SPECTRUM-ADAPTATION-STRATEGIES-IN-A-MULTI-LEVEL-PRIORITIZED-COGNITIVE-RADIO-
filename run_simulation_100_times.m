function  [matrix_of_stats_from_simulation,array_of_mean_simulation_stats_values] = run_simulation_100_times () 

global string_configuration_number
global pu_arr_rate_value

n = 10;%era 10
matrix_of_stats_from_simulation = zeros (n,8);

while (n>0)
    save workspace.mat   
    run('/Users/mfalcaojr/Documents/MATLAB/run_simulation_one_time.m');
    load('workspace.mat')    
    load('/Users/mfalcaojr/Documents/MATLAB/Modelo de Simulacao 2/CRN Functions/stats_from_simulation.mat', 'stats_from_simulation');

        for column_number=1:8
            matrix_of_stats_from_simulation(n,column_number) = stats_from_simulation(column_number);
        end
        n = n-1;
end

pu_arr_rate_value = num2str(pu_arr_rate_value);

string_name_of_matrix_to_be_saved = strcat ('matrix_of_stats_from_simulation',string_configuration_number,'_pu_arr_rate=',pu_arr_rate_value,'.mat');

save(string_name_of_matrix_to_be_saved, 'matrix_of_stats_from_simulation');

array_of_mean_simulation_stats_values =  mean(matrix_of_stats_from_simulation,1);
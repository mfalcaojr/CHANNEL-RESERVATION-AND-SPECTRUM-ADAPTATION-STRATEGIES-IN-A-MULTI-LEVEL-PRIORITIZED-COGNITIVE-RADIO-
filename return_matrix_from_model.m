function matrix_from_model = return_matrix_from_model (string_config_number) 

if (strcmp('config_one',string_config_number))
    load('/Users/mfalcaojr/Documents/MATLAB/matrix_of_stats_from_model_config1.mat');
    matrix_model_config1 = matrix_of_stats_from_model_config1;
    matrix_from_model = matrix_model_config1;
end

if (strcmp('config_two',string_config_number))
    load('/Users/mfalcaojr/Documents/MATLAB/matrix_of_stats_from_model_config2.mat');
    matrix_model_config2 = matrix_of_stats_from_model_config2;
    matrix_from_model =  matrix_model_config2;
end

if (strcmp('config_three',string_config_number))
    load('/Users/mfalcaojr/Documents/MATLAB/matrix_of_stats_from_model_config3.mat');
    matrix_model_config3 = matrix_of_stats_from_model_config3;
    matrix_from_model = matrix_model_config3;
end

if (strcmp('config_four',string_config_number))
    load('/Users/mfalcaojr/Documents/MATLAB/matrix_of_stats_from_model_config4.mat');
    matrix_model_config4 = matrix_of_stats_from_model_config4;
    matrix_from_model = matrix_model_config4;
end

if (strcmp('config_five',string_config_number))
    load('/Users/mfalcaojr/Documents/MATLAB/matrix_of_stats_from_model_config5.mat');
    matrix_model_config5 = matrix_of_stats_from_model_config5;
    matrix_from_model = matrix_model_config5;
end

if (strcmp('config_six',string_config_number))
    load('/Users/mfalcaojr/Documents/MATLAB/matrix_of_stats_from_model_config6.mat');
    matrix_model_config6 = matrix_of_stats_from_model_config6;
    matrix_from_model = matrix_model_config6;
end

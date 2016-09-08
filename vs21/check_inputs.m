function bool_answer = check_inputs()

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



%ESTÁ ACEITANDO TODOS OS TAMANHOS DE BANDA. SEM RESTRIÇÃO.VERIFICANDO SE
%TODAS AS BANDAS E NUM DE CANAIS SAO INTEIROS
%TODOS ESTÃO ABAIXO DO NUMERO TOTAL DE CANAIS
%SE SÃO MULTIPLOS ENTRE SI E ENTRE O O NUMERO DE CANAIS
%SE BANDA SU2_MAX É MAIOR OU IGUAL A BANDA SU2_MIN

%if ((rem(int_total_channel_number,1) == 0) && (rem(int_pu_bandwidth,1) == 0) && (rem(int_su1_bandwidth,1) == 0) && (rem(int_su2_min_bandwidth,1)== 0) && (rem(int_su2_max_bandwidth,1)==0))
    if (int_pu_bandwidth <= int_total_channel_number)
        if(int_su1_bandwidth <= int_total_channel_number)
            if(int_su2_min_bandwidth <= int_total_channel_number)
                if(int_su2_max_bandwidth <= int_total_channel_number)
                    if((rem(int_total_channel_number,int_pu_bandwidth) == 0))
                        if((rem(int_total_channel_number,int_su1_bandwidth) == 0))
                            if((rem(int_total_channel_number,int_su2_min_bandwidth)==0))
                                if((rem(int_pu_bandwidth,int_su1_bandwidth) == 0))
                                     if((rem(int_pu_bandwidth,int_su2_min_bandwidth) == 0))
                                         if((rem(int_su1_bandwidth,int_su2_min_bandwidth)==0))
                                             if((int_su2_max_bandwidth >= int_su2_min_bandwidth))
                                                bool_answer = 1;
                                             else
                                                bool_answer = 0;
                                             end
                                         else
                                            bool_answer = 0;
                                         end
                                     else
                                        bool_answer = 0;
                                     end
                                else
                                    bool_answer = 0;
                                end
                            else
                                bool_answer = 0;
                            end

                        else
                             bool_answer = 0;
                        end
                    else
                        bool_answer = 0;
                    end
                else
                     bool_answer = 0;
                end
            else
                bool_answer = 0;
            end
        else
            bool_answer = 0;
        end
    else
        bool_answer = 0;
    end
%else
%  bool_answer = 0;  
%end




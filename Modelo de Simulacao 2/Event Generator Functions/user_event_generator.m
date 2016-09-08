%event generator for PU
function [struct_user_event] = user_event_generator(user_type, last_id)

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

struct_user_event = struct('type',[],'id',[],'service_time',[],'min_bandwidth',[],'max_bandwidth',[],'occurrence_time',[],'departure_time',[]);

if (strcmp(user_type,'primary_user'))
    arrival_rate = flo_pu_arrival_rate;  
    type = 'p'; 
    service_rate = flo_pu_service_rate;
    min_bandwidth = int_pu_bandwidth;
    max_bandwidth = int_pu_bandwidth;
    
end

if (strcmp(user_type,'secondary_user1'))
    arrival_rate = flo_su1_arrival_rate;  
    type = 's'; 
    service_rate = flo_su1_service_rate;
    min_bandwidth = int_su1_bandwidth;
    max_bandwidth = int_su1_bandwidth;
end

if (strcmp(user_type,'secondary_user2'))
    arrival_rate = flo_su2_arrival_rate;  
    type = 'y'; 
    service_rate = flo_su2_service_rate;
    min_bandwidth = int_su2_min_bandwidth;
    max_bandwidth = int_su2_max_bandwidth;
end

occurrence_time =0;
id = last_id;
index = 0;

while (occurrence_time < int_simulationTime) 
    if(arrival_rate > 0)
            inter_arrival_times = exprnd((1/arrival_rate)); %tempoEntreChegadas é distribuido exponencialmente de acordo com o valor gerado da poisson da taxa de chegada.
            occurrence_time = occurrence_time + inter_arrival_times;
            
            if(occurrence_time < int_simulationTime)
                
                id = id + 1;
                index = index + 1;
                
				struct_user_event(index).type = type;
				struct_user_event(index).id = id;
				
                struct_user_event(index).occurrence_time = occurrence_time;
			    struct_user_event(index).service_time = exprnd((1/service_rate),1,1);
				
                struct_user_event(index).departure_time = struct_user_event(index).occurrence_time + struct_user_event(index).service_time;
                
                struct_user_event(index).min_bandwidth = min_bandwidth;
                struct_user_event(index).max_bandwidth = max_bandwidth;
            else
                break
            end
    end
end
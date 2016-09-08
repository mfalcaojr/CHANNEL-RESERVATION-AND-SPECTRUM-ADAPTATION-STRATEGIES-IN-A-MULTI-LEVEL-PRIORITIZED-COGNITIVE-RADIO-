clear all;

load('/Users/mfalcaojr/Documents/MATLAB/Modelo de Simulacao 2/CRN Functions/all_sorted_events.mat', 'all_sorted_events');
load('/Users/mfalcaojr/Documents/MATLAB/Modelo de Simulacao 2/CRN Functions/total_amount_of_events.mat', 'total_amount_of_events');
event_amount = total_amount_of_events;

%-------System Inputs Beginning----------
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
%-------System Inputs End----------

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

%-------Stats Variables----------
global acumulated_su1_spectrum_utilization 
global acumulated_su2_spectrum_utilization 
  
blocking_count_su2 = 0;
blocking_count_su1 = 0;

dropping_count_su1 = 0;
dropping_count_su2 = 0;

acumulated_su1_spectrum_utilization = 0;
acumulated_su2_spectrum_utilization = 0;

throughput_su1_count = 0;
throughput_su2_count = 0;

%-------Stats Variables End----------

reading_from_file();

amount_of_arriving_pu_events = 0;
amount_of_arriving_su1_events = 0;
amount_of_arriving_su2_events = 0;

vec_active_events = struct('type',{},'id',{},'service_time',{},'min_bandwidth',{},'max_bandwidth',{},'occurrence_time',{},'departure_time',{});

event_index = 1;

global last_event_time

last_event_time = 0;

while (event_index <= event_amount)   
       
   arriving_event = all_sorted_events(event_index);
   [next_departing_event_time,next_departing_event,vec_active_events] = events_being_served(vec_active_events);
   
   if(arriving_event.occurrence_time < next_departing_event_time)

      elapsed_time = arriving_event.occurrence_time - last_event_time;
      %Compute Spectrum Utilization
      [int_active_primary_users,int_active_secondary1_users, int_active_secondary2_users] = count_number_of_active_users (vec_active_events);
      acumulated_su2_spectrum_utilization = acumulated_su2_spectrum_utilization + ((int_active_secondary2_users*int_su2_min_bandwidth*elapsed_time)/int_total_channel_number);
      acumulated_su1_spectrum_utilization =  acumulated_su1_spectrum_utilization + ((int_active_secondary1_users*int_su1_bandwidth*elapsed_time)/int_total_channel_number);       
       
      
      if (arriving_event.type == 'p')
                 amount_of_arriving_pu_events = amount_of_arriving_pu_events +1;
          [vec_active_events, dropping_count_su1, dropping_count_su2] = pu_arriving_case (vec_active_events, arriving_event, dropping_count_su1, dropping_count_su2);
      elseif (arriving_event.type == 's')
                 amount_of_arriving_su1_events = amount_of_arriving_su1_events +1;
          [vec_active_events, blocking_count_su1,dropping_count_su2] = su1_arriving_case (vec_active_events, arriving_event, blocking_count_su1,dropping_count_su2);
      elseif (arriving_event.type == 'y')
                 amount_of_arriving_su2_events = amount_of_arriving_su2_events +1;
          [vec_active_events, blocking_count_su2] = su2_arriving_case (vec_active_events, arriving_event, blocking_count_su2);
      end
           
    last_event_time = arriving_event.occurrence_time;  
    event_index = event_index + 1;  
   else
           %remove_finished event
           if (vec_active_events(1).id == next_departing_event.id)
               %fprintf(fileID,'The next departing event id: and time is: %f\n','next_departing_event.id','next_departing_event_time');
               
  
               elapsed_time = vec_active_events(1).departure_time - last_event_time;
               %Compute Spectrum Utilization
               [int_active_primary_users,int_active_secondary1_users, int_active_secondary2_users] = count_number_of_active_users (vec_active_events);
               acumulated_su2_spectrum_utilization = acumulated_su2_spectrum_utilization + ((int_active_secondary2_users*int_su2_min_bandwidth*elapsed_time)/int_total_channel_number);
               acumulated_su1_spectrum_utilization =  acumulated_su1_spectrum_utilization + ((int_active_secondary1_users*int_su1_bandwidth*elapsed_time)/int_total_channel_number);

               if (vec_active_events(1).type == 's')
                  throughput_su1_count = throughput_su1_count +1;
               end
               
               if (vec_active_events(1).type == 'y')
                  throughput_su2_count = throughput_su2_count +1;
               end
               
               
               event_to_be_finished  = vec_active_events(1); 
               vec_active_events(1) = [];   
               last_event_time = event_to_be_finished.departure_time;
           end
   end   
end

blocking_probability_su1 = blocking_count_su1/amount_of_arriving_su1_events;
blocking_probability_su2 = blocking_count_su2/amount_of_arriving_su2_events;

dropping_probability_su1 = dropping_count_su1/(amount_of_arriving_su1_events -  blocking_count_su1);
dropping_probability_su2 = dropping_count_su2/(amount_of_arriving_su2_events - blocking_count_su2);

spectrum_utilization_su1 = acumulated_su1_spectrum_utilization/int_simulationTime;
spectrum_utilization_su2 = acumulated_su2_spectrum_utilization/int_simulationTime;

throughput_su1 = throughput_su1_count/int_simulationTime;
throughput_su2 = throughput_su2_count/int_simulationTime;

stats_from_simulation = [blocking_probability_su1, blocking_probability_su2, dropping_probability_su1, dropping_probability_su2, spectrum_utilization_su1, spectrum_utilization_su2,throughput_su1,throughput_su2];
save('stats_from_simulation.mat', 'stats_from_simulation');
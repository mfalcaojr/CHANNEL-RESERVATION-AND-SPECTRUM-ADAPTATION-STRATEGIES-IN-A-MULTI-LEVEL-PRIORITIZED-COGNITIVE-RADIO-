function vec_active_events = insert_user (arriving_event, vec_active_events)    

global int_su2_min_bandwidth
global int_su1_bandwidth
global int_total_channel_number

number_of_events_in_vector = numel(vec_active_events);
vec_active_events (number_of_events_in_vector + 1) = arriving_event;


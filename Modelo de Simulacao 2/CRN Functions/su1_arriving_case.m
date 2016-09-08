function [vec_active_events, blocking_count_su1,dropping_count_su2] = su1_arriving_case (vec_active_events, arriving_event, blocking_count_su1,dropping_count_su2)

global int_total_channel_number
global int_pu_bandwidth
global int_su1_bandwidth
global int_su2_min_bandwidth
global int_su1_reserved_channels

has_idle_space = check_available_space (arriving_event, vec_active_events);

if (has_idle_space == 1)
    vec_active_events = insert_user (arriving_event, vec_active_events);
elseif (has_idle_space == 0) 
    
    [int_active_primary_users,int_active_secondary1_users, int_active_secondary2_users] = count_number_of_active_users (vec_active_events);
    idle = int_total_channel_number - (int_active_primary_users*int_pu_bandwidth ) - (int_active_secondary1_users*int_su1_bandwidth) - (int_active_secondary2_users*int_su2_min_bandwidth);
    
    if((int_active_primary_users*int_pu_bandwidth) + ((int_active_secondary1_users+1)*int_su1_bandwidth) + int_su1_reserved_channels > int_total_channel_number)
        blocking_count_su1 = blocking_count_su1 + 1;
        %blocking SU1
    else
        if(idle >= int_su1_bandwidth)
           vec_active_events = insert_user (arriving_event, vec_active_events); 
        
        %SU1 WILL BE INSERTED ANYWAY!
        elseif(idle < int_su1_bandwidth)
            if((int_active_secondary2_users*int_su2_min_bandwidth) + idle >= int_su1_bandwidth)
                
                amount_of_su2_to_be_removed = calculate_amount_of_su2_to_be_removed(vec_active_events, arriving_event);
                
                [vec_active_events,dropping_count_su2] = drop_su2(amount_of_su2_to_be_removed,vec_active_events,dropping_count_su2);
                
                %dropping_count_su2 = dropping_count_su2 + amount_of_su2_to_be_removed;
                %vec_active_events = drop_users_linearly ('y', vec_active_events, amount_of_su2_to_be_removed);
                
                vec_active_events = insert_user (arriving_event, vec_active_events);
            end
        end
    end
end

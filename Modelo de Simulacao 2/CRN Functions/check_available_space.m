function bool_answer = check_available_space (arriving_event, vec_active_events)

global int_total_channel_number
global int_pu_bandwidth
global int_su1_bandwidth
global int_su2_min_bandwidth
global int_su1_reserved_channels
global int_su2_reserved_channels

bool_answer = 0;
[int_active_primary_users,int_active_secondary1_users, int_active_secondary2_users] = count_number_of_active_users (vec_active_events);

if (arriving_event.type == 'p')
     available_space = int_total_channel_number - (int_active_primary_users*int_pu_bandwidth) - (int_active_secondary1_users*int_su1_bandwidth) - (int_active_secondary2_users*int_su2_min_bandwidth);
    if (available_space >= int_pu_bandwidth)
        bool_answer = 1;
    end
elseif (arriving_event.type == 's')
     available_space = int_total_channel_number - (int_active_primary_users*int_pu_bandwidth) - (int_active_secondary1_users*int_su1_bandwidth) - (int_active_secondary2_users*int_su2_min_bandwidth);
     if (available_space >= int_su1_bandwidth + int_su1_reserved_channels)
        bool_answer = 1;
     end
elseif (arriving_event.type == 'y')
     available_space = int_total_channel_number - (int_active_primary_users*int_pu_bandwidth) - (int_active_secondary1_users*int_su1_bandwidth) - (int_active_secondary2_users*int_su2_min_bandwidth);
     if (available_space >= int_su2_min_bandwidth + int_su2_reserved_channels)
        bool_answer = 1;
     end
end

function amount_of_su2_to_be_removed = calculate_amount_of_su2_to_be_removed(vec_active_events, arriving_event)

global int_total_channel_number
global int_pu_bandwidth
global int_su1_bandwidth
global int_su2_min_bandwidth
global int_su1_reserved_channels

if (arriving_event.type ==  'p')
    user_bandwidth = int_pu_bandwidth;
elseif(arriving_event.type ==  's')
    %user_bandwidth = int_su1_bandwidth + int_su1_reserved_channels;
    user_bandwidth = int_su1_bandwidth;
end

amount_of_su2_to_be_removed = 0;

[int_active_primary_users,int_active_secondary1_users, int_active_secondary2_users] = count_number_of_active_users (vec_active_events);

temp_int_active_secondary2_users = int_active_secondary2_users;

while ((temp_int_active_secondary2_users >= 0) && ((int_total_channel_number - (int_active_primary_users*int_pu_bandwidth) - (int_active_secondary1_users*int_su1_bandwidth) - (temp_int_active_secondary2_users*int_su2_min_bandwidth)) < user_bandwidth))
    temp_int_active_secondary2_users = temp_int_active_secondary2_users - 1;
    amount_of_su2_to_be_removed = amount_of_su2_to_be_removed + 1;
end
function amount_of_su1_to_be_removed = calculate_amount_of_su1_to_be_removed(vec_active_events)

global int_total_channel_number
global int_pu_bandwidth
global int_su1_bandwidth

amount_of_su1_to_be_removed = 0;

[int_active_primary_users,int_active_secondary1_users, int_active_secondary2_users] = count_number_of_active_users (vec_active_events);

temp_int_active_secondary1_users = int_active_secondary1_users;

while ((temp_int_active_secondary1_users >= 0) && ((int_total_channel_number - (int_active_primary_users*int_pu_bandwidth) - (temp_int_active_secondary1_users*int_su1_bandwidth)) < int_pu_bandwidth))
    temp_int_active_secondary1_users = temp_int_active_secondary1_users - 1;
    amount_of_su1_to_be_removed = amount_of_su1_to_be_removed + 1;
end
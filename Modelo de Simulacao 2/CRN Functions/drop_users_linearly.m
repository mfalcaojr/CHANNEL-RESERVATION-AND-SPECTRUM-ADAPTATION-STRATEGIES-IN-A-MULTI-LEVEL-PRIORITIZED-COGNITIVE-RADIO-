function vec_active_events = drop_users_linearly (event_type, vec_active_events, amount_of_users_to_be_removed)

[int_active_primary_users,int_active_secondary1_users, int_active_secondary2_users] = count_number_of_active_users (vec_active_events);

temp_int_active_secondary2_users = int_active_secondary2_users;

total_amount_of_elements = numel (vec_active_events);

array_of_positions_to_be_removed = [];
index_of_array_of_positions_to_be_removed = 0;

    for index=1:total_amount_of_elements
          if(temp_int_active_secondary2_users > 0)
              if(amount_of_users_to_be_removed > 0)
                   if(vec_active_events(index).type == event_type)
                             index_of_array_of_positions_to_be_removed = index_of_array_of_positions_to_be_removed +1;
                             array_of_positions_to_be_removed(index_of_array_of_positions_to_be_removed) = index;
                             temp_int_active_secondary2_users = temp_int_active_secondary2_users - 1;
                             amount_of_users_to_be_removed = amount_of_users_to_be_removed -1;
                   end
              end
          end
    end

vec_active_events(array_of_positions_to_be_removed) = [];


function [vec_active_events,dropping_count_su2] = drop_every_active_su2(vec_active_events, dropping_count_su2)

[int_active_primary_users,int_active_secondary1_users, int_active_secondary2_users] = count_number_of_active_users (vec_active_events);

temp_int_active_secondary2_users = int_active_secondary2_users;

total_amount_of_elements = numel (vec_active_events);

array_of_positions_to_be_removed = [];
index_of_array_of_positions_to_be_removed = 0;


    for index=1:total_amount_of_elements
          if(temp_int_active_secondary2_users > 0)
               if(vec_active_events(index).type == 'y')
                         index_of_array_of_positions_to_be_removed = index_of_array_of_positions_to_be_removed +1;
                         array_of_positions_to_be_removed(index_of_array_of_positions_to_be_removed) = index;
                         temp_int_active_secondary2_users = temp_int_active_secondary2_users - 1;
                         dropping_count_su2 = dropping_count_su2 + 1;
               end
          end
    end

    vec_active_events(array_of_positions_to_be_removed) = [];
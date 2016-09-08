function [vec_active_events,dropping_count_su1] = drop_su1(amount_of_su1_to_be_removed,vec_active_events,dropping_count_su1)

[int_active_primary_users,int_active_secondary1_users, int_active_secondary2_users] = count_number_of_active_users (vec_active_events);

total_amount_of_elements = numel (vec_active_events);
su1_element = 0;

array_of_su1_to_be_removed = random_array_of_su2_to_be_removed (amount_of_su1_to_be_removed,int_active_secondary1_users);

array_of_positions_to_be_removed = [];
index_of_array_of_positions_to_be_removed = 0;

index_of_array_of_su1_to_be_removed = 1;

    if (total_amount_of_elements > 0)
        for index=1:total_amount_of_elements
            if(amount_of_su1_to_be_removed > 0)
                    if(vec_active_events(index).type == 's')
                       su1_element = su1_element + 1;
                           if (su1_element == array_of_su1_to_be_removed(index_of_array_of_su1_to_be_removed))
                               index_of_array_of_su1_to_be_removed = index_of_array_of_su1_to_be_removed + 1;
                               index_of_array_of_positions_to_be_removed = index_of_array_of_positions_to_be_removed + 1;
                               array_of_positions_to_be_removed (index_of_array_of_positions_to_be_removed) = index;                          
                               dropping_count_su1 = dropping_count_su1 + 1;
                               amount_of_su1_to_be_removed = amount_of_su1_to_be_removed - 1;
                           end
                    end
             end
        end
    end

    vec_active_events(array_of_positions_to_be_removed) = [];
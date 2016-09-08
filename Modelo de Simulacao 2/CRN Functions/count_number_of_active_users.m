function [int_active_primary_users,int_active_secondary1_users, int_active_secondary2_users] = count_number_of_active_users (vec_active_events)

int_active_primary_users = 0;
int_active_secondary1_users = 0;
int_active_secondary2_users = 0;

total_amount_of_elements = numel (vec_active_events);
if (total_amount_of_elements > 0)
    for index=1:total_amount_of_elements
        event = vec_active_events (index);
        if (event.type == 'p')
            int_active_primary_users = int_active_primary_users + 1;
        end

        if(event.type == 's')
            int_active_secondary1_users = int_active_secondary1_users + 1;
        end

        if(event.type == 'y')
            int_active_secondary2_users =  int_active_secondary2_users + 1;
        end
    end
else
    int_active_primary_users = 0;
    int_active_secondary1_users = 0;
    int_active_secondary2_users = 0;
end
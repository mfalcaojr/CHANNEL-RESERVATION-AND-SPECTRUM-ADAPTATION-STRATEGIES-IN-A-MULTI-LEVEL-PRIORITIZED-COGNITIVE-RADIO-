function array_of_su2_to_be_removed = random_array_of_su2_to_be_removed (amount_of_su2_to_be_removed,int_active_secondary2_users)

array_of_su2_to_be_removed = zeros(1, amount_of_su2_to_be_removed);

array_index = 1;

while (amount_of_su2_to_be_removed > 0)
    random_su2_event_number_to_be_dropped = randi(int_active_secondary2_users,1);

    if (isempty(find(array_of_su2_to_be_removed == random_su2_event_number_to_be_dropped)) == 1)
    array_of_su2_to_be_removed(array_index) = random_su2_event_number_to_be_dropped;
    array_index = array_index + 1;
    amount_of_su2_to_be_removed = amount_of_su2_to_be_removed -1;
    end
end

array_of_su2_to_be_removed = sort(array_of_su2_to_be_removed);
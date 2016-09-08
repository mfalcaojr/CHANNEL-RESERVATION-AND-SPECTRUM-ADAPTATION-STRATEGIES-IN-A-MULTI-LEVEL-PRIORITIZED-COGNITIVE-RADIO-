function [vec_active_events, blocking_count_su2] = su2_arriving_case (vec_active_events, arriving_event, blocking_count_su2)

has_idle_space = check_available_space (arriving_event, vec_active_events);

if (has_idle_space == 1)
    vec_active_events = insert_user (arriving_event, vec_active_events);
elseif (has_idle_space == 0) 
    blocking_count_su2 = blocking_count_su2 + 1;
end

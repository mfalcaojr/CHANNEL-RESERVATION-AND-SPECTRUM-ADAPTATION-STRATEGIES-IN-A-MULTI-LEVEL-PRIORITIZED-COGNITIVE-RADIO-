function [next_departing_event_time,next_departing_event, vec_active_events] = events_being_served(vec_active_events)

if (isempty(vec_active_events))
    next_departing_event_time = Inf;
    next_departing_event = 'no_events_being_served';
else
    vec_active_events = nestedSortStruct(vec_active_events, 'departure_time');
    next_departing_event_time = vec_active_events(1).departure_time;
    next_departing_event = vec_active_events(1);
end

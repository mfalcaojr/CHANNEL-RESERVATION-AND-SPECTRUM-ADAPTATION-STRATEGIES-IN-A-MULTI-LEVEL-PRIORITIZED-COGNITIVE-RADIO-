clear all;

struct_all_info = struct('total_channel_number',[],'pu_arrival_rate',[],'su1_arrival_rate',[],'su2_arrival_rate',[],'pu_service_rate',[],'su1_service_rate',[],'su2_service_rate',[],'pu_bandwidth',[],'su1_bandwidth',[],'su2_min_bandwidth',[],'su2_max_bandwidth',[],'su1_reserved_channels',[],'su2_reserved_channels',[],'qtdPrimario',[],'qtdSecundario1',[],'qtdSecundario2',[], 'simulationTime', []);

%-----------------------------------------------------Initializing...----------------------------------------------------

global int_total_channel_number
global int_pu_bandwidth
global int_su1_bandwidth
global int_su2_min_bandwidth
global int_su2_max_bandwidth
global int_su1_reserved_channels
global int_su2_reserved_channels
global flo_pu_arrival_rate
global flo_su1_arrival_rate
global flo_su2_arrival_rate 
global flo_pu_service_rate 
global flo_su1_service_rate 
global flo_su2_service_rate
global int_simulationTime

int_total_channel_number = str2double(getFromInput('int_total_channel_number'));
int_pu_bandwidth = str2double(getFromInput('int_pu_bandwidth'));
int_su1_bandwidth = str2double(getFromInput('int_su1_bandwidth'));
int_su2_min_bandwidth = str2double(getFromInput('int_su2_min_bandwidth'));
int_su2_max_bandwidth = str2double(getFromInput('int_su2_max_bandwidth'));
int_su1_reserved_channels = str2double(getFromInput('int_su1_reserved_channels'));
int_su2_reserved_channels = str2double(getFromInput('int_su2_reserved_channels'));
flo_pu_arrival_rate = str2double(getFromInput('flo_pu_arrival_rate'));
flo_su1_arrival_rate = str2double(getFromInput('flo_su1_arrival_rate'));
flo_su2_arrival_rate = str2double(getFromInput('flo_su2_arrival_rate'));
flo_pu_service_rate = str2double(getFromInput('flo_pu_service_rate'));
flo_pu_service_rate = flo_pu_service_rate*int_pu_bandwidth;
flo_su1_service_rate = str2double(getFromInput('flo_su1_service_rate'));
flo_su1_service_rate = flo_su1_service_rate*int_su1_bandwidth;
flo_su2_service_rate = str2double(getFromInput('flo_su2_service_rate'));
flo_su2_service_rate = flo_su2_service_rate*int_su2_min_bandwidth;
int_simulationTime = str2double(getFromInput('simulationTime'));

struct_all_info.total_channel_number = int_total_channel_number;
struct_all_info.pu_arrival_rate = flo_pu_arrival_rate;
struct_all_info.su1_arrival_rate = flo_su1_arrival_rate;
struct_all_info.su2_arrival_rate = flo_su2_arrival_rate;
struct_all_info.pu_service_rate = flo_pu_service_rate;
struct_all_info.su1_service_rate = flo_su1_service_rate;
struct_all_info.su2_service_rate = flo_su2_service_rate;
struct_all_info.pu_bandwidth = int_pu_bandwidth;
struct_all_info.su1_bandwidth = int_su1_bandwidth;
struct_all_info.su2_min_bandwidth = int_su2_min_bandwidth;
struct_all_info.su2_max_bandwidth = int_su2_max_bandwidth;
struct_all_info.int_su1_reserved_channels = int_su1_reserved_channels;
struct_all_info.int_su2_reserved_channels = int_su2_reserved_channels;
struct_all_info.simulationTime = int_simulationTime;


%------------------------------------------------------Primary User--------------------------------------------------------------
id = 0;
vec_struct_events_pu = user_event_generator('primary_user',id);
%------------------------------------------------------SECUNDARIO1--------------------------------------------------------------

id = vec_struct_events_pu(end).id;
vec_struct_events_su1 = user_event_generator('secondary_user1',id);

%------------------------------------------------------SECUNDARIO2--------------------------------------------------------------
id = vec_struct_events_su1(end).id;
vec_struct_events_su2 = user_event_generator('secondary_user2',id);
%---------------------------------------------------------ORDENAMENTO---------------------------------------------------

last_id = vec_struct_events_su2(end).id;

concat = [vec_struct_events_pu, vec_struct_events_su1, vec_struct_events_su2];

all_sorted_events = nestedSortStruct(concat, 'occurrence_time');

total_amount_of_events = numel(all_sorted_events)

save('/Users/mfalcaojr/Documents/MATLAB/Modelo de Simulacao 2/CRN Functions/all_sorted_events.mat', 'all_sorted_events');
save('/Users/mfalcaojr/Documents/MATLAB/Modelo de Simulacao 2/CRN Functions/total_amount_of_events.mat', 'total_amount_of_events');
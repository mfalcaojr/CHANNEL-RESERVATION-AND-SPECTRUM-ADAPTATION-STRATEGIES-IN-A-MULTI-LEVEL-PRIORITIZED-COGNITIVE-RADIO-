function free = freeResources (a,b,c)

global int_total_channel_number
global int_pu_bandwidth
global int_su1_bandwidth
global int_su2_min_bandwidth

free = int_total_channel_number - (a*int_pu_bandwidth) - (b*int_su1_bandwidth) - (c*int_su2_min_bandwidth);

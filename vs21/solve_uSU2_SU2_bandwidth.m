function [u_su2, su2_bandwidth] = solve_uSU2_SU2_bandwidth (pu_amount, su1_amount, su2_amount)

global int_total_channel_number
global int_pu_bandwidth
global int_su1_bandwidth
global int_su2_min_bandwidth
global int_su2_max_bandwidth

global int_su2_reserved_channels
 
global flo_su2_service_rate

u_su2 = 0;
su2_bandwidth = 0;

if ((0 <= pu_amount + su1_amount) && ((pu_amount*int_pu_bandwidth) + (su1_amount*int_su1_bandwidth) <= floor (int_total_channel_number - int_su2_min_bandwidth)))
    if ((1 <= su2_amount) && (su2_amount <= floor((int_total_channel_number - int_su2_reserved_channels)/int_su2_min_bandwidth)))
        su2_bandwidth = min (int_su2_max_bandwidth, max(int_su2_min_bandwidth, ((int_total_channel_number - (pu_amount*int_pu_bandwidth) - (su1_amount*int_su1_bandwidth))/su2_amount))); 
        u_su2 =  (su2_bandwidth*flo_su2_service_rate)/int_su2_min_bandwidth;
    end
else 
    su2_bandwidth = 0;
    u_su2 = 0;
end
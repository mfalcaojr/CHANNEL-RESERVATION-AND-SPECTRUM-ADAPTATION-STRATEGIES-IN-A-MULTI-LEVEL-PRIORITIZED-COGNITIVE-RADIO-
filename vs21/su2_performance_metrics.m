function [flo_su2_blockingProbability,flo_su2_droppingProbability,flo_su2_spectrumUtilization,flo_su2_throughput] = su2_performance_metrics(steady_state_prob)

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

flo_su2_blockingProbability = 0;

sum_dp_su2_part1 = 0;
sum_dp_su2_part2 = 0;

sum_spectrumUtilization_su2 = 0;

sum_trhoughput_su2 = 0;

index = 0;
for i=0:floor(int_total_channel_number/int_pu_bandwidth)
    for j=0:floor((int_total_channel_number - int_su1_reserved_channels)/int_su1_bandwidth)
        for k=0:floor((int_total_channel_number - int_su2_reserved_channels)/int_su2_min_bandwidth)
            if((i*int_pu_bandwidth)+(j*int_su1_bandwidth)+(k*int_su2_min_bandwidth) <= int_total_channel_number)
                index = index +1;
                
                 %-----Blocking---%
                if ((i*int_pu_bandwidth + (j*int_su1_bandwidth) + ((k+1)*int_su2_min_bandwidth)) > int_total_channel_number - int_su2_reserved_channels)
                    flo_su2_blockingProbability = flo_su2_blockingProbability + steady_state_prob (index);
                end
                 
                 %----Dropping----%
                idle = int_total_channel_number - i*int_pu_bandwidth - j*int_su1_bandwidth - k*int_su2_min_bandwidth;
                
                if(((i+1)*int_pu_bandwidth) <= int_total_channel_number)
                    %part1 Dropping due to PU arrival
                    if(((i+1)*int_pu_bandwidth)+(j*int_su1_bandwidth)+(k*int_su2_min_bandwidth) > int_total_channel_number)
                       z = ceil((-idle + int_pu_bandwidth)/int_su2_min_bandwidth);
                       if (k>0 && z>0)
                           if(z > k)
                              z = k;
                           end
                          sum_dp_su2_part1 = sum_dp_su2_part1 + (flo_pu_arrival_rate*steady_state_prob(index)*z);
                       end
                    end
                end
                
                if(i*int_pu_bandwidth + (j+1)*int_su1_bandwidth <= int_total_channel_number - int_su1_reserved_channels)
                       %part 2 Dropping due to SU1 arrival
                        if((i*int_pu_bandwidth)+((j+1)*int_su1_bandwidth)+(k*int_su2_min_bandwidth) > int_total_channel_number)
                           z = ceil((-idle + int_su1_bandwidth)/int_su2_min_bandwidth);
                           if (k>0 && z>0)
                              if(z > k)
                                 z = k;
                              end
                              sum_dp_su2_part2 = sum_dp_su2_part2 + (flo_su1_arrival_rate*steady_state_prob(index)*z);
                           end
                        end
                end
                  
                  %----Spectrum Utilization----%
                [u_su2 , su2_bandwidth ]= solve_uSU2_SU2_bandwidth(i,j,k);
                %sum_spectrumUtilization_su2 = sum_spectrumUtilization_su2 + (k*su2_bandwidth*steady_state_prob(index));
                  %----Throughput----%
                 
                  if (su2_bandwidth == int_su2_min_bandwidth)
                      sum_trhoughput_su2 = sum_trhoughput_su2 + (k*flo_su2_service_rate*steady_state_prob(index));
                      sum_spectrumUtilization_su2 = sum_spectrumUtilization_su2 + (k*int_su2_min_bandwidth*steady_state_prob(index));
                  else
                      sum_trhoughput_su2 = sum_trhoughput_su2 + (k*u_su2*steady_state_prob(index));
                      sum_spectrumUtilization_su2 = sum_spectrumUtilization_su2 + (k*su2_bandwidth*steady_state_prob(index));
                  end
            end
        end
    end
end


flo_su2_blockingProbability;

flo_su2_droppingProbability = (sum_dp_su2_part1 + sum_dp_su2_part2)/((1 - flo_su2_blockingProbability)*flo_su2_arrival_rate);

flo_su2_spectrumUtilization = sum_spectrumUtilization_su2/int_total_channel_number;

flo_su2_throughput = sum_trhoughput_su2;
function [flo_su1_blockingProbability,flo_su1_droppingProbability,flo_su1_spectrumUtilization,flo_su1_throughput] = su1_performance_metrics(steady_state_prob)

global int_total_channel_number
global int_pu_bandwidth
global int_su1_bandwidth
global int_su2_min_bandwidth

global int_su1_reserved_channels
global int_su2_reserved_channels
global flo_pu_arrival_rate
global flo_su1_arrival_rate

global flo_su1_service_rate 

flo_su1_blockingProbability = 0;

sum_dp_su1 = 0;

sum_spectrumUtilization_su1 = 0;

sum_trhoughput_su1=0;

index = 0;
for i=0:floor(int_total_channel_number/int_pu_bandwidth)
    for j=0:floor((int_total_channel_number - int_su1_reserved_channels)/int_su1_bandwidth)
        for k=0:floor((int_total_channel_number - int_su2_reserved_channels)/int_su2_min_bandwidth)
            if((i*int_pu_bandwidth)+(j*int_su1_bandwidth)+(k*int_su2_min_bandwidth) <= int_total_channel_number)
                index = index +1;
                
                 %-----Blocking---%
                 if ((i*int_pu_bandwidth + ((j+1)*int_su1_bandwidth)) > int_total_channel_number - int_su1_reserved_channels)
                    flo_su1_blockingProbability = flo_su1_blockingProbability + steady_state_prob (index);
                 end
                 
                 %----Dropping----%
                  if(((i+1)*int_pu_bandwidth) <= int_total_channel_number)
                    if(((i+1)*int_pu_bandwidth)+(j*int_su1_bandwidth) > int_total_channel_number)
                        y = ceil (((i*int_pu_bandwidth) + (j*int_su1_bandwidth) - int_total_channel_number + int_pu_bandwidth)/int_su1_bandwidth);
                        if (j>0 && y>0)
                            if (y>j)
                                y = j;
                            end
                            sum_dp_su1 = sum_dp_su1 + steady_state_prob (index)*y;
                        end
                    end
                  end

                  %----Spectrum Utilization----%
                  sum_spectrumUtilization_su1 = sum_spectrumUtilization_su1 + (j*int_su1_bandwidth*steady_state_prob(index));
                  
                  %----Throughput----%
                  sum_trhoughput_su1 = sum_trhoughput_su1 + (j*flo_su1_service_rate*steady_state_prob(index));
            end
        end
    end
end

flo_su1_blockingProbability;

flo_su1_droppingProbability = (sum_dp_su1*flo_pu_arrival_rate)/((1-flo_su1_blockingProbability)*flo_su1_arrival_rate);

flo_su1_spectrumUtilization = sum_spectrumUtilization_su1/int_total_channel_number;    

flo_su1_throughput = sum_trhoughput_su1;
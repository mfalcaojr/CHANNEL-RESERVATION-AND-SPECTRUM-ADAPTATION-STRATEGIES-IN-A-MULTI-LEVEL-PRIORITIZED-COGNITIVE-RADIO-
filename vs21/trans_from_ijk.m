%TRANSITIONS FROM STATE i,j,k 
function array_out = trans_from_ijk()

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

index = 0;

%creating an array filled with 0s. 
for i = 0:floor(int_total_channel_number/int_pu_bandwidth) 
    for j = 0:floor((int_total_channel_number-int_su1_reserved_channels)/int_su1_bandwidth)
        for k = 0:floor((int_total_channel_number-int_su2_reserved_channels)/int_su2_min_bandwidth)
            if((i*int_pu_bandwidth)+(j*int_su1_bandwidth)+(k*int_su2_min_bandwidth) <= int_total_channel_number)
                index = index + 1;
                array_out(index) = 0;
            end
        end
    end
end

index = 0;

for i = 0:floor(int_total_channel_number/int_pu_bandwidth) 
    for j = 0:floor((int_total_channel_number-int_su1_reserved_channels)/int_su1_bandwidth)
        for k = 0:floor((int_total_channel_number-int_su2_reserved_channels)/int_su2_min_bandwidth)
            if((i*int_pu_bandwidth)+(j*int_su1_bandwidth)+(k*int_su2_min_bandwidth) <= int_total_channel_number)
                index = index + 1;
                for i_apost = 0:floor(int_total_channel_number/int_pu_bandwidth) 
                    for j_apost = 0:floor((int_total_channel_number-int_su1_reserved_channels)/int_su1_bandwidth)
                        for k_apost = 0:floor((int_total_channel_number-int_su2_reserved_channels)/int_su2_min_bandwidth)
                            if((i_apost*int_pu_bandwidth)+(j_apost*int_su1_bandwidth)+(k_apost*int_su2_min_bandwidth) <= int_total_channel_number)
                               
                                idle = int_total_channel_number - (i*int_pu_bandwidth) - (j*int_su1_bandwidth) - (k*int_su2_min_bandwidth);
                                
                                %EQUATION 5 - PU ARRIVAL FROM I,J,K
                                if (i_apost == i+1 && j_apost == j && k_apost == k)
                                       if(int_pu_bandwidth <= idle)
                                           array_out(index) = array_out(index)+flo_pu_arrival_rate;
                                       end
                                end
                                
                                %EQUATION 6 - PU ARRIVAL FROM I,J,K WITH
                                %SU2 DROPPINGS
                                if(((i+1)*int_pu_bandwidth)+(j*int_su1_bandwidth)+(k*int_su2_min_bandwidth) > int_total_channel_number)
                                    z = ceil((-idle + int_pu_bandwidth)/int_su2_min_bandwidth);
                                        if (i_apost == i+1 && j_apost == j && k_apost == k-z)
                                               if(int_pu_bandwidth > idle)
                                                   if((idle + (k*int_su2_min_bandwidth)) >= int_pu_bandwidth)
                                                        array_out(index) = array_out(index)+flo_pu_arrival_rate;
                                                   end
                                               end
                                        end
                                end
                                
                                %EQUATION 7 - PU ARRIVAL FROM I,J,K WITH
                                %SU1 AND SU2 DROPPINGS
                                if(((i+1)*int_pu_bandwidth)+(j*int_su1_bandwidth) > int_total_channel_number)
                                    y = ceil (((i*int_pu_bandwidth) + (j*int_su1_bandwidth) - int_total_channel_number + int_pu_bandwidth)/int_su1_bandwidth);
                                    if (i_apost == i+1 && j_apost == j-y && k_apost == 0)
                                           if(int_pu_bandwidth > idle + (k*int_su2_min_bandwidth))
                                               if(idle + (j*int_su1_bandwidth) + (k*int_su2_min_bandwidth)>= int_pu_bandwidth)
                                                    array_out(index) = array_out(index)+flo_pu_arrival_rate;
                                               end
                                           end
                                    end
                                end
                                
                                %EQUATION 8 - SU1 ARRIVAL FROM I,J,K 
                                if (i_apost == i && j_apost == j+1 && k_apost == k)
                                    if ((i*int_pu_bandwidth) + ((j+1)*int_su1_bandwidth) <= int_total_channel_number - int_su1_reserved_channels)
                                        if(int_su1_bandwidth <= idle)
                                            array_out(index) = array_out(index)+flo_su1_arrival_rate;
                                        end
                                    end
                                end
                                %EQUATION 9 - SU1 ARRIVAL FROM I,J,K WITH
                                %SU2 DROPPINGS
                                if ((i*int_pu_bandwidth) + ((j+1)*int_su1_bandwidth) <= int_total_channel_number - int_su1_reserved_channels)
                                    if((i*int_pu_bandwidth)+((j+1)*int_su1_bandwidth)+(k*int_su2_min_bandwidth) > int_total_channel_number)
                                        z = ceil((-idle + int_su1_bandwidth) /int_su2_min_bandwidth);
                                        if (i_apost == i && j_apost == j+1 && k_apost == k-z)
                                            if(int_su1_bandwidth > idle)
                                                if(idle + (k*int_su2_min_bandwidth) >= int_su1_bandwidth)
                                                    array_out(index) = array_out(index)+flo_su1_arrival_rate;
                                                end
                                            end
                                        end
                                    end
                                end
                                
                                %EQUATION 10 - SU2 ARRIVAL FROM I,J,K 
                                if (i_apost == i && j_apost == j && k_apost == k+1)
                                    if(int_su2_min_bandwidth + int_su2_reserved_channels <= idle)
                                        array_out(index) = array_out(index)+flo_su2_arrival_rate;
                                    end
                                end
                                
                                %EQUATION 11 - PU DEPARTURE FROM I,J,K 
                                if (i_apost == i-1 && j_apost == j && k_apost == k)
                                    array_out(index) = array_out(index)+ i*flo_pu_service_rate;
                                end
                                
                                %EQUATION 12 - SU1 DEPARTURE FROM I,J,K 
                                if (i_apost == i && j_apost == j-1 && k_apost == k)
                                    array_out(index) = array_out(index)+ j*flo_su1_service_rate;
                                end
                                
                                %EQUATION 13 - SU1 DEPARTURE FROM I,J,K 
                                if (i_apost == i && j_apost == j && k_apost == k-1)
                                    array_out(index) = array_out(index)+ k*flo_su2_service_rate;
                                end
                            end
                        end
                    end
                end
            end
        end
    end
end
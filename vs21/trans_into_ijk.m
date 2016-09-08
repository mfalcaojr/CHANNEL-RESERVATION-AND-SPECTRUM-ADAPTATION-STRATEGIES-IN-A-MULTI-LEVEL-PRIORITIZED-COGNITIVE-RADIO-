%TRANSITIONS FROM STATE i,j,k 
function matrix_into_state = trans_into_ijk(int_total_number_of_states)

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

matrix_into_state = zeros(int_total_number_of_states); %matriz quadrada de zeros
column =0;

for i_apost = 0:floor(int_total_channel_number/int_pu_bandwidth) 
    for j_apost = 0:floor((int_total_channel_number-int_su1_reserved_channels)/int_su1_bandwidth)
        for k_apost = 0:floor((int_total_channel_number-int_su2_reserved_channels)/int_su2_min_bandwidth)
            if((i_apost*int_pu_bandwidth)+(j_apost*int_su1_bandwidth)+(k_apost*int_su2_min_bandwidth) <= int_total_channel_number)
              column = column +1;
              row = 0;
                for i = 0:floor(int_total_channel_number/int_pu_bandwidth) 
                    for j = 0:floor((int_total_channel_number-int_su1_reserved_channels)/int_su1_bandwidth)
                        for k = 0:floor((int_total_channel_number-int_su2_reserved_channels)/int_su2_min_bandwidth)
                            if((i*int_pu_bandwidth)+(j*int_su1_bandwidth)+(k*int_su2_min_bandwidth) <= int_total_channel_number)
                               row = row + 1;  
                               free = freeResources (i_apost, j_apost, k_apost);
                               
                               %EQUATION 14 PU ARRIVAL
                               if (i_apost == i-1 && j_apost == j && k_apost == k)
                                       if (int_pu_bandwidth <= free)
                                           matrix_into_state (row, column) = flo_pu_arrival_rate;
                                       end
                               end
                                
                               %EQUATION 15 PU ARRIVAL WITH SU2 DROPPING
                               if (int_pu_bandwidth > free)
                                      if(k > 0)
                                          if (int_pu_bandwidth <= int_su2_min_bandwidth)
                                              z_apost = 1;
                                              if (i_apost == i-1 && j_apost == j && k_apost == k + z_apost)
                                                  matrix_into_state (row, column) = flo_pu_arrival_rate;
                                              end
                                          end
                                          
                                          if (int_pu_bandwidth > int_su2_min_bandwidth)
                                             z_apost = ceil((int_pu_bandwidth - free)/int_su2_min_bandwidth);
                                             if (i_apost == i-1 && j_apost == j && k_apost == k + z_apost)
                                                matrix_into_state (row, column) = flo_pu_arrival_rate;
                                             end
                                          end
                                      end
                               end
                               
                               %EQUATION 16 PU ARRIVAL WITH SU1 and SU2 DROPPING
                               if (int_pu_bandwidth > free)
                                   if(k == 0)
                                      if (int_pu_bandwidth < int_su2_min_bandwidth)
                                              if(int_pu_bandwidth >= int_su1_bandwidth)
                                                 if(k_apost > 0)
                                                    y_apost = 0;
                                                    z_apost = 1;
                                                        if ((z_apost*int_su2_min_bandwidth)/int_pu_bandwidth >= 1)
                                                            if (i_apost == i-1 && j_apost == j + y_apost && k_apost == k + z_apost)
                                                                matrix_into_state (row, column) = flo_pu_arrival_rate;
                                                            end
                                                        end                    
                                                 end
                                                 
                                                 if(k_apost == 0)
                                                    y_apost = ceil((int_pu_bandwidth - free)/int_su1_bandwidth);
                                                    z_apost = 0;
                                                          if (i_apost == i-1 && j_apost == j + y_apost && k_apost == k + z_apost)
                                                             matrix_into_state (row, column) = flo_pu_arrival_rate;
                                                          end
                                                 end
                                              end
                                                        
                                              if(int_pu_bandwidth < int_su1_bandwidth)
                                                  if(k_apost > 0)
                                                     y_apost = 0;
                                                     z_apost = 1;
                                                       if ((z_apost*int_su2_min_bandwidth)/int_pu_bandwidth >= 1)
                                                          if (i_apost == i-1 && j_apost == j + y_apost && k_apost == k + z_apost)
                                                             matrix_into_state (row, column) = flo_pu_arrival_rate;
                                                          end
                                                       end
                                                  end

                                                  if(k_apost == 0)
                                                     y_apost = 1;
                                                     z_apost = 0;
                                                         if (((y_apost*int_su1_bandwidth)/int_pu_bandwidth) >= 1)
                                                            if (i_apost == i-1 && j_apost == j + y_apost && k_apost == k + z_apost)
                                                               matrix_into_state (row, column) = flo_pu_arrival_rate;
                                                            end
                                                         end
                                                   end
                                             end
                                       end
                               
                                              
                                       if(int_pu_bandwidth >= int_su2_min_bandwidth)
                                          if(int_pu_bandwidth >= int_su1_bandwidth)
                                             for y_apost = 0:(int_pu_bandwidth/int_su1_bandwidth)
                                                 for z_apost = 0:(int_pu_bandwidth/int_su2_min_bandwidth)
                                                     if (((y_apost*int_su1_bandwidth) + (z_apost*int_su2_min_bandwidth)) == int_pu_bandwidth - free)
                                                           if (i_apost == i-1 && j_apost == j + y_apost && k_apost == k + z_apost)
                                                               matrix_into_state (row, column) = flo_pu_arrival_rate;
                                                            end
                                                     end
                                                  end
                                             end
                                          end
                                          
                                          if(int_pu_bandwidth < int_su1_bandwidth)
                                             if(int_pu_bandwidth <= (int_total_channel_number - (i_apost*int_pu_bandwidth) - (j_apost*int_su1_bandwidth)))
                                                for z_apost = 0:(int_pu_bandwidth/int_su2_min_bandwidth)
                                                    if ((z_apost*int_su2_min_bandwidth) == int_pu_bandwidth - free)
                                                        if (i_apost == i-1 && j_apost == j && k_apost == k + z_apost)
                                                            matrix_into_state (row, column) = flo_pu_arrival_rate;
                                                        end
                                                    end
                                                 end
                                             end
                                                     
                                             if (int_pu_bandwidth > (int_total_channel_number - (i_apost*int_pu_bandwidth) - (j_apost*int_su1_bandwidth)))
                                                  z_apost = k_apost;
                                                  y_apost = 1;
                                                  if (((y_apost*int_su1_bandwidth)/int_pu_bandwidth) >= 1)
                                                     if (i_apost == i-1 && j_apost == j + y_apost && k_apost == k + z_apost)
                                                         matrix_into_state (row, column) = flo_pu_arrival_rate;
                                                     end
                                                  end
                                             end
                                          end
                                          
                                       end
                                   end
                                end
                
                                
                                %EQUATION 17 SU1 ARRIVAL
                                  if (i_apost == i && j_apost == j-1 && k_apost == k)
                                      %linha trocada, ainda não esta no documento 
                                      if (int_su1_bandwidth + int_su1_reserved_channels <= int_total_channel_number - (i_apost*int_pu_bandwidth) - (j_apost*int_su1_bandwidth))
                                          if (int_su1_bandwidth <= int_total_channel_number - (i_apost*int_pu_bandwidth) - (j_apost*int_su1_bandwidth) - (k_apost*int_su2_min_bandwidth))
                                               matrix_into_state (row, column) = flo_su1_arrival_rate;
                                          end
                                      end
                                  end
                                  %EQUATION 18 SU1 ARRIVAL WITH SU2
                                  %DROPPING
                                   
                                  if(int_su1_bandwidth + int_su1_reserved_channels <= int_total_channel_number - (i_apost*int_pu_bandwidth) - (j_apost*int_su1_bandwidth))
                                     if (int_su1_bandwidth > free)
                                         if (int_su1_bandwidth <= int_su2_min_bandwidth)
                                             if(k_apost > 0)
                                                z_apost = 1;
                                                     if (i_apost == i && j_apost == j-1 && k_apost == k + z_apost)
                                                         matrix_into_state (row, column) = flo_su1_arrival_rate;
                                                     end
                                             end
                                         end
                                         
                                          if (int_su1_bandwidth > int_su2_min_bandwidth)
                                             if(k_apost >0)
                                                for z_apost = 0:(int_su1_bandwidth/int_su2_min_bandwidth)
                                                    if ((z_apost*int_su2_min_bandwidth) == int_su1_bandwidth - free)
                                                       if (i_apost == i && j_apost == j-1 && k_apost == k + z_apost)
                                                                     matrix_into_state (row, column) = flo_su1_arrival_rate;
                                                       end
                                                    end
                                                end
                                             end
                                          end
                                     end
                                  end
                                 
                                 %EQUATION 19 SU2 ARRIVAL
                                  if (i_apost == i && j_apost == j && k_apost == k-1)
                                       if (int_su2_min_bandwidth + int_su2_reserved_channels <= free)
                                           matrix_into_state (row, column) = flo_su2_arrival_rate;
                                       end
                                  end
                               
                                  %EQUATION 20 PU DEPARTURE
                                  if (i_apost == i+1 && j_apost == j && k_apost == k)
                                      matrix_into_state (row, column) = (i+1)*flo_pu_service_rate;
                                  end

                                  %EQUATION 21 SU1 DEPARTURE
                                  if (i_apost == i && j_apost == j+1 && k_apost == k)
                                      matrix_into_state (row, column) = (j+1)*flo_su1_service_rate;
                                  end
                                  %EQUATION 22 SU2 DEPARTURE
                                  if (i_apost == i && j_apost == j && k_apost == k+1)
                                      matrix_into_state (row, column) = (k+1)*flo_su2_service_rate;
                                  end
                                  
                            end
                        end
                    end
                end
            end
        end
    end
end



%params: matrix_model, matrix_simulation, performance_metric

%function plot_exp1 (matrix_simulation_config1,matrix_model_config1,matrix_simulation_config2,matrix_model_config2,matrix_simulation_config3,matrix_model_config3,matrix_simulation_config4,matrix_model_config4,matrix_simulation_config5,matrix_model_config5,matrix_simulation_config6,matrix_model_config6,type_of_metric)

function plot_exp1 (type_of_metric)
%loading matrixes from simulation and model
load('/Users/mfalcaojr/Documents/MATLAB/matrix_of_mean_stats_from_simulation_config1.mat');
matrix_simulation_config1 = matrix_of_mean_stats_from_simulation_config1;
load('/Users/mfalcaojr/Documents/MATLAB/matrix_of_mean_stats_from_simulation_config2.mat');
matrix_simulation_config2 = matrix_of_mean_stats_from_simulation_config2;
load('/Users/mfalcaojr/Documents/MATLAB/matrix_of_mean_stats_from_simulation_config3.mat');
matrix_simulation_config3 = matrix_of_mean_stats_from_simulation_config3;
load('/Users/mfalcaojr/Documents/MATLAB/matrix_of_mean_stats_from_simulation_config4.mat');
matrix_simulation_config4 = matrix_of_mean_stats_from_simulation_config4;
load('/Users/mfalcaojr/Documents/MATLAB/matrix_of_mean_stats_from_simulation_config5.mat');
matrix_simulation_config5 = matrix_of_mean_stats_from_simulation_config5;
load('/Users/mfalcaojr/Documents/MATLAB/matrix_of_mean_stats_from_simulation_config6.mat');
matrix_simulation_config6 = matrix_of_mean_stats_from_simulation_config6;

load('/Users/mfalcaojr/Documents/MATLAB/matrix_of_stats_from_model_config1.mat');
matrix_model_config1 = matrix_of_stats_from_model_config1;
load('/Users/mfalcaojr/Documents/MATLAB/matrix_of_stats_from_model_config2.mat');
matrix_model_config2 = matrix_of_stats_from_model_config2;
load('/Users/mfalcaojr/Documents/MATLAB/matrix_of_stats_from_model_config3.mat');
matrix_model_config3 = matrix_of_stats_from_model_config3;
load('/Users/mfalcaojr/Documents/MATLAB/matrix_of_stats_from_model_config4.mat');
matrix_model_config4 = matrix_of_stats_from_model_config4;
load('/Users/mfalcaojr/Documents/MATLAB/matrix_of_stats_from_model_config5.mat');
matrix_model_config5 = matrix_of_stats_from_model_config5;
load('/Users/mfalcaojr/Documents/MATLAB/matrix_of_stats_from_model_config6.mat');
matrix_model_config6 = matrix_of_stats_from_model_config6;
%end of loads
amount_of_different_pu_arrival_rates = 7;

%filling vector x
x = [];
interval = 1;
for j=1:amount_of_different_pu_arrival_rates
    x = [x interval];
    interval = interval + 0.5;
end
%figure;
 
    y1 = [];
    for j=1:amount_of_different_pu_arrival_rates
        y1 = [y1 matrix_simulation_config1(j,type_of_metric)];
    end

    y2 = [];
    for j=1:amount_of_different_pu_arrival_rates
        y2 = [y2 matrix_simulation_config2(j,type_of_metric)];
    end
    
    y3 = [];
    for j=1:amount_of_different_pu_arrival_rates
        y3 = [y3 matrix_simulation_config3(j,type_of_metric)];
    end
    
    y4 = [];
    for j=1:amount_of_different_pu_arrival_rates
        y4 = [y4 matrix_simulation_config4(j,type_of_metric)];
    end
    
    y5 = [];
    for j=1:amount_of_different_pu_arrival_rates
        y5 = [y5 matrix_simulation_config5(j,type_of_metric)];
    end
    
    y6 = [];
    for j=1:amount_of_different_pu_arrival_rates
        y6 = [y6 matrix_simulation_config6(j,type_of_metric)];
    end
    
    m1 = [];
    for j=1:amount_of_different_pu_arrival_rates
        m1 = [m1 matrix_model_config1(j,type_of_metric)];
    end
    
    m2 = [];
    for j=1:amount_of_different_pu_arrival_rates
        m2 = [m2 matrix_model_config2(j,type_of_metric)];
    end
    
    m3 = [];
    for j=1:amount_of_different_pu_arrival_rates
        m3 = [m3 matrix_model_config3(j,type_of_metric)];
    end
    
    m4 = [];
    for j=1:amount_of_different_pu_arrival_rates
        m4 = [m4 matrix_model_config4(j,type_of_metric)];
    end
    
    m5 = [];
    for j=1:amount_of_different_pu_arrival_rates
        m5 = [m5 matrix_model_config5(j,type_of_metric)];
    end
    
    m6 = [];
    for j=1:amount_of_different_pu_arrival_rates
        m6 = [m6 matrix_model_config6(j,type_of_metric)];
    end
    
    %blocking for SU1 in type_of_metric = 1 and blocking for SU2 in type_of_metric = 2 
    %dropping for SU1 in type_of_metric = 3 and dropping for SU2 in type_of_metric = 4 
    if(type_of_metric == 1 || type_of_metric == 2 || type_of_metric == 3 || type_of_metric == 4)
            figure;
            
            %config1
            p1 = loglog(x,y1,'d', 'color', 'k','MarkerSize',10);
            hold on;
            p2 = loglog(x,m1, 'color', 'k');
            hold on;
            
            %config2
            p3 = loglog(x,y2,'v', 'color', 'k','MarkerSize',10);
            hold on;
            p4 = loglog(x,m2, 'color', 'k');
            hold on;
            
            %config3
            p5 = loglog(x,y3,'x', 'color', 'k','MarkerSize',10);
            hold on;
            p6 = loglog(x,m3, 'color', 'k');
            hold on;
            
            %config4
            p7 = loglog(x,y4,'o', 'color', 'k','MarkerSize',10);
            hold on;
            p8 = loglog(x,m4, 'color', 'k');
            hold on;
            
            %config5
            p9 = loglog(x,y5,'+', 'color', 'k','MarkerSize',10);
            hold on;
            p10 = loglog(x,m5, 'color', 'k');
            hold on;
            
            p11 = loglog(x,y6,'s', 'color', 'k','MarkerSize',10);
            hold on;
            p12 = loglog(x,m6, 'color', 'k');
            %hold on;
            
            legend_instance = legend([p1,p3,p5,p7,p9,p11,p2],'B_P_U > B_S_U_1 > B_S_U_2','B_P_U > B_S_U_2 > B_S_U_1','B_S_U_1 > B_S_U_2 > B_P_U','B_S_U_1 > B_P_U > B_S_U_2','B_S_U_2 > B_P_U > B_S_U_1','B_S_U_2 > B_S_U_1 > B_P_U','theoretical', 'Location', 'best');
            %set(legend_instance,'FontSize',12,'Location','eastoutside');
            set(legend_instance,'FontSize',11);
            
            if (type_of_metric == 1 || type_of_metric == 2)
                ylabel('blocking probability','FontSize', 18) % x-axis label
            elseif (type_of_metric == 3 || type_of_metric == 4)
                ylabel('forced termination probability','FontSize', 18) % x-axis label
            end
            xlabel('arrival rate of primary users','FontSize', 18) % y-axis label
            grid on;
            
            if (type_of_metric == 1)
                title('SU_1 Blocking Probability','FontSize', 14);
                set(gcf,'PaperPositionMode','auto');
                set(gca,'FontSize',14);
                print('Blocking_SU1','-dpng','-r0');
            elseif(type_of_metric == 2)
                title('SU_2 Blocking Probability','FontSize', 14);
                set(gcf,'PaperPositionMode','auto');
                set(gca,'FontSize',14);
                print('Blocking_SU2','-dpng','-r0');
            elseif(type_of_metric == 3)
                title('SU_1 Forced Termination Probability','FontSize', 14);
                set(gcf,'PaperPositionMode','auto');
                set(gca,'FontSize',14);
                print('Forced Termination_SU1','-dpng','-r0');
            elseif(type_of_metric == 4)
                title('SU_2 Forced Termination Probability','FontSize', 14);
                set(gcf,'PaperPositionMode','auto');
                set(gca,'FontSize',14);
                print('Forced Termination_SU2','-dpng','-r0');
            end
    end
     
    %spectrum utilization for SU1 = 5 or SU2 = 6
    if(type_of_metric == 5 || type_of_metric == 6 || type_of_metric == 7 || type_of_metric == 8)
        figure;
        
        p1 = plot(x,y1,'d', 'color', 'k','MarkerSize',12);
        hold on;
        p2 = plot(x,m1, 'color','k');
        hold on;
       
        p3 = plot(x,y2,'v', 'color', 'k','MarkerSize',12);
        hold on;
        p4 = plot(x,m2, 'color','k');
        hold on;
        
        p5 = plot(x,y3,'x', 'color', 'k','MarkerSize',12);
        hold on;
        p6 = plot(x,m3, 'color','k');
        hold on;
        
        p7 = plot(x,y4,'o', 'color', 'k','MarkerSize',12);
        hold on;
        p8 = plot(x,m4, 'color','k');
        hold on;
        
        p9 = plot(x,y5,'+', 'color', 'k','MarkerSize',12);
        hold on;
        p10 = plot(x,m5, 'color','k');
        hold on;
       
        p11 = plot(x,y6,'s', 'color', 'k','MarkerSize',12);
        hold on;
        p12 = plot(x,m6, 'color','k');
        %hold on;
        
        legend_instance = legend([p1,p3,p5,p7,p9,p11,p2],'B_P_U > B_S_U_1 > B_S_U_2','B_P_U > B_S_U_2 > B_S_U_1','B_S_U_1 > B_S_U_2 > B_P_U','B_S_U_1 > B_P_U > B_S_U_2','B_S_U_2 > B_P_U > B_S_U_1','B_S_U_2 > B_S_U_1 > B_P_U','theoretical', 'Location', 'best');
        set(legend_instance,'FontSize',11);
        if(type_of_metric == 5 || type_of_metric == 6)
            ylabel('spectrum utilization','FontSize', 18) % y-axis label
        elseif(type_of_metric == 7 || type_of_metric == 8)
            ylabel('throughput','FontSize', 18) % y-axis label
        end
        
        xlabel('arrival rate of primary users','FontSize', 18) % x-axis label
        grid on;
        
        if (type_of_metric == 5)
           title('SU_1 Spectrum Utilization','FontSize', 14);
           set(gcf,'PaperPositionMode','auto');
           set(gca,'FontSize',14);
           print('Spectrum_Utilization_SU1','-dpng','-r0');
        elseif(type_of_metric == 6)
           title('SU_2 Spectrum Utilization','FontSize', 14);
           set(gcf,'PaperPositionMode','auto');
             set(gca,'FontSize',14);
           print('Spectrum_Utilization_SU2','-dpng','-r0');
        elseif (type_of_metric == 7)
           title('SU_1 Throughput','FontSize', 14);
           set(gcf,'PaperPositionMode','auto');
             set(gca,'FontSize',14);
           print('Throughput_SU1','-dpng','-r0');
        elseif (type_of_metric == 8)
           title('SU_2 Throughput','FontSize', 14);
           set(gcf,'PaperPositionMode','auto');
             set(gca,'FontSize',14);
           print('Throughput_SU2','-dpng','-r0');
        end
    end
close all;


t = -2:0.01:2;
f_1 = 5;
f_2 = 20;
f_3 = 100;
w = 50;


%% a function with three frequencies
f = cos(f_1.*t) + cos(f_2.*t) + cos(f_3.*t);

%% a function with one frequency
f1 = cos(f_1.*t);

%% Addition
carrier = cos(w.*t);
Addition = f1 + carrier;

%% modulated function

    %Addition: Up + Down
    figure; plot(t, (Addition)); hold on; plot(t, f1+1); plot(t, f1-1); set(gca,'xtick',[]); set(gca,'ytick',[]); xlabel('Time [s]'); ylabel('Amplitude [v]');
    
    
    % Diode = POSITIVE + MULTIPLICATION!
        %Diode over addition
        Addition (Addition < 0 ) = 0;
        
        %Actual diode function!!! (as proved by theory!) Has nothing to do
        %with RLC
        Multiplied = (1+f1).*carrier;
    

%% Plot functions
    %Signal
    figure; plot(t, f1); set(gca,'xtick',[]); set(gca,'ytick',[]); xlabel('Time [s]'); ylabel('Amplitude [v]');
    
    %Carrier
    figure; plot(t, carrier); set(gca,'xtick',[]); set(gca,'ytick',[]); xlabel('Time [s]'); ylabel('Amplitude [v]');

    %Addition + Diode: naive results
    figure; plot(t, (Addition)); hold on; plot(t, f1+1); set(gca,'xtick',[]); set(gca,'ytick',[]); xlabel('Time [s]'); ylabel('Amplitude [v]');

    %Ideal AM circuit (addition + multiplication)
    figure; plot(t, Multiplied); hold on; plot(t, f1+1); plot(t, -(f1+1)); set(gca,'xtick',[]); set(gca,'ytick',[]); xlabel('Time [s]'); ylabel('Amplitude [v]');

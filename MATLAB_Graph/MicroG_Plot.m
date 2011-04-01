% Author: Bob Rica

clear all;
s1 = serial('COM1');                            %define serial port
s1.BaudRate=9600;                               %define baud rate
     
%open serial port
fopen(s1);
clear data;

while(1)                                %acquisition of 100 points
    data=fscanf(s1);%read sensor
   	%parse data, format "$DATA,time,rpm;"
    subplot(1,2,1)
    hold on;
    stem(time, rpm,'MarkerFaceColor','auto','LineStyle','none');               %we'll be using stem(.1,.5,'MarkerFaceColor','auto','LineStyle','none'); because this one fills the dot and doesnt have a line draw to it.
    title('Values at each time interval');
    xlabel('Time');
    ylabel('Sine Values for each point');
    drawnow;
end

% close the serial port!
fclose(s1);  
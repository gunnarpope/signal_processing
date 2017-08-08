%Low pass filter design 
% author: Gunnar Pope
% 10/24/16

close all
clear all

% Set the sampling frequency, cutoff freq, and desired filter order
Fsamp = 20;         % Sampling Frequency in Hz
Fstop = 1.5;        % Cutoff Frequency in Hz
n = 50;            % The filter order


Fnyq = Fsamp/2;     % Nyquist Frequency, (the highest observable freq)
Wn = Fstop/Fnyq;    % Ratio of Fstop freq and Nyquist Freq
b = fir1(n+1,Wn);   % The filter coefficients

figure('position', [50, 50, 700, 700])
freqz(b)            % Plot the frequency response of the filter
%Note: the normalized frequency, 1*pi/rad = Fsamp/2 = 10Hz

% Test the filter on a corrupted signal (1Hz desired + 8.3 Hz noise)
figure()
t = 0:1/Fsamp:20;
f1 = 1;                                 %Hz
f2 = 8.3;                               %Hz
y = cos(2*pi*f1.*t)+ cos(2*pi.*f2.*t);

subplot(2,1,1)
plot(t,y);
title('1 Hz Signal + Noise')
xlabel('Time (sec)')
ylabel('y(t)')

subplot(2,1,2)
%Apply the filter to your signal, y, here:
yfilt = filter(b,1,y);
plot(t,yfilt)
title('The Filtered Signal')
xlabel('Time (sec)')
ylabel('Filtered y(t)')




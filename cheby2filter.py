# written by: gunnar pope
# gunnar.c.pope.th@dartmouth.edu
# date: 7/20/17

# a script implementing a chebyshev type II digital filter

import numpy as np
from numpy import pi
import matplotlib.pyplot as plt
import scipy
import scipy.signal as filt



def filter_cheby2(input_signal,fsamp,fpass,fstop):
    #the normalized passband frequency
    wp = fpass/fnyq
    ws = fstop/fnyq

    dB_pb = 3  #the max loss in the passband (dB)
    dB_sb = 74 #attenuation in the stop band

    N, Wn = filt.cheb2ord(wp, ws, dB_pb, dB_sb)
    b, a = filt.cheby2(N, dB_sb, Wn, 'lowpass')
    output_signal = scipy.signal.filtfilt(b, a, input_signal)
    return output_signal

if __name__ == "__main__":
    # the filter settings
    fsamp = 2  # Hz
    fnyq = fsamp / 2
    fpass = 0.6  # Hz
    fstop = 0.9  # Hz

    t = np.linspace(0,4,100)
    f = np.sin(2*pi*0.5*t) + np.cos(2*pi*60*t)

    f_filt = filter_cheby2(f,fsamp,fpass,fstop)
    plt.plot(f)
    plt.plot(f_filt)
    plt.title('Chebyshev type II low pass filter')
    plt.xlabel('time')
    plt.ylabel('amplitude')
    plt.show()

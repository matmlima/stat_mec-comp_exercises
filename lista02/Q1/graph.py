import numpy as np
import matplotlib.pyplot as plt

a1 = np.loadtxt('box_muller.out')
a2 = np.loadtxt('exponential.out')
delta = 0.01
nb1 =np.arange(min(a1), max(a1) + delta, delta)
nb2 = np.arange(min(a2), max(a2) + delta, delta)
fig1,ax1 = plt.subplots()
fig2,ax2 = plt.subplots()
ax1.hist(a1[:],bins=nb1,density=True)
ax2.hist(a2[:],bins=nb2,density=True)
plt.show()

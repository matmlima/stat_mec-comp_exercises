import numpy as np
import matplotlib.pyplot as plt

data = np.loadtxt('energy.out')
data1 = np.loadtxt('magnetization.out')

t = data[:,0]
E = data[:,1]
M = data1[:,1]

fig,ax = plt.subplots()
fig2,ax2 = plt.subplots()
ax.plot(t,E, '-', color = 'k')
ax.set_xlabel('MC time')
ax.set_ylabel('$E/N$')

ax2.plot(t,M, '-', color = 'k')
ax2.set_xlabel('MC time')
ax2.set_ylabel('$M/N$')
plt.show()

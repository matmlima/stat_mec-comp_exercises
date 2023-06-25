import numpy as np
import matplotlib.pyplot as plt

data = np.loadtxt('mean_energy-magnetization.out',skiprows=1)

t = data[:,2]
E = data[:,0]
M = data[:,1]

fig,ax = plt.subplots()
fig2,ax2 = plt.subplots()
ax.plot(t,E, '-', color = 'k')
ax.set_xlabel('Temperature')
ax.set_ylabel('$E/N$')

ax2.plot(t,M, '-', color = 'k')
ax2.set_xlabel('Temperature')
ax2.set_ylabel('$M/N$')
plt.show()

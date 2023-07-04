import subprocess
import numpy as np
import matplotlib.pyplot as plt

T = np.arange(2,3,0.01)
subprocess.run(['rm', 'mean_energy-magnetization.out'])
subprocess.run(['gfortran', 'ising.f90'])
S = np.ones((100,100))
np.savetxt('spin.out', S, fmt='%d')
E = -2
M = 1

with open('mean_energy-magnetization.out', 'w') as f:
    f.write(f'{E} ')
    f.write(f'{M} ')
    f.write(f'{T[0]-0.01} ')
    f.write('\n')
    f.close()
for i in range(len(T)):
    with open('input.in', 'w') as f:
        f.write('100 ')
        f.write('60000000 ')
        f.write(f'{T[i]} ')
        f.write(f'{E} ')
        f.write(f'{M} ')
        f.close()
    subprocess.run('./a.out')
    res = np.loadtxt('mean_energy-magnetization.out')
    res = res[-1]
#    print(res)
    E = res[0]
    M = res[1]
    print('T = ', res[2], 'E = ', E, 'M = ', M)

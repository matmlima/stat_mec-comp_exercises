program ising
implicit none
integer :: i,j,i1,i2,j1,j2,k,k1,N,L, tau
real(8) :: dH, Sn,  ep1, T, Eo, Mo
integer, dimension(2) :: ii, jj
real(8), dimension(2) :: ep
real(8), allocatable, dimension(:) :: E, M
integer, allocatable, dimension(:,:) :: S

open(unit=99, file = 'input.in')
read(99,*) L, tau, T, Eo, Mo
close(99)

allocate(S(L,L))
allocate(E(tau), M(tau))

open(unit=95,file='spin.out')
    read(95,*) S
close(95)
S=1
dH = 0.0d0
E(1) = Eo*L*L
M(1) = Mo*L*L
E(1) = -2.0d0*L*L
M(1) = L*L
!Metropolis algorithm
do k = 2, tau
call random_number(ep) !random number [0,1]
ep = ep*(L-1) + 1 !i -> [1,L] (real)
i = nint(ep(1))
j = nint(ep(2))
!now i,j are random integers 1,2,...,L
ii(1) = i-1
ii(2) = i+1
jj(1) = j-1
jj(2) = j+1
!print*, 'i0', i,ii,(real(ii)-0.1d0)/real(L)
ii = ii - L*floor((real(ii)-0.1d0)/real(L)) !pbc
jj = jj - L*floor((real(jj)-0.1d0)/real(L)) !pbc
!print*, 'in', i,ii 
dH =  2.0d0*S(i,j)*(S(i,jj(1)) +S(i,jj(2))+S(ii(1),j) + S(ii(2),j))
call random_number(ep1)
if (exp(-dH/T) .gt. ep1) then
    S(i,j) = -S(i,j)
    E(k) = E(k-1) + dH
    M(k) = M(k-1) + 2.0d0*S(i,j)
else
    E(k) = E(k-1)
    M(k) = M(k-1)
endif
enddo

open(unit=95,file='spin.out')
do i = 1,L
    write(95,*) S(i,:)
enddo
close(95)

open(unit=97, file='mean_energy-magnetization.out', action="write",position="append")
write(97,*) sum(E(tau-100:tau))/(100.0d0*L**2), abs(sum(M(tau-100:tau))/(100.0d0*L**2)), T
close(97)

END PROGRAM

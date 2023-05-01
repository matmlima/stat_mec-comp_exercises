PROGRAM Q2
implicit none
integer :: i,j,k, N,M
integer, allocatable, dimension(:) :: ai
real(8) :: r,p, c1,c2,t,t1,pn

open(99,file='input.in')
read(99,*) N,M,p
close(99)

allocate(ai(N))
ai = 2
k=0
do i =1,M
    ai(1) = generator(p)
    do j = 2,N
        ai(j) = generator(p)
        if (ai(j) .eq. 1 .and. ai(j-1) .eq. 1) then
            exit
        endif
        if (j .eq. N) then
            k = k+1
        endif
    enddo
enddo
t = sqrt(1.0d0+4.0d0*p/(1.0d0-p))
t1 = (1.0d0-p)/2.0d0
c1 = (1.0d0+t+p*(3.0d0+t))/(2.0d0*(3.0d0*p+1.0d0))
c2 = (1.0d0-t+p*(3.0d0-t))/(2.0d0*(3.0d0*p+1.0d0))
pn = c1*(t1*(1+t))**N+c2*(t1*(1-t))**N

print*, 'N de repeticoes: ', M
print*, 'tamanho da seq: ', N
print*, 'prob digito 1: ', p
print*, '---------------------'
print*, 'Prob de nao apresentar 1`s consecutivos: '
print*, 'Analitico: ', pn, 'Numerico: ', real(k)/real(M)



CONTAINS
function generator(p) result(a)
implicit none
real(8), intent(in) :: p
real(8) :: r
integer :: a

call random_number(r)
if(r.lt. p) then
    a = 1
else
    a = 0
endif
end function
end program

PROGRAM Q3
implicit none
integer :: i,j,k, l,N,M
integer, allocatable, dimension(:) :: ai
real(8) :: r,p,pn

open(99,file='input.in')
read(99,*) N,M,p
close(99)

allocate(ai(N))
ai = 2
k=0
do i =1,M
    l=0
    do j = 1,N
        ai(j) = generator(p)
        if (ai(j) .eq. 1) then
            l = l+1
        endif
        if (j .eq. N) then
            if (mod(l,2) .ne. 0) then
                exit
            else
            k = k+1
            endif
        endif
    enddo
enddo
pn = (p**2-0.5d0)/(1.0d0-2.0d0*p)**2*(1.0d0-2.0d0*p)**N+0.5d0 

print*, 'N de repeticoes: ', M
print*, 'tamanho da seq: ', N
print*, 'prob digito 1: ', p
print*, '---------------------'
print*, 'Prob de apresentar n par de 1`s: '
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

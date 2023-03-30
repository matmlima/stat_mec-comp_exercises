PROGRAM Q1 
IMPLICIT NONE
integer :: i,j,k,p, n
integer, allocatable, dimension(:) :: x, s

open(99, file='input.in')
read(99,*) n
close(99)
allocate(x(n))

!print*, dec2bin(0,n)
do i = 1,1000000000
    x = dec2bin(i,n)
   !print*, x 
enddo
                                                                                                                 




CONTAINS
    
function dec2bin(dec,n) result(x)
    IMPLICIT NONE
    integer,intent(in) :: n,dec
    integer :: i, dec_aux,s
    integer, allocatable, dimension(:) :: x,x_max
    allocate(x(n),x_max(n))
    x = 0
    x_max = 1
    dec_aux = dec
    s=0
    do i = 1,n
        s = s+x_max(i)*2**(i-1)
    enddo
    if (dec .gt. s) then
        print*, 'Total number is', dec
        stop
    endif
    if (dec_aux .ne. 0) then
    do i = n,1,-1
        x(i) = mod(dec_aux,2)
        dec_aux = dec_aux/2
        if (dec_aux .eq. 0) then
            exit
        endif
    enddo
endif
        
end function




END PROGRAM


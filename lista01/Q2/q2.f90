PROGRAM Q1 
IMPLICIT NONE
integer :: n,ct,m
integer, allocatable, dimension(:) :: x

open(99, file='input.in')
read(99,*) n,m
close(99)
allocate(x(n))

ct=0
call count_seq(ct,x,1,n,m)
print*, ct


CONTAINS
    
recursive subroutine count_seq(ct,x,pos,n,m) 
    IMPLICIT NONE
    integer,intent(in) :: n,pos,m
    integer :: ct,i
    integer, allocatable, dimension(:) :: x
    if (pos .gt. n) then
        ct = ct+1
    else 
    do i = 1,m
        x(pos) = i-1
        call count_seq(ct,x,pos+1,n,m)
    enddo
    endif

end subroutine




END PROGRAM


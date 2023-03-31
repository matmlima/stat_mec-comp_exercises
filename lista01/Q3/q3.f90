PROGRAM Q1 
IMPLICIT NONE
integer :: n,ct
integer, allocatable, dimension(:) :: x

open(99, file='input.in')
read(99,*) n
close(99)
allocate(x(n))

ct=0
call count_seq(ct,x,1,n)
print*, ct


CONTAINS
    
recursive subroutine count_seq(ct,x,pos,n) 
    IMPLICIT NONE
    integer,intent(in) :: n,pos
    integer :: ct
    integer, allocatable, dimension(:) :: x
    if (pos .gt. n) then
        ct = ct+1
    else 
        x(pos) = 0
        call count_seq(ct,x,pos+1,n)
        if(pos .eq. 1 .or. x(pos-1) .eq. 0) then
            x(pos) = 1
            call count_seq(ct,x,pos+1,n)
        endif
    endif

end subroutine




END PROGRAM


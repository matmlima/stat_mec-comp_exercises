PROGRAM density_curves
IMPLICIT NONE
integer :: i,j,k,N
real(8), allocatable, dimension(:):: ui, z
real(8) :: z1,z2,e1,delta

open(99,file='input.in')
read(99,*) N,delta
close(99)

open(98,file='box_muller.out')
do i = 1,int(N/2)
call box_muller(z1,z2)
write(98,*) z1
write(98,*) z2
enddo
close(98)

open(97, file='exponential.out')
do i =1,N
call exponential(e1)
write(97,*) e1
enddo
close(97)

CONTAINS

subroutine box_muller(z1,z2)
IMPLICIT NONE
real(8), dimension(2) :: ui
real(8) :: z1,z2,pi

pi = 4*atan(1.0d0)
call random_number(ui)
z1 = sqrt(-2.0d0*log(ui(1)))*cos(2*pi*ui(2))
z2= sqrt(-2.0d0*log(ui(1)))*sin(2*pi*ui(2))
end subroutine

subroutine exponential(e1)
IMPLICIT NONE
real(8) :: e1,ui
call random_number(ui)
e1 = -log(ui)
end subroutine

END PROGRAM

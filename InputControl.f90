!------------------------------------------------------------------------------------------------------------------------------------------------
!
!This module contains all the problem-specific information needed for the code to run. Users seeking to modify the problem can edit this file.
!Function  f(x) defines the function to be plotted. Function q(i) defines the node distribution as a function of the element under consideration.
!Subroutine domain(x0,xI,I) can be used to edit the domain under consideration (endpoints x0 and xI) and the number of elements desired(I).
!
!------------------------------------------------------------------------------------------------------------------------------------------------
module InputControl
  use type_defs
  implicit none
contains
  real(dp) function f(x)
    implicit none
    real(dp) :: x
    f = x
  end function f
  integer function q(j)
    implicit none
    integer :: j
    q = 10 !Taking the largest degree of Legendre polynomials to be 10 for now
  end function q
  subroutine domain(x0,xI,I)
    implicit none
    real(dp) :: x0,xI
    integer :: I
    x0=0.d0
    xI=10.d0
    I=10
  end subroutine domain
end module InputControl

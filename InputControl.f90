module InputControl
  use type_defs
  implicit none
contains
  real(dp) function f(x)
    implicit none
    real(dp) :: x
    f = SIN(x)
  end function f
  real(dp) function q(i)
    implicit none
    real(dp) :: i
    q = 10 !Taking the largest degree of Legendre polynomials to be 10 for now
  end function q
end module InputControl

!------------------------------------------------------------------------------------------------------------------------------------------------
!
!This module contains all the problem-specific information needed for the code to run. Users seeking to modify the problem can edit this file.
!Function  f(x) defines the function to be plotted. Function legendre_degrees(i) defines the node distribution as a function of the element under consideration.
!Subroutine domain(x0,xI,I) can be used to edit the domain under consideration (endpoints x0 and xI) and the number of elements desired(I).
!
!------------------------------------------------------------------------------------------------------------------------------------------------
module InputControl
  use type_defs
  use quad_1dmod
  implicit none

contains

  function function_eval(num_pts, grd_pts)
    integer :: i
    integer, intent(in) :: num_pts
    real(dp), intent(in) :: grd_pts(0:num_pts)
    real(dp) :: function_eval(0:num_pts)

    !For now, simply use the function f = sin(x)
    function_eval = SIN(grd_pts)
  end function function_eval

  subroutine legendre_degrees(degree_vec)
    integer, parameter :: num_intervals = 5
    integer, intent(out) :: degree_vec(num_intervals)

    degree_vec(1:num_intervals) = (/ 12, 12, 12, 12, 12 /)
  end subroutine legendre_degrees

  subroutine domain(grd_pts)
    integer, parameter :: num_grdpts = 6
    real(dp), intent(out) :: grd_pts(num_grdpts)
    grd_pts = (/ 0.0_dp, 0.2_dp, 0.8_dp, 1.1_dp, 1.6_dp, 2.0_dp /)
  end subroutine domain

  subroutine delete_quad(num_quads, quad_array)
    integer, intent(in) :: num_quads
    type(quad_1d), intent(out) :: quad_array(num_quads)
    integer :: i 

    do i=1,num_quads
      call deallocate_quad1d(quad_array(i))
    end do
  end subroutine delete_quad

end module InputControl

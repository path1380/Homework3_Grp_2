!------------------------------------------------------------------------------------------------------------------------------------------------
!This is a template for the module InputControl. Here we use a perl script to modify specific strings to input different sets of
!nodes, Legendre degrees, or functions we wish to approximate. 
!------------------------------------------------------------------------------------------------------------------------------------------------
module InputControl
  use type_defs
  use quad_1dmod
  implicit none

contains

  function function_eval(num_pts, grd_pts)
    integer, intent(in) :: num_pts
    real(dp), intent(in) :: grd_pts(0:num_pts-1)
    real(dp) :: function_eval(0:num_pts-1)

    !Here replace the string sin(x) with the desired function
    !via a perl script
    function_eval = sin(grd_pts)
  end function function_eval

  subroutine legendre_degrees(degree_vec)
    integer, parameter :: num_intervals = 2
    integer, intent(out) :: degree_vec(num_intervals)

    degree_vec(1:num_intervals) = (/12, 12/)
  end subroutine legendre_degrees

  subroutine domain(grd_pts)
    integer, parameter :: num_grdpts = 3
    real(dp), intent(out) :: grd_pts(num_grdpts)

    grd_pts(1:num_grdpts) = (/0.0_dp, 0.3_dp, 1.0_dp/)
  end subroutine domain

  subroutine delete_quad(num_quads, quad_array)
    integer, intent(in) :: num_quads
    type(quad_1d) :: quad_array(num_quads)
    integer :: i 

    do i=1,num_quads
      call deallocate_quad1d(quad_array(i))
    end do
  end subroutine delete_quad
  
end module InputControl

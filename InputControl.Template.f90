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

    !Here replace the string FFFF with the desired function
    !via a perl script
    function_eval = FFFF
  end function function_eval

  subroutine legendre_degrees(degree_vec)
    integer, parameter :: num_intervals = IIII
    integer :: j
    integer, intent(out) :: degree_vec(num_intervals)
    do j=1,num_intervals
      degree_vec(j) = DDDD
    end do
  end subroutine legendre_degrees

  subroutine domain(grd_pts)
    integer, parameter :: num_grdpts = NNNN
    integer :: j=1
    real(dp) :: spacing
    real(dp), dimension(1:2) :: endpts
    real(dp), intent(out) :: grd_pts(1:num_grdpts)

    endpts(1:2) = PPPP
    spacing = (endpts(2)-endpts(1))/(num_grdpts-1)
    do j=1,num_grdpts
      grd_pts(j)=((j-1)*spacing)+endpts(1)
    end do
  end subroutine domain

  subroutine domain_equispaced(grd_pts)
    integer, parameter :: num_grdpts = NNNN
    real(dp), parameter :: lt_endpt = LLLL, rt_endpt = RRRR
    real(dp), intent(out) :: grd_pts(num_grdpts)
    integer :: i

    grd_pts(1) = lt_endpt

    do i=2,num_grdpts
      grd_pts(i) = lt_endpt + (i-1)*(rt_endpt - lt_endpt)/(num_grdpts - 1)
    end do

  end subroutine domain_equispaced

  subroutine delete_quad(num_quads, quad_array)
    integer, intent(in) :: num_quads
    type(quad_1d) :: quad_array(num_quads)
    integer :: i 

    do i=1,num_quads
      call deallocate_quad1d(quad_array(i))
    end do
  end subroutine delete_quad
  
end module InputControl

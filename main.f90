program main
! =======================================================================
! This program is the main program for Homework 3. Here we call 
! InputControl.f90 to get the desired grid and maximal Legendre polynomial
! degree in each interval. We loop over each interval and project the given
! function (defined in InputControl.f90) onto the space of Legendre
! polynomials in L2. We then evaluate the approximation on an 
! equispaced grid on each interval.
!
! CURRENT ISSUES: For some reason the approximation near x=0 seems to be 
! complete garbage. If we stay away from x=0 then everything seems to work
! just fine and we get (in this case) machine precision in each interval. 
! Also the deallocation at the end gives an error saying that we are 
! trying to deallocate something that was never allocated. This needs to 
! get looked at, but I thought I heard Daniel say that the compiler 
! just deallocates stuff anyway. We should figure this out just to be
! safe though.
! =======================================================================
  use type_defs
  use quad_1dmod
  use leg_funs
  use approx_funs 
  use InputControl
  use lgl
  use coeff

  implicit none

  integer, parameter :: num_grdpts = 6, num_nodes = 10
  integer :: degree_vec(num_grdpts - 1)
  real(dp) :: grdpts(num_grdpts), sample_nodes(num_nodes)
  real(dp) :: lt_endpt, rt_endpt, stepsize
  type(quad_1d) :: interval_info(num_grdpts - 1)
  type(quad_1d) :: approximation(num_grdpts-1)
  integer :: i, j

  !Grab grid information from InputControl
  call domain(grdpts)
  call legendre_degrees(degree_vec)

  !Compute coefficients for each interval
  do i = 1,num_grdpts-1
    lt_endpt = grdpts(i)
    rt_endpt = grdpts(i+1)

    !get coefficients in the current interval
    interval_info(i) = element(lt_endpt,rt_endpt,degree_vec(i))
    
    if(i == 1) then
      write(*,*) interval_info(i)%a(:,1)
    end if

    !build approximation
    approximation(i)%lt_endpt = lt_endpt
    approximation(i)%rt_endpt = rt_endpt
    approximation(i)%q = num_nodes - 1
    call allocate_quad1d(approximation(i))

    stepsize = (rt_endpt - lt_endpt)/dble(num_nodes + 1)
    do j=1,num_nodes
      sample_nodes(j) = lt_endpt + j*stepsize
    end do

    !evaluate at a new set of gridpoints
     approximation(i)%a(:,1) = approx_eval(lt_endpt,rt_endpt,num_nodes,sample_nodes,degree_vec(i),interval_info(i)%a(:,1))
     ! write(*,*) i
     ! write(*,*) "Here are the sample nodes"
     ! write(*,*) sample_nodes
     ! write(*,*) "Here's the approximation"
     ! write(*,*) approximation(i)%a(:,1)
  end do

  !Deallocate all used memory (CURRENTLY BROKEN)
  !call delete_quad(num_grdpts-1, interval_info)

end program main

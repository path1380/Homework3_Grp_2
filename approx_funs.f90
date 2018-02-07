module approx_funs
! ================================================================
! Contains functions for evaluating the approximate solution
! on a given grid.
! ================================================================
use type_defs
use leg_funs
implicit none

contains

    function approx_eval(num_grdpts,grdpts,leg_degree,leg_coeffs)
        ! ========================================================
        ! Inputs: - num_grdpts : Number of gridpoints appoximate
        !                        solution is to be evaluated on
        !         - grdpts     : array containing gridpoints
        !         - leg_degree : highest degree of Legendre poly
        !                        used   
        !         - leg_coeffs : computed coefficients of 
        !                        Legendre poly projection
        !
        ! Output:   1D Array of approximate function values on the 
        !           given grid
        ! ========================================================
        integer, intent(in) :: num_grdpts, leg_degree
        real(dp), dimension(num_grdpts), intent(in) :: grdpts
        real(dp), dimension(0:leg_degree), intent(in) :: leg_coeffs
        real(dp), dimension(0:leg_degree) :: temp_array
        real(dp), dimension(num_grdpts) :: approx_eval
        real(dp) :: temp_sum
        integer :: n, j

        do n = 1, num_grdpts
            !reset temporary sum back to 0
            temp_sum = 0.0_dp
            
            !evaluate each Legendre poly at a given gridpoint
            temp_array = leg(leg_degree, grdpts(n))

            !multiply by coefficient to get true approximation
            do j = 0, leg_degree
                temp_sum = temp_sum + leg_coeffs(j)*temp_array(j)
            end do

            approx_eval(n) = temp_sum
        end do

    end function approx_eval
end module approx_funs

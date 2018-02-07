program test_approx_funs
    use type_defs
    use leg_funs
    use approx_funs

    implicit none
    integer, parameter :: leg_degree = 5, num_grdpts = 10
    real(dp), dimension(num_grdpts) :: grdpts 
    real(dp), dimension(0:leg_degree) :: leg_coeffs
    real(dp), dimension(num_grdpts) :: approx 
    integer n, j

    do n=1, num_grdpts
    	grdpts(n) = -1.0_dp + 2.0_dp*n/num_grdpts
    end do

    do j = 0, leg_degree
    	leg_coeffs(j) = 1.0_dp
    end do

    approx = approx_eval(num_grdpts,grdpts,leg_degree,leg_coeffs)

    write(*,*) approx
end program test_approx_funs

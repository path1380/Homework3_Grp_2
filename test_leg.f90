program test_leg
    use type_defs
    use leg_funs
    implicit none
    integer, parameter :: q = 4
    real(dp) :: x
    real(dp), dimension(0:q) :: leg_arr

    x = 0.5_dp
    leg_arr = leg(q, x)

    write(*,*) leg_arr

end program test_leg

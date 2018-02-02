module leg_funs
    ! Ref: https://stackoverflow.com/questions/3828094/function-returning-an-array-in-fortran
    use type_defs
    implicit none

contains

    function leg(k,x)
        ! Ref: http://www2.me.rochester.edu/courses/ME201/webexamp/legendre.pdf
        ! Ref: https://people.sc.fsu.edu/~jburkardt/f_src/legendre_polynomial/legendre_polynomial.html
        real(dp), intent(in) :: x
        integer, intent(in) :: k    ! TODO: Should we assign an int precision?
        integer :: n 
        real(dp), dimension(0:k) :: leg

        ! TODO: Create array of size k, return 1, x, 1/2*(3x^2 - 1), ...
        ! If k = 1, make sure you only return 1

        ! if (k .lt. 0) then
        !     write(*,*) "Invalid value for k!"
        !     ! TODO: Exit function
        ! end if

        leg(0) = 1
        leg(1) = x
        do n = 2, k
            leg(n) = (2*n-1)/n * x * leg(n-1) - (n-1)/n * leg(n-2)
        end do

    end function leg
end module

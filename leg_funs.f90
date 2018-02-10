module leg_funs
! ================================================================
! Contains functions for evaluating Legendre polynomials
! Ref: http://www2.me.rochester.edu/courses/ME201/webexamp/legendre.pdf
! Ref: https://people.sc.fsu.edu/~jburkardt/f_src/legendre_polynomial/legendre_polynomial.html
! Ref: https://stackoverflow.com/questions/3828094/function-returning-an-array-in-fortran
! ================================================================
use type_defs
implicit none

contains

    function leg(k,x)
        ! ========================================================
        ! Inputs: k (highest degree of polynomial), x (coordinate)
        ! Output: 1D Array of Leg. Polynomials degree 0-> k at
        !           location x
        ! ========================================================
        real(dp), intent(in) :: x
        integer, intent(in) :: k
        integer :: n
        real(dp), dimension(0:k) :: leg

        leg(0) = 1
        leg(1) = x
        do n = 1, k-1
            ! Recurive relation for Legendre polynomials of degree > 1 (Wiki)
            leg(n+1) = ((2*n+1)*x*leg(n) - n*leg(n-1))/(n+1)
        end do

    end function leg
end module

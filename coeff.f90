module coeff
!--------------------------------------------------------------------------------------------------------------
  ! This module defines the function c(i,k) which returns the coefficient c(i,k) where i is the element number
  ! and k is the term number in the summation. 
!--------------------------------------------------------------------------------------------------------------
  use type_defs
  use InputControl
  use lgl
  use quad_1dmod
  use leg_funs
  implicit none
contains
    !-------------------------------------------------------------------------------------------------------------
  !
  !This function contains all the relevant element information. I is the number of elements and j is the element number, q1 is the highest degree for the element
  !x0 is the leftmost point of the domain, xI is the rightmost point, xL is the leftmost point of the given element,
  !xR is the rightmost point. width is the width of the element.
  !
  !-------------------------------------------------------------------------------------------------------------
  type(quad_1d) function element(j)
    use type_defs
    use InputControl
    use lgl
    use quad_1dmod
    implicit none
    integer :: j
    integer :: I
    real(dp) :: x0,xI,xL,xR,width 
    type(quad_1d) :: ele
    real(dp) :: x(0:10),w(0:10)
    ele%q=10
    ele%nvars=1
    call allocate_quad1d(ele)
    call lglnodes(x,w,10)
    call domain(x0,xI,I)
    width=(xI-x0)/I
    xL=x0+((j-1)*width)
    xR=x0+(j*width)
    x=x*width/2                   !Scaling
    x=x+(width/2)+xL              !Shifting the origin
    ele%a(:,1)=x(:)
    element=ele
  end function element
   !------------------------------------------------------------------------------------------------------------------
  !
  !This function evaluates c. leg_norm_squared is the square of the L2 norm of the Legendre polynomial of degree k.
  !ele is a quad variable containing information of the ith element, w is the array of calculated weights by lglnodes,
  !
  !
  !-----------------------------------------------------------------------------------------------------------------
  
real(dp) function c(k,i)
    use type_defs
    use InputControl
    use lgl
    use quad_1dmod
    implicit none    
    Integer :: k,i,l
    real(dp) :: x(0:10),w(0:10),fun(0:10)
    real(dp) :: d(0:10),leg_norm_squared,g,width
    type(quad_1d) :: ele
    leg_norm_squared=2.d0/((2.d0*k)+1)
    call lglnodes(x,w,10)
    ele=element(i)
    x=ele%a(:,1)
    width=x(10)-x(0)
    g=0.d0
    do l=0,10
       d=leg(10,ele%a(l,1))
       fun(l)=f(ele%a(l,1))*d(k)
       g=g+(w(l)*fun(l))
       write(*,*),ele%a(l,1),w(l),w(l)*fun(l),g
    end do
    c=dot_product(fun,w)
    c=c*width/(2*leg_norm_squared)
  end function c
end module coeff
!--------------------------------------------------------------------------------------------------------------
!
!Potential Improvements : 1. Find a way to use and call q(i). 2. Find a way to dynamically deallocate memory
!Aim : To be able to run the code for any case without editing any file other than InputControl.f90
!
!--------------------------------------------------------------------------------------------------------------
  

program main
  !This works with quad_1d.f90 to define the array.
  use type_defs
  use quad_1dmod
  implicit none
  type(quad_1d)::element1(10)
  integer::i

  do i=1,10
    element1(i)%q=5
    element1(i)%nvars=1
    call allocate_quad1d(element1(i))
  end do

end program main

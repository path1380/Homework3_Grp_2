module quad_1dmod
  !This the requested module.
  use type_defs
  implicit none

  type quad_1d
     integer :: nvars, q
     real(kind=dp), allocatable, dimension(:,:) :: a
  end type quad_1d

contains
  
  subroutine allocate_quad1d(el)
    type(quad_1d)::el
    allocate(el%a(0:el%q,el%nvars))
  end subroutine allocate_quad1d
  
  subroutine deallocate_quad1d(el)
    type(quad_1d)::el
    deallocate(el%a)
  end subroutine deallocate_quad1d

end module quad_1dmod

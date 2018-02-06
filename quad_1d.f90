module quad_1d
  !This is a theoretically complete draft, but likely has syntax errors.
  use type_defs
  implicit none
  integer :: nvars, q
  alloc(q,nvars)
  type quad_1d
     real(kind=dp), dimension(0:q,nvars) :: a
  end type quad_1d
  dealloc
end module quad_1d

subroutine alloc(q,nvars)
  allocate(a(0:q,nvars))
end subroutine alloc

subroutine dealloc
  dealloc(a)
end subroutine dealloc
  

PROGRAM MAIN
USE FUNCT
USE MINIMO
USE WHITENOISE

IMPLICIT NONE
INTEGER:: P, Q, I, J, ITER
INTEGER, PARAMETER:: T=5399500, NTRY=49
REAL*8, ALLOCATABLE, DIMENSION(:):: Y, TH, X
!!!!!!! TEXT FILES
INTEGER,ALLOCATABLE, DIMENSION(:):: UNITV
CHARACTER (LEN=10), ALLOCATABLE, DIMENSION(:):: FNAME
CHARACTER (LEN=10):: EGTEXT
!!!!!!!
!T=1079900 25dat_x_seg
!T=5399500 125dat_x_seg
!NTRY=P*Q
ALLOCATE(Y(1:T), TH(1:P+Q+1), X(1:T), UNITV(1:NTRY), FNAME(1:NTRY))

OPEN(UNIT=111, FILE='125DATXSEG*1E-4_EC.RVRD.00.HHZ.D.2009.259.dat', STATUS='UNKNOWN')
	DO J=1, T
		READ(111,*) Y(J)
	END DO 
 CLOSE(111)

EGTEXT='six00.dat'
UNITV=0
J=601
DO I=1, NTRY
	CALL FILENAME_INC(EGTEXT)
	FNAME(I)= EGTEXT
	UNITV(I)=J
	J=J+1	
END DO 

DO I=1,NTRY
	OPEN(UNIT=UNITV(I), FILE=FNAME(I),STATUS='UNKNOWN')!STATUS = 'REPLACE' ) 
END DO

I=1
DO P=1,7
	DO Q=1,7
		X=0D0; TH=0D0
		TH=(/0.01268D0,0.00278D0,0.01718D0,-0.0018129D0,0.016802D0,-0.0111D0,&
		-0.01904D0,0.01268D0,0.01718D0,-0.018129D0,0.0156802D0,0.0278D0,&
		-0.0229D0,0.0056802D0,0.00718D0/)
		CALL TSERIES(T,P,Q,Y,TH,ITER,X)
		WRITE(UNITV(I),*) '#',ITER, P, Q
		DO J=1, SIZE(X)
			WRITE(UNITV(I),*) X(J)
		ENDDO 
		I=I+1
	END DO 
END DO 


DO I=1, NTRY
 CLOSE(UNIT=UNITV(I))
END	DO 


DEALLOCATE(Y, TH, X, UNITV, FNAME)

CONTAINS

subroutine filename_inc ( filename )

!*****************************************************************************80
!
!! FILENAME_INC increments a partially numeric filename.
!
!  Discussion:
!
!    It is assumed that the digits in the name, whether scattered or
!    connected, represent a number that is to be increased by 1 on
!    each call.  If this number is all 9's on input, the output number
!    is all 0's.  Non-numeric letters of the name are unaffected.
!
!    If the name is empty, then the routine stops.
!
!    If the name contains no digits, the empty string is returned.
!
!  Example:
!
!      Input            Output
!      -----            ------
!      'a7to11.txt'     'a7to12.txt'
!      'a7to99.txt'     'a8to00.txt'
!      'a9to99.txt'     'a0to00.txt'
!      'cat.txt'        ' '
!      ' '              STOP!
!
!  Licensing:
!
!    This code is distributed under the GNU LGPL license. 
!
!  Modified:
!
!    19 September 2012
!
!  Author:
!
!    John Burkardt
!
!  Parameters:
!
!    Input/output, character ( len = * ) FILENAME.
!    On input, a character string to be incremented.
!    On output, the incremented string.
!
  implicit none

  character c
  integer ( kind = 4 ) change
  integer ( kind = 4 ) digit
  character ( len = * ) filename
  integer ( kind = 4 ) i
  integer ( kind = 4 ) lens

  lens = len_trim ( filename )

  if ( lens <= 0 ) then
    write ( *, '(a)' ) ' '
    write ( *, '(a)' ) 'FILENAME_INC - Fatal error!'
    write ( *, '(a)' ) '  The input string is empty.'
    stop
  end if

  change = 0

  do i = lens, 1, -1

    c = filename(i:i)

    if ( lge ( c, '0' ) .and. lle ( c, '9' ) ) then

      change = change + 1

      digit = ichar ( c ) - 48
      digit = digit + 1

      if ( digit == 10 ) then
        digit = 0
      end if

      c = char ( digit + 48 )

      filename(i:i) = c

      if ( c /= '0' ) then
        return
      end if

    end if

  end do
!
!  No digits were found.  Return blank.
!
  if ( change == 0 ) then
    filename = ' '
    return
  end if

  return
end subroutine



END PROGRAM

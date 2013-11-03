C BEAM
      REAL P, E, I, DX, B, AMAX, ALDEF, ACEN, X
      INTEGER L
      COMMON /FIRST/ DX, L, B, X /SECOND/ P, E, I, AMAX, ALDEF, ACEN
C READ DATA FROM USER
      PRINT 110, 'ENTER THE LENGTH OF BEAM IN INCHES:'
      READ *, L
      PRINT 110, 'ENTER THE LOAD:'
      READ *, P
      PRINT 110, 'ENTER THE MODULUS OF ELASTICITY:'
      READ *, E
      PRINT 110, 'ENTER THE MOMENT OF INERTIA:'
      READ *, I
      PRINT 110, 'ENTER THE INCREMENT TO BE USED IN INCHES:'
      READ *, DX
C USING DX FOR A, AND NOW WE NEED TO CALCULATE B
      B = L - DX
      X = 0
      PRINT 110, 'LOAD POSITION          MAX          LDEF          CEN'
C LOOP THROUGH THE GENERATIONS PRINTING INFO
10    IF (B .GT. X) THEN
         CALL STEPDX
         PRINT 120, X, AMAX, ALDEF, ACEN
         GO TO 10
      ENDIF
110   FORMAT (A)
120   FORMAT (F13.2,3F18.7)
      END

      SUBROUTINE STEPDX
      REAL DX, B, X
      INTEGER L
      COMMON /FIRST/ DX, L, B, X
      X = X + DX
      B = L - X
      CALL COMPUTE
      END

      SUBROUTINE COMPUTE
      REAL P, E, I, DX, AMAX, ALDEF, ACEN, B, X
      INTEGER L
      COMMON /FIRST/ DX, L, B, X /SECOND/ P, E, I, AMAX, ALDEF, ACEN
      IF(X .GE. B) THEN
         AMAX = (-P*B*(L*L - B*B)**(3 / 2)) / (9*SQRT(3.0)*E*I*L)
         ALDEF = (-P*(X*X)*(B*B)) / (3*E*I*L)
         ACEN = (-P*B*(3*(L*L)-4*(B*B))) / (48*E*I)
      ELSE
         AMAX = (-P*X*(L*L - X*X)**(3 / 2)) / (9*SQRT(3.0)*E*I*L)
         ALDEF = (-P*(X*X)*(X*X)) / (3*E*I*L)
         ACEN = (-P*X*(3*(L*L)-4*(X*X))) / (48*E*I)
      ENDIF
      END

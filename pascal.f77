      INTEGER MAX
      PARAMETER (MAXD = 10)
      INTEGER PAS(MAXD,MAXD)
      INTEGER N
      N = 6
C CALL SUBROUTINE TO COMPUTE N ROWS OF PASCAL'S TRIANGLE
      CALL RUNPAS(PAS,MAXD,N)
C CALL SUBROUTINE TO PRINT DATA
      CALL PRTPAS(PAS,MAXD,N)
      END


      SUBROUTINE RUNPAS(PAS,MAXD,N)
      INTEGER MAXD, N, I, J
      INTEGER PAS(MAXD,*)
C SET ALL THE ELEMENTS IN THE ARRAY TO ZERO
      DO 20 I=1,N
         DO 10 J=1,N
            PAS(I,J) = 0
   10 CONTINUE
   20 CONTINUE
C SET FIRST ROW TO 1
      PAS(1,1) = 1
C COMPUTE PASCAL'S TRIANGE AND SET THE ARRAY ELEMENTS
      DO 110 I=2,N
         DO 100 J=1,N
            IF(J .EQ. 1) THEN
               PAS(I,J) = PAS(I-1,J)
            ELSE
               PAS(I,J) = PAS(I-1,J) + PAS(I-1,J-1)
            ENDIF
  100 CONTINUE
  110 CONTINUE
      END

C SUBROUTINE TO PRINT PASCAL'S TRIANGLE
      SUBROUTINE PRTPAS(PAS,MAXD,N)
      INTEGER MAXD, N, I, J
      INTEGER PAS(MAXD,*)
      DO 120 I=1,N
         PRINT *, (PAS(I,J), J=1,I)
  120 CONTINUE
      END

C  INTRODUCTORY FORTRAN PROGRAM
C
      INTEGER N,J
      REAL X,TERM,SUM
C
      READ *,X,N
      PRINT 10,X,N
   10 FORMAT(' X =',1PG13.5,6X,'N =',I3)
C
C  COMPUTE THE SUM OF THE FIRST N+1 TERMS OF
C
C     EXP(X) = 1 + X + X**2/2 + X**3/6 + X**4/24 + ...
C                + X**N/FACTORIAL(N) + ...

      TERM=1.0
      SUM=1.0
      DO 20 J=1,N
         TERM=TERM*(X/J)
         SUM=SUM+TERM
   20 CONTINUE
C
      PRINT 30,SUM
   30 FORMAT(/' APPROXIMATION TO EXP(X) =',1PG15.7)
      STOP
      END

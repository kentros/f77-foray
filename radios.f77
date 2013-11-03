C RADIOS
      REAL CCOST, RCOST, TCOST
      PRINT *, 'ENTER COST PER CAPACITOR: '
      READ *, CCOST
      PRINT *, 'ENTER COST PER RESISTOR: '
      READ *, RCOST
      PRINT *, 'ENTER COST PER TRANSISTOR: '
      READ *, TCOST
      PRINT *, 'CAPACITOR COST  :', CCOST
      PRINT *, 'RESISTOR COST   :', RCOST
      PRINT *, 'TRANSISTOR COST : ', TCOST
C CALL SUBROUTINE TO PRINT DATA
      CALL PRTAB(CCOST, RCOST, TCOST)
      END


      SUBROUTINE PRTAB(CCOST, RCOST, TCOST)
      REAL CCOST, RCOST, TCOST
      INTEGER NROWS, NCOLS, J, K
      PARAMETER (NROWS=4, NCOLS=3)
      INTEGER NCOMPN(NROWS, NCOLS)
      DATA NCOMPN /2, 6, 13, 8, 6, 11, 29, 14, 3, 5, 10, 7/
C PRINT THE TABLE LIKE IN THE BOOK
      PRINT *, '-------------------------------'
      PRINT *, 'RADIO |'
      PRINT *, 'TYPE  |       C       R       T'
      PRINT *, '-------------------------------'
      DO 20 J=1, NROWS
         PRINT 10,J,(NCOMPN(J,K),K=1,NCOLS)
10       FORMAT (I6,' |',3I8)
20    CONTINUE
      PRINT *, '--------------------------------'
C PRINT THE TABLE OF THE COST OF THE THREE TYPES
C WARNING!  I'M USING MAGIC NUMBERS FOR THE COLUMN
C           AND ASSUMING COLUMNS = 3
C           BECAUSE IT WOULD NOT FUNCTION IF THE
C           NCOLS DID NOT EQUAL 3
      PRINT *, '----------------------------------'
      PRINT *, 'RADIO |     C        R        T   '
      PRINT *, 'TYPE  |     COST     COST     COST'
      PRINT *, '----------------------------------'
      DO 40 J=1, NROWS
         PRINT 30,J,(NCOMPN(J,1)*CCOST),(NCOMPN(J,2)*RCOST),
     +              (NCOMPN(J,3)*TCOST)
30       FORMAT (I6, ' |', 3F9.2)
40    CONTINUE
      PRINT *, '----------------------------------'
      END

C FINDING PERIMETER AND AREA OF A TRIANGLE GIVEN 3 SIDES
      REAL PRODINC, TPROFIT, CPROFIT
      INTEGER NCASTS, NPROFIT, FIXED, NRD, MULT
      FIXED = 20000
      NPROFIT = 300
      NCASTS = 200
      NRD = 2000
      PRODINC = 1.2
      MULT = 2
      TPROFIT = (NCASTS*NPROFIT)-FIXED-NRD
      CPROFIT = TPROFIT
      PRINT *, 'CASTINGS PER MONTH:', NCASTS
      PRINT *, 'MONEY SPENT ON R&D:', NRD
      PRINT *, 'NET PROFIT:        ', TPROFIT
      PRINT *, '--'
C USING A GOTO TO DO THE FOLLOWING LOOP
C IT KEEPS GOING UNTIL THE PROFIT BECOMES
C LOWER THAN THE PREVIOUS PROFIT
10    IF (TPROFIT .GE. CPROFIT) THEN
         CPROFIT = TPROFIT
         NRD = NRD*MULT
         NCASTS = NCASTS*PRODINC
         TPROFIT = (NCASTS*NPROFIT)-FIXED-NRD
         PRINT *, 'DOUBLING MONEY SPENT ON R&D...'
         PRINT *, 'CASTINGS PER MONTH:', NCASTS
         PRINT *, 'MONEY SPENT ON R&D:', NRD
         PRINT *, 'NET PROFIT:        ', TPROFIT
         PRINT *, '--'
      GO TO 10
      ENDIF
      PRINT *, 'THE LAST ONE IS WHERE NET PROFIT BEGINS TO DECLINE'
      END

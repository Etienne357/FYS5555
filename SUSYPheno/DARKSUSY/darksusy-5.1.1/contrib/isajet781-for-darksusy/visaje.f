CDECK  ID>, VISAJE.
      CHARACTER*40 FUNCTION VISAJE()
      COMMON/IDRUN/IDVER,IDG(2),IEVT,IEVGEN
      SAVE /IDRUN/
      INTEGER   IDVER,IDG,IEVT,IEVGEN
      VISAJE = ' ISAJET     V7.81   26-APR-2011 16:50:35'
      IDVER = 781
      RETURN
      END

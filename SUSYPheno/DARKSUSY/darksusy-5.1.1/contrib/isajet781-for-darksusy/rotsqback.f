!
      SUBROUTINE ROTSQBACK(GROT,GUNROT)
!
!Purpose: To rotate the couplings back from the squark mass
!         basis to the old current basis
!
      IMPLICIT NONE
!
      COMMON /SQROT/ RQTOT,RUPTOT,RDTOT,RLTOT,RETOT
     $               ,RQSAV,RUPSAV,RDSAV,RLSAV,RESAV
     $               ,OLDNSQ,OLDNSU,OLDNSD,OLDNSL,OLDNSE
      DOUBLE COMPLEX RQTOT(3,3),RUPTOT(3,3),RDTOT(3,3)
      DOUBLE COMPLEX RLTOT(3,3),RETOT(3,3)
      DOUBLE COMPLEX RQSAV(2,3,3),RUPSAV(2,3,3),RDSAV(2,3,3)
      DOUBLE COMPLEX RLSAV(2,3,3),RESAV(2,3,3)
      INTEGER OLDNSQ,OLDNSU,OLDNSD,OLDNSL,OLDNSE
      SAVE /SQROT/
!
      DOUBLE COMPLEX GUNROT(601),GROT(601),CMATMUL
!
      DOUBLE COMPLEX FU(3,3),FD(3,3),FE(3,3),AU(3,3),AD(3,3),AE(3,3)
      DOUBLE COMPLEX MQ(3,3),ML(3,3),MUP(3,3),MD(3,3),ME(3,3)
      DOUBLE COMPLEX FUM(3,3),FDM(3,3),FEM(3,3)
      DOUBLE COMPLEX AUM(3,3),ADM(3,3),AEM(3,3)
      DOUBLE COMPLEX MQM(3,3),MLM(3,3),MUPM(3,3),MDM(3,3),MEM(3,3)
      DOUBLE COMPLEX LU(3,3),LD(3,3),LE(3,3)
      DOUBLE COMPLEX GTPQ(3,3),GTPL(3,3),GTPU(3,3),GTPD(3,3)
      DOUBLE COMPLEX GTPE(3,3),GTQ(3,3),GTL(3,3),GTSQ(3,3)
      DOUBLE COMPLEX GTSU(3,3),GTSD(3,3),FTUQ(3,3),FTDQ(3,3)
      DOUBLE COMPLEX FTEL(3,3),FTUU(3,3),FTDD(3,3),FTEE(3,3)
      DOUBLE COMPLEX TRIU(3,3),TRID(3,3),TRIE(3,3)
      DOUBLE COMPLEX MTSFU(3,3),MTSFD(3,3),MTSFE(3,3)
!
      DOUBLE COMPLEX FUT(3,3),FDT(3,3),FET(3,3)
      DOUBLE COMPLEX AUT(3,3),ADT(3,3),AET(3,3)
      DOUBLE COMPLEX MQT(3,3),MLT(3,3),MUPT(3,3),MDT(3,3),MET(3,3)
      DOUBLE COMPLEX FUMT(3,3),FDMT(3,3),FEMT(3,3)
      DOUBLE COMPLEX AUMT(3,3),ADMT(3,3),AEMT(3,3)
      DOUBLE COMPLEX MQMT(3,3),MLMT(3,3),MUPMT(3,3),MDMT(3,3),MEMT(3,3)
      DOUBLE COMPLEX LUT(3,3),LDT(3,3),LET(3,3)
      DOUBLE COMPLEX GTPQT(3,3),GTPLT(3,3),GTPUT(3,3),GTPDT(3,3)
      DOUBLE COMPLEX GTPET(3,3),GTQT(3,3),GTLT(3,3),GTSQT(3,3)
      DOUBLE COMPLEX GTSUT(3,3),GTSDT(3,3),FTUQT(3,3),FTDQT(3,3)
      DOUBLE COMPLEX FTELT(3,3),FTUUT(3,3),FTDDT(3,3),FTEET(3,3)
      DOUBLE COMPLEX TRIUT(3,3),TRIDT(3,3),TRIET(3,3)
      DOUBLE COMPLEX MTSFUT(3,3),MTSFDT(3,3),MTSFET(3,3)
!
      DOUBLE COMPLEX RQT(3,3),RUPT(3,3),RDT(3,3),RLT(3,3),RET(3,3)
!
      INTEGER I,J
!
      DO I=1,601
        GUNROT(I)=GROT(I)
      END DO
!
      DO I=1,3
        DO J=1,3
          FU(I,J)=GROT(3+(I-1)*3+J)
          FD(I,J)=GROT(12+(I-1)*3+J)
          FE(I,J)=GROT(21+(I-1)*3+J)
          AU(I,J)=GROT(33+(I-1)*3+J)
          AD(I,J)=GROT(42+(I-1)*3+J)
          AE(I,J)=GROT(51+(I-1)*3+J)
          MQ(I,J)=GROT(62+(I-1)*3+J)
          ML(I,J)=GROT(71+(I-1)*3+J)
          MUP(I,J)=GROT(80+(I-1)*3+J)
          MD(I,J)=GROT(89+(I-1)*3+J)
          ME(I,J)=GROT(98+(I-1)*3+J)
!
          FUM(I,J)=GROT(293+(I-1)*3+J)
          FDM(I,J)=GROT(302+(I-1)*3+J)
          FEM(I,J)=GROT(311+(I-1)*3+J)
          AUM(I,J)=GROT(323+(I-1)*3+J)
          ADM(I,J)=GROT(332+(I-1)*3+J)
          AEM(I,J)=GROT(341+(I-1)*3+J)
          MQM(I,J)=GROT(352+(I-1)*3+J)
          MLM(I,J)=GROT(361+(I-1)*3+J)
          MUPM(I,J)=GROT(370+(I-1)*3+J)
          MDM(I,J)=GROT(379+(I-1)*3+J)
          MEM(I,J)=GROT(388+(I-1)*3+J)
!
          LU(I,J)=GROT(111+(I-1)*3+J)
          LD(I,J)=GROT(120+(I-1)*3+J)
          LE(I,J)=GROT(129+(I-1)*3+J)
!
          GTPQ(I,J)=GROT(138+(I-1)*3+J)
          GTPL(I,J)=GROT(147+(I-1)*3+J)
          GTPU(I,J)=GROT(156+(I-1)*3+J)
          GTPD(I,J)=GROT(165+(I-1)*3+J)
          GTPE(I,J)=GROT(174+(I-1)*3+J)
          GTQ(I,J)=GROT(185+(I-1)*3+J)
          GTL(I,J)=GROT(194+(I-1)*3+J)
          GTSQ(I,J)=GROT(205+(I-1)*3+J)
          GTSU(I,J)=GROT(214+(I-1)*3+J)
          GTSD(I,J)=GROT(223+(I-1)*3+J)
          FTUQ(I,J)=GROT(232+(I-1)*3+J)
          FTDQ(I,J)=GROT(241+(I-1)*3+J)
          FTEL(I,J)=GROT(250+(I-1)*3+J)
          FTUU(I,J)=GROT(259+(I-1)*3+J)
          FTDD(I,J)=GROT(268+(I-1)*3+J)
          FTEE(I,J)=GROT(277+(I-1)*3+J)
!
          TRIU(I,J)=GROT(399+(I-1)*3+J)
          TRID(I,J)=GROT(408+(I-1)*3+J)
          TRIE(I,J)=GROT(417+(I-1)*3+J)
          MTSFU(I,J)=GROT(429+(I-1)*3+J)
          MTSFD(I,J)=GROT(438+(I-1)*3+J)
          MTSFE(I,J)=GROT(447+(I-1)*3+J)
!
          RQT(I,J)=RQTOT(J,I)
          RUPT(I,J)=RUPTOT(J,I)
          RDT(I,J)=RDTOT(J,I)
          RLT(I,J)=RLTOT(J,I)
          RET(I,J)=RETOT(J,I)
        END DO
      END DO
!
      DO I=1,3
        DO J=1,3
          FUT(I,J)=CMATMUL(0,FU,RUPT,I,J)
          FDT(I,J)=CMATMUL(0,FD,RDT,I,J)
          FET(I,J)=CMATMUL(0,FE,RET,I,J)
          AUT(I,J)=CMATMUL(0,AU,RUPT,I,J)
          ADT(I,J)=CMATMUL(0,AD,RDT,I,J)
          AET(I,J)=CMATMUL(0,AE,RET,I,J)
          MQT(I,J)=CMATMUL(2,MQ,RQTOT,I,J)
          MLT(I,J)=CMATMUL(2,ML,RLTOT,I,J)
          MUPT(I,J)=CMATMUL(2,MUP,RUPTOT,I,J)
          MDT(I,J)=CMATMUL(2,MD,RDTOT,I,J)
          MET(I,J)=CMATMUL(2,ME,RETOT,I,J)
!
          FUMT(I,J)=CMATMUL(0,FUM,RUPT,I,J)
          FDMT(I,J)=CMATMUL(0,FDM,RDT,I,J)
          FEMT(I,J)=CMATMUL(0,FEM,RET,I,J)
          AUMT(I,J)=CMATMUL(0,AUM,RUPT,I,J)
          ADMT(I,J)=CMATMUL(0,ADM,RDT,I,J)
          AEMT(I,J)=CMATMUL(0,AEM,RET,I,J)
          MQMT(I,J)=CMATMUL(2,MQM,RQTOT,I,J)
          MLMT(I,J)=CMATMUL(2,MLM,RLTOT,I,J)
          MUPMT(I,J)=CMATMUL(2,MUPM,RUPTOT,I,J)
          MDMT(I,J)=CMATMUL(2,MDM,RDTOT,I,J)
          MEMT(I,J)=CMATMUL(2,MEM,RETOT,I,J)
!
          LUT(I,J)=CMATMUL(0,LU,RUPT,I,J)
          LDT(I,J)=CMATMUL(0,LD,RDT,I,J)
          LET(I,J)=CMATMUL(0,LE,RET,I,J)
!
          GTPQT(I,J)=CMATMUL(2,GTPQ,RQTOT,I,J)
          GTPLT(I,J)=CMATMUL(2,GTPL,RLTOT,I,J)
          GTPUT(I,J)=CMATMUL(2,GTPU,RUPTOT,I,J)
          GTPDT(I,J)=CMATMUL(2,GTPD,RDTOT,I,J)
          GTPET(I,J)=CMATMUL(2,GTPE,RETOT,I,J)
          GTQT(I,J)=CMATMUL(2,GTQ,RQTOT,I,J)
          GTLT(I,J)=CMATMUL(2,GTL,RLTOT,I,J)
          GTSQT(I,J)=CMATMUL(2,GTSQ,RQTOT,I,J)
          GTSUT(I,J)=CMATMUL(2,GTSU,RUPTOT,I,J)
          GTSDT(I,J)=CMATMUL(2,GTSD,RDTOT,I,J)
          FTUQT(I,J)=CMATMUL(0,FTUQ,RUPT,I,J)
          FTDQT(I,J)=CMATMUL(0,FTDQ,RDT,I,J)
          FTELT(I,J)=CMATMUL(0,FTEL,RET,I,J)
          FTUUT(I,J)=CMATMUL(0,FTUU,RUPT,I,J)
          FTDDT(I,J)=CMATMUL(0,FTDD,RDT,I,J)
          FTEET(I,J)=CMATMUL(0,FTEE,RET,I,J)
!
          TRIUT(I,J)=CMATMUL(0,TRIU,RUPT,I,J)
          TRIDT(I,J)=CMATMUL(0,TRID,RDT,I,J)
          TRIET(I,J)=CMATMUL(0,TRIE,RET,I,J)
          MTSFUT(I,J)=CMATMUL(0,MTSFU,RUPT,I,J)
          MTSFDT(I,J)=CMATMUL(0,MTSFD,RDT,I,J)
          MTSFET(I,J)=CMATMUL(0,MTSFE,RET,I,J)
        END DO
      END DO
!
      DO I=1,3
        DO J=1,3
          GUNROT(3+(I-1)*3+J)=CMATMUL(1,RQT,FUT,I,J)
          GUNROT(12+(I-1)*3+J)=CMATMUL(1,RQT,FDT,I,J)
          GUNROT(21+(I-1)*3+J)=CMATMUL(1,RLT,FET,I,J)
          GUNROT(33+(I-1)*3+J)=CMATMUL(1,RQT,AUT,I,J)
          GUNROT(42+(I-1)*3+J)=CMATMUL(1,RQT,ADT,I,J)
          GUNROT(51+(I-1)*3+J)=CMATMUL(1,RLT,AET,I,J)
          GUNROT(62+(I-1)*3+J)=CMATMUL(0,RQTOT,MQT,I,J)
          GUNROT(71+(I-1)*3+J)=CMATMUL(0,RLTOT,MLT,I,J)
          GUNROT(80+(I-1)*3+J)=CMATMUL(0,RUPTOT,MUPT,I,J)
          GUNROT(89+(I-1)*3+J)=CMATMUL(0,RDTOT,MDT,I,J)
          GUNROT(98+(I-1)*3+J)=CMATMUL(0,RETOT,MET,I,J)
!
          GUNROT(293+(I-1)*3+J)=CMATMUL(1,RQT,FUMT,I,J)
          GUNROT(302+(I-1)*3+J)=CMATMUL(1,RQT,FDMT,I,J)
          GUNROT(311+(I-1)*3+J)=CMATMUL(1,RLT,FEMT,I,J)
          GUNROT(323+(I-1)*3+J)=CMATMUL(1,RQT,AUMT,I,J)
          GUNROT(332+(I-1)*3+J)=CMATMUL(1,RQT,ADMT,I,J)
          GUNROT(341+(I-1)*3+J)=CMATMUL(1,RLT,AEMT,I,J)
          GUNROT(352+(I-1)*3+J)=CMATMUL(0,RQTOT,MQMT,I,J)
          GUNROT(361+(I-1)*3+J)=CMATMUL(0,RLTOT,MLMT,I,J)
          GUNROT(370+(I-1)*3+J)=CMATMUL(0,RUPTOT,MUPMT,I,J)
          GUNROT(379+(I-1)*3+J)=CMATMUL(0,RDTOT,MDMT,I,J)
          GUNROT(388+(I-1)*3+J)=CMATMUL(0,RETOT,MEMT,I,J)
!
          GUNROT(111+(I-1)*3+J)=CMATMUL(1,RQT,LUT,I,J)
          GUNROT(120+(I-1)*3+J)=CMATMUL(1,RQT,LDT,I,J)
          GUNROT(129+(I-1)*3+J)=CMATMUL(1,RLT,LET,I,J)
!
          GUNROT(138+(I-1)*3+J)=CMATMUL(0,RQTOT,GTPQT,I,J)
          GUNROT(147+(I-1)*3+J)=CMATMUL(0,RLTOT,GTPLT,I,J)
          GUNROT(156+(I-1)*3+J)=CMATMUL(0,RUPTOT,GTPUT,I,J)
          GUNROT(165+(I-1)*3+J)=CMATMUL(0,RDTOT,GTPDT,I,J)
          GUNROT(174+(I-1)*3+J)=CMATMUL(0,RETOT,GTPET,I,J)
          GUNROT(185+(I-1)*3+J)=CMATMUL(0,RQTOT,GTQT,I,J)
          GUNROT(194+(I-1)*3+J)=CMATMUL(0,RLTOT,GTLT,I,J)
          GUNROT(205+(I-1)*3+J)=CMATMUL(0,RQTOT,GTSQT,I,J)
          GUNROT(214+(I-1)*3+J)=CMATMUL(0,RUPTOT,GTSUT,I,J)
          GUNROT(223+(I-1)*3+J)=CMATMUL(0,RDTOT,GTSDT,I,J)
          GUNROT(232+(I-1)*3+J)=CMATMUL(1,RQT,FTUQT,I,J)
          GUNROT(241+(I-1)*3+J)=CMATMUL(1,RQT,FTDQT,I,J)
          GUNROT(250+(I-1)*3+J)=CMATMUL(1,RLT,FTELT,I,J)
          GUNROT(259+(I-1)*3+J)=CMATMUL(1,RQT,FTUUT,I,J)
          GUNROT(268+(I-1)*3+J)=CMATMUL(1,RQT,FTDDT,I,J)
          GUNROT(277+(I-1)*3+J)=CMATMUL(1,RLT,FTEET,I,J)
!
          GUNROT(399+(I-1)*3+J)=CMATMUL(1,RQT,TRIUT,I,J)
          GUNROT(408+(I-1)*3+J)=CMATMUL(1,RQT,TRIDT,I,J)
          GUNROT(417+(I-1)*3+J)=CMATMUL(1,RLT,TRIET,I,J)
          GUNROT(429+(I-1)*3+J)=CMATMUL(1,RQT,MTSFUT,I,J)
          GUNROT(438+(I-1)*3+J)=CMATMUL(1,RQT,MTSFDT,I,J)
          GUNROT(447+(I-1)*3+J)=CMATMUL(1,RLT,MTSFET,I,J)
        END DO
      END DO
!
      RETURN
      END

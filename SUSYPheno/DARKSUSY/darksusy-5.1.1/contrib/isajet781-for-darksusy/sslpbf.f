CDECK  ID>, SSLPBF.
        SUBROUTINE SSLPBF
C--------------------------------------------------------
C
C        This program gives slepton branching fractions to gauginos
C        according to Baer,Bartl,Karatas,Majerotto,Tata 
C        (Int. J. Mod. Phys. A4,4111 (1989); updated 10/21/96
C
C
C-------------------------------------------------------
      IMPLICIT NONE
      COMMON/SSLUN/LOUT,LHEOUT
      INTEGER LOUT,LHEOUT
      SAVE /SSLUN/
C          MXSS         =  maximum number of modes
C          NSSMOD       = number of modes
C          ISSMOD       = initial particle
C          JSSMOD       = final particles
C          GSSMOD       = width
C          BSSMOD       = branching ratio
C          MSSMOD       = decay matrix element pointer
C          LSSMOD       = logical flag used internally by SSME3
      INTEGER MXSS
      PARAMETER (MXSS=1000)
      COMMON/SSMODE/NSSMOD,ISSMOD(MXSS),JSSMOD(5,MXSS),GSSMOD(MXSS)
     $,BSSMOD(MXSS),MSSMOD(MXSS),LSSMOD
      INTEGER NSSMOD,ISSMOD,JSSMOD,MSSMOD
      REAL GSSMOD,BSSMOD
      LOGICAL LSSMOD
      SAVE /SSMODE/
C          Standard model parameters
C          AMUP,...,AMTP        = quark masses
C          AME,AMMU,AMTAU       = lepton masses
C          AMW,AMZ              = W,Z masses
C          GAMW,GAMZ            = W,Z widths
C          ALFAEM,SN2THW,ALFA3  = SM couplings
C          ALQCD4               = 4 flavor lambda
      COMMON/SSSM/AMUP,AMDN,AMST,AMCH,AMBT,AMTP,AME,AMMU,AMTAU
     $,AMW,AMZ,GAMW,GAMZ,ALFAEM,SN2THW,ALFA2,ALFA3,ALQCD4
      REAL AMUP,AMDN,AMST,AMCH,AMBT,AMTP,AME,AMMU,AMTAU
     $,AMW,AMZ,GAMW,GAMZ,ALFAEM,SN2THW,ALFA2,ALFA3,ALQCD4
      SAVE /SSSM/
C          SUSY parameters
C          AMGLSS               = gluino mass
C          AMULSS               = up-left squark mass
C          AMELSS               = left-selectron mass
C          AMERSS               = right-slepton mass
C          AMNiSS               = sneutrino mass for generation i
C          TWOM1                = Higgsino mass = - mu
C          RV2V1                = ratio v2/v1 of vev's
C          AMTLSS,AMTRSS        = left,right stop masses
C          AMT1SS,AMT2SS        = light,heavy stop masses
C          AMBLSS,AMBRSS        = left,right sbottom masses
C          AMB1SS,AMB2SS        = light,heavy sbottom masses
C          AMLLSS,AMLRSS        = left,right stau masses
C          AML1SS,AML2SS        = light,heavy stau masses
C          AMZiSS               = signed mass of Zi
C          ZMIXSS               = Zi mixing matrix
C          AMWiSS               = signed Wi mass
C          GAMMAL,GAMMAR        = Wi left, right mixing angles
C          AMHL,AMHH,AMHA       = neutral Higgs h0, H0, A0 masses
C          AMHC                 = charged Higgs H+ mass
C          ALFAH                = Higgs mixing angle
C          AAT                  = stop trilinear term
C          THETAT               = stop mixing angle
C          AAB                  = sbottom trilinear term
C          THETAB               = sbottom mixing angle
C          AAL                  = stau trilinear term
C          THETAL               = stau mixing angle
C          AMGVSS               = gravitino mass
C          MTQ                  = top mass at MSUSY
C          MBQ                  = bottom mass at MSUSY
C          MLQ                  = tau mass at MSUSY
C          FBMA                 = b-Yukawa at mA scale
C          VUQ                  = Hu vev at MSUSY
C          VDQ                  = Hd vev at MSUSY
C          SGNM3                = sign of gaugino mass M3
      COMMON/SSPAR/GORGE,AMGLSS,AMULSS,AMURSS,AMDLSS,AMDRSS,AMSLSS
     $,AMSRSS,AMCLSS,AMCRSS,AMBLSS,AMBRSS,AMB1SS,AMB2SS
     $,AMTLSS,AMTRSS,AMT1SS,AMT2SS,AMELSS,AMERSS,AMMLSS,AMMRSS
     $,AMLLSS,AMLRSS,AML1SS,AML2SS,AMN1SS,AMN2SS,AMN3SS
     $,TWOM1,RV2V1,AMZ1SS,AMZ2SS,AMZ3SS,AMZ4SS,ZMIXSS(4,4)
     $,AMW1SS,AMW2SS
     $,GAMMAL,GAMMAR,AMHL,AMHH,AMHA,AMHC,ALFAH,AAT,THETAT
     $,AAB,THETAB,AAL,THETAL,AMGVSS,MTQ,MBQ,MLQ,FBMA,
     $VUQ,VDQ,SGNM3
      REAL AMGLSS,AMULSS,AMURSS,AMDLSS,AMDRSS,AMSLSS
     $,AMSRSS,AMCLSS,AMCRSS,AMBLSS,AMBRSS,AMB1SS,AMB2SS
     $,AMTLSS,AMTRSS,AMT1SS,AMT2SS,AMELSS,AMERSS,AMMLSS,AMMRSS
     $,AMLLSS,AMLRSS,AML1SS,AML2SS,AMN1SS,AMN2SS,AMN3SS
     $,TWOM1,RV2V1,AMZ1SS,AMZ2SS,AMZ3SS,AMZ4SS,ZMIXSS
     $,AMW1SS,AMW2SS
     $,GAMMAL,GAMMAR,AMHL,AMHH,AMHA,AMHC,ALFAH,AAT,THETAT
     $,AAB,THETAB,AAL,THETAL,AMGVSS,MTQ,MBQ,MLQ,FBMA,VUQ,VDQ,SGNM3
      LOGICAL GORGE
      REAL AMZISS(4)
      EQUIVALENCE (AMZISS(1),AMZ1SS)
      SAVE /SSPAR/
C          SM ident code definitions. These are standard ISAJET but
C          can be changed.
      INTEGER IDUP,IDDN,IDST,IDCH,IDBT,IDTP
      INTEGER IDNE,IDE,IDNM,IDMU,IDNT,IDTAU
      INTEGER IDGL,IDGM,IDW,IDZ,IDH
      PARAMETER (IDUP=1,IDDN=2,IDST=3,IDCH=4,IDBT=5,IDTP=6)
      PARAMETER (IDNE=11,IDE=12,IDNM=13,IDMU=14,IDNT=15,IDTAU=16)
      PARAMETER (IDGL=9,IDGM=10,IDW=80,IDZ=90,IDH=81)
C          SUSY ident code definitions. They are chosen to be similar
C          to those in versions < 6.50 but may be changed.
      INTEGER ISUPL,ISDNL,ISSTL,ISCHL,ISBT1,ISTP1
      INTEGER ISNEL,ISEL,ISNML,ISMUL,ISNTL,ISTAU1
      INTEGER ISUPR,ISDNR,ISSTR,ISCHR,ISBT2,ISTP2
      INTEGER ISNER,ISER,ISNMR,ISMUR,ISNTR,ISTAU2
      INTEGER ISZ1,ISZ2,ISZ3,ISZ4,ISW1,ISW2,ISGL
      INTEGER ISHL,ISHH,ISHA,ISHC
      INTEGER ISGRAV
      INTEGER IDTAUL,IDTAUR
      PARAMETER (ISUPL=21,ISDNL=22,ISSTL=23,ISCHL=24,ISBT1=25,ISTP1=26)
      PARAMETER (ISNEL=31,ISEL=32,ISNML=33,ISMUL=34,ISNTL=35,ISTAU1=36)
      PARAMETER (ISUPR=41,ISDNR=42,ISSTR=43,ISCHR=44,ISBT2=45,ISTP2=46)
      PARAMETER (ISNER=51,ISER=52,ISNMR=53,ISMUR=54,ISNTR=55,ISTAU2=56)
      PARAMETER (ISGL=29)
      PARAMETER (ISZ1=30,ISZ2=40,ISZ3=50,ISZ4=60,ISW1=39,ISW2=49)
      PARAMETER (ISHL=82,ISHH=83,ISHA=84,ISHC=86)
      PARAMETER (ISGRAV=91)
      PARAMETER (IDTAUL=10016,IDTAUR=20016)
C          Temporary parameters for functions
      COMMON/SSTMP/TMP(10),ITMP(10)
      REAL TMP
      INTEGER ITMP
      SAVE /SSTMP/
C
      EXTERNAL SSLRT1,SSL1ST,SSN1ST,SSSNWS
      REAL SSXLAM,SSXINT,SSLRT1,SSN1ST,SSL1ST,SSSNWS
      REAL WID,SNZI,THIZ,XM,YM,THX,THY,BPLWI(2),CS2THW
      REAL VS,PI,SR2,G,GP,VP,V,TANB,ANWI(2),ALWI(2)
      REAL ANIZ,AEIZ,BEIZ,MZIZ,SINL,COSL,BETA,FL,AMPL
      REAL MW1,MW2,TN2THW,SNW1,SNW2,AS,BS,BH,COSA,SINA,A
      REAL XLO,SUM1,SUM2,AEJZ,TERM,WID1,WID2,SINB,COSB,COS2B,ANJZ,EMAX
      REAL MEME,MEMB,MEMZ,MMMM,MMUMB,MMUMZ,TANTHE,TANTHM,THETAE,THETAM
      REAL AAE,FE,AAM,FM,AME1,AML1,APE1,APL1,TM1,TM2,TM3,AMM1,APM1
      REAL BME1,BPE1,SUALFE,MTAMZ
      INTEGER IZ,JZ
      INTEGER ISZIZ(4)
      COMPLEX ZI,ZONE,ZA,ZB,ZALIZ,ZBLIZ,ZPP,ZPM
      DATA ZONE/(1.,0.)/,ZI/(0.,1.)/
C
C          Partly duplicated from SSMASS
C
      AMPL=2.4E18
      PI=4.*ATAN(1.)
      SR2=SQRT(2.)
      G=SQRT(4*PI*ALFAEM/SN2THW)
      GP=G*SQRT(SN2THW/(1.-SN2THW))
      CS2THW=1.-SN2THW
      TN2THW=SN2THW/CS2THW
      VS=2*AMW**2/G/G/(1.+RV2V1**2)
      V=SQRT(VS)
      VP=RV2V1*V
      TANB=1./RV2V1
      BETA=ATAN(TANB)
      SINA=SIN(ALFAH)
      COSA=COS(ALFAH)
      SINB=SIN(BETA)
      COSB=COS(BETA)
      COS2B=COS(2*BETA)
      XM=1./TAN(GAMMAL)
      YM=1./TAN(GAMMAR)
      THX=SIGN(1.,XM)
      THY=SIGN(1.,YM)
      MEME=AME*(1.-SUALFE(AME**2)/PI)
      MEMB=MEME*(SUALFE(AMBT**2)/SUALFE(AME**2))**(-27./76.)
      MEMZ=MEMB*(SUALFE(AMZ**2)/SUALFE(AMBT**2))**(-27./80.)
      FE=G*MEMZ/SR2/AMW/COS(BETA)
C     SINCE A_e not defined in ISAJET, use A_tau as approximation
      AAE=AAL
      TANTHE=(AMERSS**2-MEMZ**2+AMZ**2*COS2B*(.5-SN2THW)-
     $AMELSS**2)/MEMZ/(TWOM1*SINB/COSB+AAE)
      THETAE=ATAN(TANTHE)
      MMMM=AMMU*(1.-SUALFE(AMMU**2)/PI)
      MMUMB=MMMM*(SUALFE(AMBT**2)/SUALFE(AMMU**2))**(-27./76.)
      MMUMZ=MMUMB*(SUALFE(AMZ**2)/SUALFE(AMBT**2))**(-27./80.)
      FM=G*MMUMZ/SR2/AMW/COS(BETA)
      AAM=AAL
      TANTHM=(AMMRSS**2-MMUMZ**2+AMZ**2*COS2B*(.5-SN2THW)-
     $AMMLSS**2)/MMUMZ/(TWOM1*SINB/COSB+AAM)
      THETAM=ATAN(TANTHM)
      MTAMZ=MLQ
      FL=G*MTAMZ/SR2/AMW/COS(BETA)
      SINL=SIN(THETAL)
      COSL=COS(THETAL)
      SNW1=SIGN(1.,AMW1SS)
      SNW2=SIGN(1.,AMW2SS)
      BPLWI(1)=-FL*COS(GAMMAL)
      BPLWI(2)=FL*THX*SIN(GAMMAL)
      ANWI(1)=G*SIN(GAMMAL)
      ALWI(1)=SNW1*G*SIN(GAMMAR)
      ANWI(2)=G*THX*COS(GAMMAL)
      ALWI(2)=SNW2*G*THY*COS(GAMMAR)
C          Reconstruct masses from SSMASS
      MW1=ABS(AMW1SS)
      MW2=ABS(AMW2SS)
C
C          Compute slepton branching fractions to zi
C
      ISZIZ(1)=ISZ1
      ISZIZ(2)=ISZ2
      ISZIZ(3)=ISZ3
      ISZIZ(4)=ISZ4
      DO 100 IZ=1,4
        SNZI=SIGN(1.,AMZISS(IZ))
        IF (SNZI.EQ.1.) THEN
           THIZ=0.
        ELSE
           THIZ=1.
        END IF
        MZIZ=ABS(AMZISS(IZ))
        ANIZ=G/SR2*ZMIXSS(3,IZ)-GP/SR2*ZMIXSS(4,IZ)
        AEIZ=G/SR2*ZMIXSS(3,IZ)+GP/SR2*ZMIXSS(4,IZ)
        BEIZ=SR2*GP*ZMIXSS(4,IZ)
        ZALIZ=ZI**(THIZ-1.)*SNZI
     $  *(G/SR2*ZMIXSS(3,IZ)+GP/SR2*ZMIXSS(4,IZ))
        ZBLIZ=-1*ZI**(THIZ-1.)*SR2*GP*ZMIXSS(4,IZ)
        ZPP=ZI**THIZ
        ZPM=(-ZI)**THIZ
C          sLEPTON --> LEPTON + zi
        IF (AMELSS.GT.(MZIZ+AME)) THEN
          WID=AEIZ**2*(AMELSS**2-MZIZ**2-AME**2)/AMELSS**3
     $        /16./PI*SQRT(SSXLAM(AMELSS**2,MZIZ**2,AME**2))
          CALL SSSAVE(ISEL,WID,ISZIZ(IZ),IDE,0,0,0)
        ENDIF
        IF (AMMLSS.GT.(MZIZ+AMMU)) THEN
          WID=AEIZ**2*(AMMLSS**2-MZIZ**2-AMMU**2)/AMMLSS**3
     $        /16./PI*SQRT(SSXLAM(AMMLSS**2,MZIZ**2,AMMU**2))
          CALL SSSAVE(ISMUL,WID,ISZIZ(IZ),IDMU,0,0,0)
        ENDIF
        IF (AMN1SS.GT.MZIZ) THEN
          WID=ANIZ**2*AMN1SS*(1.-MZIZ**2/AMN1SS**2)**2/16./PI
          CALL SSSAVE(ISNEL,WID,ISZIZ(IZ),IDNE,0,0,0)
        ENDIF
        IF (AMN2SS.GT.MZIZ) THEN
          WID=ANIZ**2*AMN2SS*(1.-MZIZ**2/AMN2SS**2)**2/16./PI
          CALL SSSAVE(ISNML,WID,ISZIZ(IZ),IDNM,0,0,0)
        ENDIF
        IF (AMN3SS.GT.MZIZ) THEN
          WID=ANIZ**2*AMN3SS*(1.-MZIZ**2/AMN3SS**2)**2/16./PI
          CALL SSSAVE(ISNTL,WID,ISZIZ(IZ),IDNT,0,0,0)
        ENDIF
        IF (AMERSS.GT.(MZIZ+AME)) THEN
          WID=BEIZ**2*(AMERSS**2-MZIZ**2-AME**2)/AMERSS**3
     $        /16./PI*SQRT(SSXLAM(AMERSS**2,MZIZ**2,AME**2))
          CALL SSSAVE(ISER,WID,ISZIZ(IZ),IDE,0,0,0)
        ENDIF
        IF (AMMRSS.GT.(MZIZ+AMMU)) THEN
          WID=BEIZ**2*(AMMRSS**2-MZIZ**2-AMMU**2)/AMMRSS**3
     $        /16./PI*SQRT(SSXLAM(AMMRSS**2,MZIZ**2,AMMU**2))
          CALL SSSAVE(ISMUR,WID,ISZIZ(IZ),IDMU,0,0,0)
        ENDIF
C          sTAU_1 --> TAU + zi
        IF (AML1SS.GT.(MZIZ+AMTAU)) THEN
          ZA=((ZI*ZALIZ-ZPP*FL*ZMIXSS(2,IZ))*COSL
     $     -(ZI*ZBLIZ-ZPM*FL*ZMIXSS(2,IZ))*SINL)/2.
          ZB=((-ZI*ZALIZ-ZPP*FL*ZMIXSS(2,IZ))*COSL
     $     -(ZI*ZBLIZ+ZPM*FL*ZMIXSS(2,IZ))*SINL)/2.
          AS=ZA*CONJG(ZA)
          BS=ZB*CONJG(ZB)
          WID=(AS*(AML1SS**2-(AMTAU+MZIZ)**2)+BS*(AML1SS**2-
     $     (MZIZ-AMTAU)**2))/8./PI/AML1SS**3*
     $     SQRT(SSXLAM(AML1SS**2,MZIZ**2,AMTAU**2))
          CALL SSSAVE(ISTAU1,WID,ISZIZ(IZ),IDTAU,0,0,0)
        END IF
        IF (AML2SS.GT.(MZIZ+AMTAU)) THEN
          ZA=((ZI*ZALIZ-ZPP*FL*ZMIXSS(2,IZ))*SINL
     $     +(ZI*ZBLIZ-ZPM*FL*ZMIXSS(2,IZ))*COSL)/2.
          ZB=((-ZI*ZALIZ-ZPP*FL*ZMIXSS(2,IZ))*SINL
     $     +(ZI*ZBLIZ+ZPM*FL*ZMIXSS(2,IZ))*COSL)/2.
          AS=ZA*CONJG(ZA)
          BS=ZB*CONJG(ZB)
          WID=(AS*(AML2SS**2-(AMTAU+MZIZ)**2)+BS*(AML2SS**2-
     $     (MZIZ-AMTAU)**2))/8./PI/AML2SS**3*
     $     SQRT(SSXLAM(AML2SS**2,MZIZ**2,AMTAU**2))
          CALL SSSAVE(ISTAU2,WID,ISZIZ(IZ),IDTAU,0,0,0)
        END IF
100   CONTINUE
C
C           Compute branching fractions to wi --- theta-C = 0
C
      IF (AMELSS.GT.MW1) THEN
        WID=ANWI(1)**2*AMELSS*(1.-MW1**2/AMELSS**2)**2/16./PI
        CALL SSSAVE(ISEL,WID,-ISW1,IDNE,0,0,0)
      END IF
      IF (AMMLSS.GT.MW1) THEN
        WID=ANWI(1)**2*AMMLSS*(1.-MW1**2/AMMLSS**2)**2/16./PI
        CALL SSSAVE(ISMUL,WID,-ISW1,IDNM,0,0,0)
      END IF
      IF (AML1SS.GT.MW1) THEN
        AS=(-ANWI(1)*COSL-BPLWI(1)*SINL)**2
        WID=AS*AML1SS*(1.-MW1**2/AML1SS**2)**2/16./PI
        CALL SSSAVE(ISTAU1,WID,-ISW1,IDNT,0,0,0)
      END IF
      IF (AML2SS.GT.MW1) THEN
        AS=(-ANWI(1)*SINL+BPLWI(1)*COSL)**2
        WID=AS*AML2SS*(1.-MW1**2/AML2SS**2)**2/16./PI
        CALL SSSAVE(ISTAU2,WID,-ISW1,IDNT,0,0,0)
      END IF
C
      IF (AMN1SS.GT.(MW1+AME)) THEN
        WID=ALWI(1)**2*(AMN1SS**2-MW1**2-AME**2)*
     $      SQRT(SSXLAM(AMN1SS**2,MW1**2,AME**2))/16./PI/AMN1SS**3
        CALL SSSAVE(ISNEL,WID,ISW1,IDE,0,0,0)
      END IF
      IF (AMN2SS.GT.(MW1+AMMU)) THEN
        WID=ALWI(1)**2*(AMN2SS**2-MW1**2-AMMU**2)*
     $      SQRT(SSXLAM(AMN2SS**2,MW1**2,AMMU**2))/16./PI/AMN2SS**3
        CALL SSSAVE(ISNML,WID,ISW1,IDMU,0,0,0)
      END IF
C
      IF (AMN3SS.GT.(MW1+AMTAU)) THEN
        WID=((ALWI(1)**2+BPLWI(1)**2)*(AMN3SS**2-MW1**2-AMTAU**2)+
     $     4*MW1*AMTAU*BPLWI(1)*ALWI(1))*
     $     SQRT(SSXLAM(AMN3SS**2,MW1**2,AMTAU**2))/16./PI/AMN3SS**3
        CALL SSSAVE(ISNTL,WID,ISW1,IDTAU,0,0,0)
      END IF
C
C
      IF (AMELSS.GT.MW2) THEN
        WID=ANWI(2)**2*AMELSS*(1.-MW2**2/AMELSS**2)**2/16./PI
        CALL SSSAVE(ISEL,WID,-ISW2,IDNE,0,0,0)
      END IF
      IF (AMMLSS.GT.MW2) THEN
        WID=ANWI(2)**2*AMMLSS*(1.-MW2**2/AMMLSS**2)**2/16./PI
        CALL SSSAVE(ISMUL,WID,-ISW2,IDNM,0,0,0)
      END IF
      IF (AML1SS.GT.MW2) THEN
        AS=(-ANWI(2)*COSL-BPLWI(2)*SINL)**2
        WID=AS*AML1SS*(1.-MW2**2/AML1SS**2)**2/16./PI
        CALL SSSAVE(ISTAU1,WID,-ISW2,IDNT,0,0,0)
      END IF
      IF (AML2SS.GT.MW2) THEN
        AS=(-ANWI(2)*SINL+BPLWI(2)*COSL)**2
        WID=AS*AML2SS*(1.-MW2**2/AML2SS**2)**2/16./PI
        CALL SSSAVE(ISTAU2,WID,-ISW2,IDNT,0,0,0)
      END IF
C
      IF (AMN1SS.GT.(MW2+AME)) THEN
        WID=ALWI(2)**2*(AMN1SS**2-MW2**2-AME**2)*
     $      SQRT(SSXLAM(AMN1SS**2,MW2**2,AME**2))/16./PI/AMN1SS**3
        CALL SSSAVE(ISNEL,WID,ISW2,IDE,0,0,0)
      END IF
      IF (AMN2SS.GT.(MW2+AMMU)) THEN
        WID=ALWI(2)**2*(AMN2SS**2-MW2**2-AMMU**2)*
     $      SQRT(SSXLAM(AMN2SS**2,MW2**2,AMMU**2))/16./PI/AMN2SS**3
        CALL SSSAVE(ISNML,WID,ISW2,IDMU,0,0,0)
      END IF
C
      IF (AMN3SS.GT.(MW2+AMTAU)) THEN
        WID=((ALWI(2)**2+BPLWI(2)**2)*(AMN3SS**2-MW2**2-AMTAU**2)+
     $     4*MW2*AMTAU*BPLWI(2)*ALWI(2))*
     $     SQRT(SSXLAM(AMN3SS**2,MW2**2,AMTAU**2))/16./PI/AMN3SS**3
        CALL SSSAVE(ISNTL,WID,ISW2,IDTAU,0,0,0)
      END IF
C
C      DECAYS TO VECTOR BOSONS
C
      IF (AMELSS.GT.(AMN1SS+AMW)) THEN
        WID=G*G*(SSXLAM(AMELSS**2,AMN1SS**2,AMW**2))**1.5/
     $      32./PI/AMELSS**3/AMW**2
        CALL SSSAVE(ISEL,WID,-IDW,ISNEL,0,0,0)
      END IF
C
      IF (AMMLSS.GT.(AMN2SS+AMW)) THEN
        WID=G*G*(SSXLAM(AMMLSS**2,AMN2SS**2,AMW**2))**1.5/
     $      32./PI/AMMLSS**3/AMW**2
        CALL SSSAVE(ISMUL,WID,-IDW,ISNML,0,0,0)
      END IF
C
      IF (AML1SS.GT.(AMN3SS+AMW)) THEN
        WID=G*G*(SSXLAM(AML1SS**2,AMN3SS**2,AMW**2))**1.5/
     $      32./PI/AML1SS**3/AMW**2*COSL**2
        CALL SSSAVE(ISTAU1,WID,-IDW,ISNTL,0,0,0)
      END IF
C
      IF (AML2SS.GT.(AMN3SS+AMW)) THEN
        WID=G*G*(SSXLAM(AML2SS**2,AMN3SS**2,AMW**2))**1.5/
     $      32./PI/AML2SS**3/AMW**2*SINL**2
        CALL SSSAVE(ISTAU2,WID,-IDW,ISNTL,0,0,0)
      END IF
C
      IF (AMN1SS.GT.(AMELSS+AMW)) THEN
        WID=G*G*(SSXLAM(AMN1SS**2,AMELSS**2,AMW**2))**1.5/
     $      32./PI/AMN1SS**3/AMW**2
        CALL SSSAVE(ISNEL,WID,IDW,ISEL,0,0,0)
      END IF
C
      IF (AMN2SS.GT.(AMMLSS+AMW)) THEN
        WID=G*G*(SSXLAM(AMN2SS**2,AMMLSS**2,AMW**2))**1.5/
     $      32./PI/AMN2SS**3/AMW**2
        CALL SSSAVE(ISNML,WID,IDW,ISMUL,0,0,0)
      END IF
C
      IF (AMN3SS.GT.(AML1SS+AMW)) THEN
        WID=G*G*(SSXLAM(AMN3SS**2,AML1SS**2,AMW**2))**1.5/
     $      32./PI/AMN3SS**3/AMW**2*COSL**2
        CALL SSSAVE(ISNTL,WID,IDW,ISTAU1,0,0,0)
      END IF
C
      IF (AMN3SS.GT.(AML2SS+AMW)) THEN
        WID=G*G*(SSXLAM(AMN3SS**2,AML2SS**2,AMW**2))**1.5/
     $      32./PI/AMN3SS**3/AMW**2*SINL**2
        CALL SSSAVE(ISNTL,WID,IDW,ISTAU2,0,0,0)
      END IF
C
      IF (AML2SS.GT.(AML1SS+AMZ)) THEN
        WID=G*G*(SSXLAM(AML2SS**2,AML1SS**2,AMZ**2))**1.5/
     $      64./PI/AML2SS**3/CS2THW/AMZ**2*SINL**2*COSL**2
        CALL SSSAVE(ISTAU2,WID,IDZ,ISTAU1,0,0,0)
      END IF
C
C     3-body decay of l_R -> l+tau+stau_1
C
      XLO=(AML1SS+AMTAU)**2
      SUM1=0.
      SUM2=0.
      IF (AMERSS.GT.(AML1SS+AMTAU+AME)) THEN
        DO IZ=1,4
          DO JZ=IZ,4
            TMP(1)=AMERSS
            TMP(2)=-SR2*GP*ZMIXSS(4,IZ)
            TMP(3)=-SR2*GP*ZMIXSS(4,JZ)
            AEIZ=-(G*ZMIXSS(3,IZ)+GP*ZMIXSS(4,IZ))/SR2
            AEJZ=-(G*ZMIXSS(3,JZ)+GP*ZMIXSS(4,JZ))/SR2
            TMP(4)=AEIZ*COSL-FL*ZMIXSS(2,IZ)*SINL
            TMP(5)=AEJZ*COSL-FL*ZMIXSS(2,JZ)*SINL
            TMP(6)=TMP(2)*SINL+FL*ZMIXSS(2,IZ)*COSL
            TMP(7)=TMP(3)*SINL+FL*ZMIXSS(2,JZ)*COSL
            TMP(8)=AMZISS(IZ)
            TMP(9)=AMZISS(JZ)
            IF (AMERSS.LT.ABS(AMZISS(IZ)).AND.
     ,          AMERSS.LT.ABS(AMZISS(JZ))) THEN
              TERM=2*PI**2*SSXINT(XLO,SSLRT1,AMERSS**2)/AMERSS
            ELSE
              TERM=0.
            END IF
            IF (IZ.EQ.JZ) TERM=TERM/2.
            SUM1=SUM1+TERM
            TMP(4)=TMP(6)
            TMP(5)=TMP(7)
            TMP(6)=AEIZ*COSL-FL*ZMIXSS(2,IZ)*SINL
            TMP(7)=AEJZ*COSL-FL*ZMIXSS(2,JZ)*SINL
            IF (AMERSS.LT.ABS(AMZISS(IZ)).AND.
     ,          AMERSS.LT.ABS(AMZISS(JZ))) THEN
              TERM=2*PI**2*SSXINT(XLO,SSLRT1,AMERSS**2)/AMERSS
            ELSE
              TERM=0.
            END IF
            IF (IZ.EQ.JZ) TERM=TERM/2.
            SUM2=SUM2+TERM
          END DO
        END DO
        WID1=SUM1/2./AMERSS/(2*PI)**5
        WID2=SUM2/2./AMERSS/(2*PI)**5
        CALL SSSAVE(ISER,WID1,ISTAU1,IDE,-IDTAU,0,0)
        CALL SSSAVE(ISER,WID2,-ISTAU1,IDE,IDTAU,0,0)
      END IF
      SUM1=0.
      SUM2=0.
      IF (AMMRSS.GT.(AML1SS+AMTAU+AMMU)) THEN
        DO IZ=1,4
          DO JZ=IZ,4
            TMP(1)=AMMRSS
            TMP(2)=-SR2*GP*ZMIXSS(4,IZ)
            TMP(3)=-SR2*GP*ZMIXSS(4,JZ)
            AEIZ=-(G*ZMIXSS(3,IZ)+GP*ZMIXSS(4,IZ))/SR2
            AEJZ=-(G*ZMIXSS(3,JZ)+GP*ZMIXSS(4,JZ))/SR2
            TMP(4)=AEIZ*COSL-FL*ZMIXSS(2,IZ)*SINL
            TMP(5)=AEJZ*COSL-FL*ZMIXSS(2,JZ)*SINL
            TMP(6)=TMP(2)*SINL+FL*ZMIXSS(2,IZ)*COSL
            TMP(7)=TMP(3)*SINL+FL*ZMIXSS(2,JZ)*COSL
            TMP(8)=AMZISS(IZ)
            TMP(9)=AMZISS(JZ)
            IF (AMMRSS.LT.ABS(AMZISS(IZ)).AND.
     ,          AMMRSS.LT.ABS(AMZISS(JZ))) THEN
              TERM=2*PI**2*SSXINT(XLO,SSLRT1,AMMRSS**2)/AMMRSS
            ELSE
              TERM=0.
            END IF
            IF (IZ.EQ.JZ) TERM=TERM/2.
            SUM1=SUM1+TERM
            TMP(4)=TMP(6)
            TMP(5)=TMP(7)
            TMP(6)=AEIZ*COSL-FL*ZMIXSS(2,IZ)*SINL
            TMP(7)=AEJZ*COSL-FL*ZMIXSS(2,JZ)*SINL
            IF (AMMRSS.LT.ABS(AMZISS(IZ)).AND.
     ,          AMMRSS.LT.ABS(AMZISS(JZ))) THEN
              TERM=2*PI**2*SSXINT(XLO,SSLRT1,AMMRSS**2)/AMMRSS
            ELSE
              TERM=0.
            END IF
            IF (IZ.EQ.JZ) TERM=TERM/2.
            SUM2=SUM2+TERM
          END DO
        END DO
        WID1=SUM1/2./AMMRSS/(2*PI)**5
        WID2=SUM2/2./AMMRSS/(2*PI)**5
        CALL SSSAVE(ISMUR,WID1,ISTAU1,IDMU,-IDTAU,0,0)
        CALL SSSAVE(ISMUR,WID2,-ISTAU1,IDMU,IDTAU,0,0)
      END IF
C
C     3-body decay of l_L -> l+tau+stau_1
C
      SUM1=0.
      SUM2=0.
      IF (AMELSS.GT.(AML1SS+AMTAU+AME)) THEN
        DO IZ=1,4
          DO JZ=IZ,4
            TMP(1)=AMELSS
            AEIZ=-(G*ZMIXSS(3,IZ)+GP*ZMIXSS(4,IZ))/SR2
            AEJZ=-(G*ZMIXSS(3,JZ)+GP*ZMIXSS(4,JZ))/SR2
            TMP(2)=AEIZ
            TMP(3)=AEJZ
            TMP(6)=AEIZ*COSL-FL*ZMIXSS(2,IZ)*SINL
            TMP(7)=AEJZ*COSL-FL*ZMIXSS(2,JZ)*SINL
            TMP(4)=-SR2*GP*ZMIXSS(4,IZ)*SINL+FL*ZMIXSS(2,IZ)*COSL
            TMP(5)=-SR2*GP*ZMIXSS(4,JZ)*SINL+FL*ZMIXSS(2,JZ)*COSL
            TMP(8)=AMZISS(IZ)
            TMP(9)=AMZISS(JZ)
            IF (AMELSS.LT.ABS(AMZISS(IZ)).AND.
     ,          AMELSS.LT.ABS(AMZISS(JZ))) THEN
              TERM=2*PI**2*SSXINT(XLO,SSLRT1,AMELSS**2)/AMELSS
            ELSE
              TERM=0.
            END IF
            IF (IZ.EQ.JZ) TERM=TERM/2.
            SUM1=SUM1+TERM
            TMP(4)=TMP(6)
            TMP(5)=TMP(7)
            TMP(6)=-SR2*GP*ZMIXSS(4,IZ)*SINL+FL*ZMIXSS(2,IZ)*COSL
            TMP(7)=-SR2*GP*ZMIXSS(4,JZ)*SINL+FL*ZMIXSS(2,JZ)*COSL
            IF (AMELSS.LT.ABS(AMZISS(IZ)).AND.
     ,          AMELSS.LT.ABS(AMZISS(JZ))) THEN
              TERM=2*PI**2*SSXINT(XLO,SSLRT1,AMELSS**2)/AMELSS
            ELSE
              TERM=0.
            END IF
            IF (IZ.EQ.JZ) TERM=TERM/2.
            SUM2=SUM2+TERM
          END DO
        END DO
        WID1=SUM1/2./AMELSS/(2*PI)**5
        WID2=SUM2/2./AMELSS/(2*PI)**5
        CALL SSSAVE(ISEL,WID1,ISTAU1,IDE,-IDTAU,0,0)
        CALL SSSAVE(ISEL,WID2,-ISTAU1,IDE,IDTAU,0,0)
      END IF
      SUM1=0.
      SUM2=0.
      IF (AMMLSS.GT.(AML1SS+AMTAU+AMMU)) THEN
        DO IZ=1,4
          DO JZ=IZ,4
            TMP(1)=AMMLSS
            AEIZ=-(G*ZMIXSS(3,IZ)+GP*ZMIXSS(4,IZ))/SR2
            AEJZ=-(G*ZMIXSS(3,JZ)+GP*ZMIXSS(4,JZ))/SR2
            TMP(2)=AEIZ
            TMP(3)=AEJZ
            TMP(6)=AEIZ*COSL-FL*ZMIXSS(2,IZ)*SINL
            TMP(7)=AEJZ*COSL-FL*ZMIXSS(2,JZ)*SINL
            TMP(4)=-SR2*GP*ZMIXSS(4,IZ)*SINL+FL*ZMIXSS(2,IZ)*COSL
            TMP(5)=-SR2*GP*ZMIXSS(4,JZ)*SINL+FL*ZMIXSS(2,JZ)*COSL
            TMP(8)=AMZISS(IZ)
            TMP(9)=AMZISS(JZ)
            IF (AMMLSS.LT.ABS(AMZISS(IZ)).AND.
     ,          AMMLSS.LT.ABS(AMZISS(JZ))) THEN
              TERM=2*PI**2*SSXINT(XLO,SSLRT1,AMMLSS**2)/AMMLSS
            ELSE
              TERM=0.
            END IF
            IF (IZ.EQ.JZ) TERM=TERM/2.
            SUM1=SUM1+TERM
            TMP(4)=TMP(6)
            TMP(5)=TMP(7)
            TMP(6)=-SR2*GP*ZMIXSS(4,IZ)*SINL+FL*ZMIXSS(2,IZ)*COSL
            TMP(7)=-SR2*GP*ZMIXSS(4,JZ)*SINL+FL*ZMIXSS(2,JZ)*COSL
            IF (AMMLSS.LT.ABS(AMZISS(IZ)).AND.
     ,          AMMLSS.LT.ABS(AMZISS(JZ))) THEN
              TERM=2*PI**2*SSXINT(XLO,SSLRT1,AMMLSS**2)/AMMLSS
            ELSE
              TERM=0.
            END IF
            IF (IZ.EQ.JZ) TERM=TERM/2.
            SUM2=SUM2+TERM
          END DO
        END DO
        WID1=SUM1/2./AMMLSS/(2*PI)**5
        WID2=SUM2/2./AMMLSS/(2*PI)**5
        CALL SSSAVE(ISMUL,WID1,ISTAU1,IDMU,-IDTAU,0,0)
        CALL SSSAVE(ISMUL,WID2,-ISTAU1,IDMU,IDTAU,0,0)
      END IF
C
C     3-body decay of nu_eL -> nu_e+tau+stau_1
C
      SUM1=0.
      SUM2=0.
      IF (AMN1SS.GT.(AML1SS+AMTAU)) THEN
        DO IZ=1,4
          DO JZ=IZ,4
            TMP(1)=AMN1SS
            ANIZ=(G*ZMIXSS(3,IZ)-GP*ZMIXSS(4,IZ))/SR2
            ANJZ=(G*ZMIXSS(3,JZ)-GP*ZMIXSS(4,JZ))/SR2
            AEIZ=-(G*ZMIXSS(3,IZ)+GP*ZMIXSS(4,IZ))/SR2
            AEJZ=-(G*ZMIXSS(3,JZ)+GP*ZMIXSS(4,JZ))/SR2
            TMP(2)=ANIZ
            TMP(3)=ANJZ
            TMP(6)=AEIZ*COSL-FL*ZMIXSS(2,IZ)*SINL
            TMP(7)=AEJZ*COSL-FL*ZMIXSS(2,JZ)*SINL
            TMP(4)=-SR2*GP*ZMIXSS(4,IZ)*SINL+FL*ZMIXSS(2,IZ)*COSL
            TMP(5)=-SR2*GP*ZMIXSS(4,JZ)*SINL+FL*ZMIXSS(2,JZ)*COSL
            TMP(8)=AMZISS(IZ)
            TMP(9)=AMZISS(JZ)
            IF (AMN1SS.LT.ABS(AMZISS(IZ)).AND.
     ,          AMN1SS.LT.ABS(AMZISS(JZ))) THEN
              TERM=2*PI**2*SSXINT(XLO,SSLRT1,AMN1SS**2)/AMN1SS
            ELSE
              TERM=0.
            END IF
            IF (IZ.EQ.JZ) TERM=TERM/2.
            SUM1=SUM1+TERM
            TMP(4)=TMP(6)
            TMP(5)=TMP(7)
            TMP(6)=-SR2*GP*ZMIXSS(4,IZ)*SINL+FL*ZMIXSS(2,IZ)*COSL
            TMP(7)=-SR2*GP*ZMIXSS(4,JZ)*SINL+FL*ZMIXSS(2,JZ)*COSL
            IF (AMN1SS.LT.ABS(AMZISS(IZ)).AND.
     ,          AMN1SS.LT.ABS(AMZISS(JZ))) THEN
              TERM=2*PI**2*SSXINT(XLO,SSLRT1,AMN1SS**2)/AMN1SS
            ELSE
              TERM=0.
            END IF
            IF (IZ.EQ.JZ) TERM=TERM/2.
            SUM2=SUM2+TERM
          END DO
        END DO
        WID1=SUM1/2./AMN1SS/(2*PI)**5
        WID2=SUM2/2./AMN1SS/(2*PI)**5
        CALL SSSAVE(ISNEL,WID1,ISTAU1,IDNE,-IDTAU,0,0)
        CALL SSSAVE(ISNEL,WID2,-ISTAU1,IDNE,IDTAU,0,0)
      END IF
C
C     3-body decay of nu_muL -> nu_mu+tau+stau_1
C
      SUM1=0.
      SUM2=0.
      IF (AMN2SS.GT.(AML1SS+AMTAU)) THEN
        DO IZ=1,4
          DO JZ=IZ,4
            TMP(1)=AMN2SS
            ANIZ=(G*ZMIXSS(3,IZ)-GP*ZMIXSS(4,IZ))/SR2
            ANJZ=(G*ZMIXSS(3,JZ)-GP*ZMIXSS(4,JZ))/SR2
            AEIZ=-(G*ZMIXSS(3,IZ)+GP*ZMIXSS(4,IZ))/SR2
            AEJZ=-(G*ZMIXSS(3,JZ)+GP*ZMIXSS(4,JZ))/SR2
            TMP(2)=ANIZ
            TMP(3)=ANJZ
            TMP(6)=AEIZ*COSL-FL*ZMIXSS(2,IZ)*SINL
            TMP(7)=AEJZ*COSL-FL*ZMIXSS(2,JZ)*SINL
            TMP(4)=-SR2*GP*ZMIXSS(4,IZ)*SINL+FL*ZMIXSS(2,IZ)*COSL
            TMP(5)=-SR2*GP*ZMIXSS(4,JZ)*SINL+FL*ZMIXSS(2,JZ)*COSL
            TMP(8)=AMZISS(IZ)
            TMP(9)=AMZISS(JZ)
            IF (AMN2SS.LT.ABS(AMZISS(IZ)).AND.
     ,          AMN2SS.LT.ABS(AMZISS(JZ))) THEN
              TERM=2*PI**2*SSXINT(XLO,SSLRT1,AMN2SS**2)/AMN2SS
            ELSE
              TERM=0.
            END IF
            IF (IZ.EQ.JZ) TERM=TERM/2.
            SUM1=SUM1+TERM
            TMP(4)=TMP(6)
            TMP(5)=TMP(7)
            TMP(6)=-SR2*GP*ZMIXSS(4,IZ)*SINL+FL*ZMIXSS(2,IZ)*COSL
            TMP(7)=-SR2*GP*ZMIXSS(4,JZ)*SINL+FL*ZMIXSS(2,JZ)*COSL
            IF (AMN2SS.LT.ABS(AMZISS(IZ)).AND.
     ,          AMN2SS.LT.ABS(AMZISS(JZ))) THEN
              TERM=2*PI**2*SSXINT(XLO,SSLRT1,AMN2SS**2)/AMN2SS
            ELSE
              TERM=0.
            END IF
            IF (IZ.EQ.JZ) TERM=TERM/2.
            SUM2=SUM2+TERM
          END DO
        END DO
        WID1=SUM1/2./AMN2SS/(2*PI)**5
        WID2=SUM2/2./AMN2SS/(2*PI)**5
        CALL SSSAVE(ISNML,WID1,ISTAU1,IDNM,-IDTAU,0,0)
        CALL SSSAVE(ISNML,WID2,-ISTAU1,IDNM,IDTAU,0,0)
      END IF
C
C     3-body decay of nu_tauL -> nu_tau+tau+stau_1
C     Here, we include decay via Z_i, W_i and W*, but neglect
C     some interference terms (Z_i-W* and W_i-W* and Z_i-W_i)
C     until a future date. HB 8/24/98
C
      AME1=-G*SIN(GAMMAL)*COS(THETAE)+FE*COS(GAMMAL)*SIN(THETAE)
      AML1=-G*SIN(GAMMAL)*COS(THETAL)+FL*COS(GAMMAL)*SIN(THETAL)
      APE1=-G*THX*COS(GAMMAL)*COS(THETAE)-FE*THX*SIN(GAMMAL)*
     $       SIN(THETAE)
      APL1=-G*THX*COS(GAMMAL)*COS(THETAL)-FL*THX*SIN(GAMMAL)*
     $       SIN(THETAL)
      SUM1=0.
      SUM2=0.
      IF (AMN3SS.GT.(AML1SS+AMTAU)) THEN
        DO IZ=1,4
          DO JZ=IZ,4
            TMP(1)=AMN3SS
            ANIZ=(G*ZMIXSS(3,IZ)-GP*ZMIXSS(4,IZ))/SR2
            ANJZ=(G*ZMIXSS(3,JZ)-GP*ZMIXSS(4,JZ))/SR2
            AEIZ=-(G*ZMIXSS(3,IZ)+GP*ZMIXSS(4,IZ))/SR2
            AEJZ=-(G*ZMIXSS(3,JZ)+GP*ZMIXSS(4,JZ))/SR2
            TMP(2)=ANIZ
            TMP(3)=ANJZ
            TMP(6)=AEIZ*COSL-FL*ZMIXSS(2,IZ)*SINL
            TMP(7)=AEJZ*COSL-FL*ZMIXSS(2,JZ)*SINL
            TMP(4)=-SR2*GP*ZMIXSS(4,IZ)*SINL+FL*ZMIXSS(2,IZ)*COSL
            TMP(5)=-SR2*GP*ZMIXSS(4,JZ)*SINL+FL*ZMIXSS(2,JZ)*COSL
            TMP(8)=AMZISS(IZ)
            TMP(9)=AMZISS(JZ)
            IF (AMN3SS.LT.ABS(AMZISS(IZ)).AND.
     ,          AMN3SS.LT.ABS(AMZISS(JZ))) THEN
              TERM=2*PI**2*SSXINT(XLO,SSLRT1,AMN3SS**2)/AMN3SS
            ELSE
              TERM=0.
            END IF
            IF (IZ.EQ.JZ) TERM=TERM/2.
            SUM1=SUM1+TERM
            TMP(4)=TMP(6)
            TMP(5)=TMP(7)
            TMP(6)=-SR2*GP*ZMIXSS(4,IZ)*SINL+FL*ZMIXSS(2,IZ)*COSL
            TMP(7)=-SR2*GP*ZMIXSS(4,JZ)*SINL+FL*ZMIXSS(2,JZ)*COSL
            IF (AMN3SS.LT.ABS(AMZISS(IZ)).AND.
     ,          AMN3SS.LT.ABS(AMZISS(JZ))) THEN
              TERM=2*PI**2*SSXINT(XLO,SSLRT1,AMN3SS**2)/AMN3SS
            ELSE
              TERM=0.
            END IF
            IF (IZ.EQ.JZ) TERM=TERM/2.
            SUM2=SUM2+TERM
          END DO
        END DO
        WID1=SUM1/2./AMN3SS/(2*PI)**5
        WID2=SUM2/2./AMN3SS/(2*PI)**5
C-----COMPUTE SNU_TAU --> TAU +STAU_1BAR +NU_TAU via W_i DECAYS --------------
        BME1=-FL*COS(GAMMAL)
        BPE1=FL*THX*SIN(GAMMAL)
        TMP(1)=MW1
        TMP(2)=MW1
        TMP(3)=AML1SS
        TMP(4)=AMN3SS
        IF (AMN3SS.LT.MW1) THEN
        TM1=AML1**2*(AME1**2*MW1**2*SSXINT(AML1SS**2,SSN1ST,AMN3SS**2)
     $+BME1**2*SSXINT(AML1SS**2,SSL1ST,AMN3SS**2))
        TMP(2)=MW2
        TM2=2*AML1*APL1*(SNW1*SNW2*AME1*APE1*
     $ SSXINT(AML1SS**2,SSN1ST,AMN3SS**2)+BME1*BPE1*
     $ SSXINT(AML1SS**2,SSL1ST,AMN3SS**2))
        ELSE
        TM1=0.
        TM2=0.
        END IF
        TMP(1)=MW2
        TMP(2)=MW2
        IF (AMN3SS.LT.MW2) THEN
        TM3=APL1**2*(APE1**2*MW2**2*SSXINT(AML1SS**2,SSN1ST,AMN3SS**2)
     $+BPE1**2*SSXINT(AML1SS**2,SSL1ST,AMN3SS**2))
        ELSE
        TM3=0.
        END IF
        WID=PI**2*(TM1+TM2+TM3)/8./2./AMN3SS/(2.*PI)**5
        CALL SSSAVE(ISNTL,WID1+WID,-ISTAU1,IDNT,IDTAU,0,0)
C-----COMPUTE SNU_TAU --> TAUBAR +STAU_1 +NU_TAU via W* DECAYS --
        EMAX=(AML1SS**2+AMN3SS**2)/2./AMN3SS
        TMP(1)=AMW
        TMP(2)=AMW
        TMP(3)=AML1SS
        TMP(4)=AMN3SS
        IF (AMN3SS.LT.(AMW+AML1SS)) THEN
        TM1=G**4*COS(THETAL)**2*SSXINT(AML1SS,SSSNWS,EMAX)
        ELSE
        TM1=0.
        END IF
        WID=2*PI**2*TM1/3./2./AMN3SS/(2.*PI)**5
        CALL SSSAVE(ISNTL,WID2+WID,ISTAU1,IDNT,-IDTAU,0,0)
      END IF
C-----Now impose all sneutrino 3 body decays via W* ------------
        TMP(1)=AMW
        TMP(2)=AMW
        TMP(3)=AML1SS
        TMP(4)=AMN3SS
        EMAX=(AML1SS**2+AMN3SS**2)/2./AMN3SS
      IF (AMN3SS.GT.(AML1SS+AME).AND.AMN3SS.LT.(AMW+AML1SS)) THEN
        TM1=G**4*COS(THETAL)**2*SSXINT(AML1SS,SSSNWS,EMAX)
        WID=2*PI**2*TM1/3./2./AMN3SS/(2.*PI)**5
        CALL SSSAVE(ISNTL,WID,ISTAU1,IDNE,-IDE,0,0)
      END IF
      IF (AMN3SS.GT.(AML1SS+AMMU).AND.AMN3SS.LT.(AMW+AML1SS)) THEN
        TM1=G**4*COS(THETAL)**2*SSXINT(AML1SS,SSSNWS,EMAX)
        WID=2*PI**2*TM1/3./2./AMN3SS/(2.*PI)**5
        CALL SSSAVE(ISNTL,WID,ISTAU1,IDNM,-IDMU,0,0)
      END IF
      IF (AMN3SS.GT.(AML1SS+AMUP+AMDN).AND.AMN3SS.LT.(AMW+AML1SS)) THEN
        TM1=G**4*COS(THETAL)**2*SSXINT(AML1SS,SSSNWS,EMAX)
        WID=2*PI**2*TM1/3./2./AMN3SS/(2.*PI)**5
        CALL SSSAVE(ISNTL,3*WID,ISTAU1,IDUP,-IDDN,0,0)
      END IF
      IF (AMN3SS.GT.(AML1SS+AMCH+AMST).AND.AMN3SS.LT.(AMW+AML1SS)) THEN
        TM1=G**4*COS(THETAL)**2*SSXINT(AML1SS,SSSNWS,EMAX)
        WID=2*PI**2*TM1/3./2./AMN3SS/(2.*PI)**5
        CALL SSSAVE(ISNTL,3*WID,ISTAU1,IDCH,-IDST,0,0)
      END IF
      TMP(4)=AMN2SS
      EMAX=(AMMLSS**2+AMN2SS**2)/2./AMN2SS
      IF (AMN2SS.GT.(AMMLSS+AME).AND.AMN2SS.LT.(AMW+AML1SS)) THEN
        TM1=G**4*COS(THETAL)**2*SSXINT(AMMLSS,SSSNWS,EMAX)
        WID=2*PI**2*TM1/3./2./AMN2SS/(2.*PI)**5
        CALL SSSAVE(ISNML,WID,ISMUL,IDNE,-IDE,0,0)
      END IF
      IF (AMN2SS.GT.(AMMLSS+AMMU).AND.AMN2SS.LT.(AMW+AML1SS)) THEN
        TM1=G**4*COS(THETAL)**2*SSXINT(AMMLSS,SSSNWS,EMAX)
        WID=2*PI**2*TM1/3./2./AMN2SS/(2.*PI)**5
        CALL SSSAVE(ISNML,WID,ISMUL,IDNM,-IDMU,0,0)
      END IF
      IF (AMN2SS.GT.(AMMLSS+AMUP+AMDN).AND.AMN2SS.LT.(AMW+AML1SS)) THEN
        TM1=G**4*COS(THETAL)**2*SSXINT(AMMLSS,SSSNWS,EMAX)
        WID=2*PI**2*TM1/3./2./AMN2SS/(2.*PI)**5
        CALL SSSAVE(ISNML,3*WID,ISMUL,IDUP,-IDDN,0,0)
      END IF
      IF (AMN2SS.GT.(AMMLSS+AMCH+AMST).AND.AMN2SS.LT.(AMW+AML1SS)) THEN
        TM1=G**4*COS(THETAL)**2*SSXINT(AMMLSS,SSSNWS,EMAX)
        WID=2*PI**2*TM1/3./2./AMN2SS/(2.*PI)**5
        CALL SSSAVE(ISNML,3*WID,ISMUL,IDCH,-IDST,0,0)
      END IF
      TMP(4)=AMN1SS
      EMAX=(AMELSS**2+AMN1SS**2)/2./AMN1SS
      IF (AMN1SS.GT.(AMELSS+AME).AND.AMN1SS.LT.(AMW+AML1SS)) THEN
        TM1=G**4*COS(THETAL)**2*SSXINT(AMELSS,SSSNWS,EMAX)
        WID=2*PI**2*TM1/3./2./AMN1SS/(2.*PI)**5
        CALL SSSAVE(ISNEL,WID,ISEL,IDNE,-IDE,0,0)
      END IF
      IF (AMN1SS.GT.(AMELSS+AMMU).AND.AMN1SS.LT.(AMW+AML1SS)) THEN
        TM1=G**4*COS(THETAL)**2*SSXINT(AMELSS,SSSNWS,EMAX)
        WID=2*PI**2*TM1/3./2./AMN1SS/(2.*PI)**5
        CALL SSSAVE(ISNEL,WID,ISEL,IDNM,-IDMU,0,0)
      END IF
      IF (AMN1SS.GT.(AMELSS+AMUP+AMDN).AND.AMN1SS.LT.(AMW+AML1SS)) THEN
        TM1=G**4*COS(THETAL)**2*SSXINT(AMELSS,SSSNWS,EMAX)
        WID=2*PI**2*TM1/3./2./AMN1SS/(2.*PI)**5
        CALL SSSAVE(ISNEL,3*WID,ISEL,IDUP,-IDDN,0,0)
      END IF
      IF (AMN1SS.GT.(AMELSS+AMCH+AMST).AND.AMN1SS.LT.(AMW+AML1SS)) THEN
        TM1=G**4*COS(THETAL)**2*SSXINT(AMELSS,SSSNWS,EMAX)
        WID=2*PI**2*TM1/3./2./AMN1SS/(2.*PI)**5
        CALL SSSAVE(ISNEL,3*WID,ISEL,IDCH,-IDST,0,0)
      END IF
C-----COMPUTE ER AND MUR--> STAU_1+NEUTRINOS DECAYS --------------
      IF (AMERSS.LT.AMELSS.AND.AMERSS.GT.AML1SS) THEN
        TMP(1)=MW1
        TMP(2)=MW1
        TMP(3)=AML1SS
        TMP(4)=AMERSS
        IF (AMERSS.LT.MW1) THEN
        TM1=AML1**2*AME1**2*SSXINT(AML1SS**2,SSL1ST,AMERSS**2)
        TMP(2)=MW2
        TM2=2*AML1*AME1*APL1*APE1*SSXINT(AML1SS**2,SSL1ST,AMERSS**2)
        ELSE
        TM1=0.
        TM2=0.
        END IF
        IF (AMERSS.LT.MW2) THEN
        TMP(1)=MW2
        TMP(2)=MW2
        TM3=APL1**2*APE1**2*SSXINT(AML1SS**2,SSL1ST,AMERSS**2)
        ELSE
        TM3=0.
        END IF
        WID=PI**2*(TM1+TM2+TM3)/8./2./AMERSS/(2.*PI)**5
        CALL SSSAVE(ISER,WID,ISTAU1,IDNE,-IDNT,0,0)
      END IF
      IF (AMMRSS.LT.AMMLSS.AND.AMMRSS.GT.AML1SS) THEN
        AMM1=-G*SIN(GAMMAL)*COS(THETAM)+FM*COS(GAMMAL)*SIN(THETAM)
        AML1=-G*SIN(GAMMAL)*COS(THETAL)+FL*COS(GAMMAL)*SIN(THETAL)
        APM1=-G*THX*COS(GAMMAL)*COS(THETAM)-FM*THX*SIN(GAMMAL)*
     $       SIN(THETAM)
        APL1=-G*THX*COS(GAMMAL)*COS(THETAL)-FL*THX*SIN(GAMMAL)*
     $       SIN(THETAL)
        TMP(1)=MW1
        TMP(2)=MW1
        TMP(3)=AML1SS
        TMP(4)=AMMRSS
        IF (AMMRSS.LT.MW1) THEN
        TM1=AML1**2*AMM1**2*SSXINT(AML1SS**2,SSL1ST,AMMRSS**2)
        TMP(2)=MW2
        TM2=2*AML1*AMM1*APL1*APM1*SSXINT(AML1SS**2,SSL1ST,AMMRSS**2)
        ELSE
        TM1=0.
        TM2=0.
        END IF
        IF (AMMRSS.LT.MW2) THEN
        TMP(1)=MW2
        TMP(2)=MW2
        TM3=APL1**2*APM1**2*SSXINT(AML1SS**2,SSL1ST,AMMRSS**2)
        ELSE
        TM3=0.
        END IF
        WID=PI**2*(TM1+TM2+TM3)/8./2./AMMRSS/(2.*PI)**5
        CALL SSSAVE(ISMUR,WID,ISTAU1,IDNM,-IDNT,0,0)
      END IF
C-----COMPUTE SNU_E --> E +STAU_1BAR +NU_TAU DECAYS --------------
      AME1=-G*SIN(GAMMAL)
      AML1=-G*SIN(GAMMAL)*COS(THETAL)+FL*COS(GAMMAL)*SIN(THETAL)
      APE1=-G*THX*COS(GAMMAL)
      APL1=-G*THX*COS(GAMMAL)*COS(THETAL)-FL*THX*SIN(GAMMAL)*
     $       SIN(THETAL)
      IF (AMN1SS.GT.(AME+AML1SS)) THEN
        BME1=-FE*COS(GAMMAL)
        BPE1=FE*THX*SIN(GAMMAL)
        TMP(1)=MW1
        TMP(2)=MW1
        TMP(3)=AML1SS
        TMP(4)=AMN1SS
        IF (AMN1SS.LT.MW1) THEN
        TM1=AML1**2*(AME1**2*MW1**2*SSXINT(AML1SS**2,SSN1ST,AMN1SS**2)
     $+BME1**2*SSXINT(AML1SS**2,SSL1ST,AMN1SS**2))
        TMP(2)=MW2
        TM2=2*AML1*APL1*(SNW1*SNW2*AME1*APE1*
     $ SSXINT(AML1SS**2,SSN1ST,AMN1SS**2)+BME1*BPE1*
     $ SSXINT(AML1SS**2,SSL1ST,AMN1SS**2))
        ELSE
        TM1=0.
        TM2=0.
        END IF
        TMP(1)=MW2
        TMP(2)=MW2
        IF (AMN1SS.LT.MW2) THEN
        TM3=APL1**2*(APE1**2*MW2**2*SSXINT(AML1SS**2,SSN1ST,AMN1SS**2)
     $+BPE1**2*SSXINT(AML1SS**2,SSL1ST,AMN1SS**2))
        ELSE
        TM3=0.
        END IF
        WID=PI**2*(TM1+TM2+TM3)/8./2./AMN1SS/(2.*PI)**5
        CALL SSSAVE(ISNEL,WID,-ISTAU1,IDE,IDNT,0,0)
      END IF
C-----COMPUTE SNU_M --> MU +STAU_1BAR +NU_TAU DECAYS --------------
      IF (AMN2SS.GT.(AMMU+AML1SS)) THEN
        BME1=-FM*COS(GAMMAL)
        BPE1=FM*THX*SIN(GAMMAL)
        TMP(1)=MW1
        TMP(2)=MW1
        TMP(3)=AML1SS
        TMP(4)=AMN2SS
        IF (AMN2SS.LT.MW1) THEN
        TM1=AML1**2*(AME1**2*MW1**2*SSXINT(AML1SS**2,SSN1ST,AMN2SS**2)
     $+BME1**2*SSXINT(AML1SS**2,SSL1ST,AMN2SS**2))
        TMP(2)=MW2
        TM2=2*AML1*APL1*(SNW1*SNW2*AME1*APE1*
     $ SSXINT(AML1SS**2,SSN1ST,AMN2SS**2)+BME1*BPE1*
     $ SSXINT(AML1SS**2,SSL1ST,AMN2SS**2))
        ELSE
        TM1=0.
        TM2=0.
        END IF
        TMP(1)=MW2
        TMP(2)=MW2
        IF (AMN2SS.LT.MW2) THEN
        TM3=APL1**2*(APE1**2*MW2**2*SSXINT(AML1SS**2,SSN1ST,AMN2SS**2)
     $+BPE1**2*SSXINT(AML1SS**2,SSL1ST,AMN2SS**2))
        ELSE
        TM3=0.
        END IF
        WID=PI**2*(TM1+TM2+TM3)/8./2./AMN2SS/(2.*PI)**5
        CALL SSSAVE(ISNML,WID,-ISTAU1,IDMU,IDNT,0,0)
      END IF
C
C
C     decay to neutral higgs bosons
C
      IF (AML2SS.GT.(AMHL+AML1SS)) THEN
        BH=G*AMW*SIN(BETA-ALFAH)*(-1.+3*TN2THW)*SINL*COSL/2.+G*
     $  AMTAU*(TWOM1*COSA+AAL*SINA)*COS(2*THETAL)/2./AMW/COS(BETA)
        WID=BH**2*SQRT(SSXLAM(AML2SS**2,AMHL**2,AML1SS**2))/
     $      16./PI/AML2SS**3
        CALL SSSAVE(ISTAU2,WID,ISHL,ISTAU1,0,0,0)
      ENDIF
C
      IF (AML2SS.GT.(AMHA+AML1SS)) THEN
        BH=G*AMTAU*(TWOM1-AAL*TANB)/2./AMW
        WID=BH**2*SQRT(SSXLAM(AML2SS**2,AMHA**2,AML1SS**2))/
     $      16./PI/AML2SS**3
        CALL SSSAVE(ISTAU2,WID,ISHA,ISTAU1,0,0,0)
      ENDIF
C
      IF (AML2SS.GT.(AMHH+AML1SS)) THEN
        BH=-G*AMW*COS(BETA-ALFAH)*(-1.+3*TN2THW)*SINL*COSL/2.+G*
     $  AMTAU*(-TWOM1*SINA+AAL*COSA)*COS(2*THETAL)/2./AMW/COS(BETA)
        WID=BH**2*SQRT(SSXLAM(AML2SS**2,AMHH**2,AML1SS**2))/
     $      16./PI/AML2SS**3
        CALL SSSAVE(ISTAU2,WID,ISHH,ISTAU1,0,0,0)
      ENDIF
C
C     stau_i -> H^- stau_j
C
      IF (AMN3SS.GT.(AML1SS+AMHC)) THEN
        A=G/SR2/AMW*((AMTAU**2*TANB-AMW**2*SIN(2*BETA))*COSL-
     $    AMTAU*(TWOM1-AAL*TANB)*SINL)
        WID=A*A*SQRT(SSXLAM(AMN3SS**2,AML1SS**2,AMHC**2))/
     $      16./PI/AMN3SS**3
        CALL SSSAVE(ISNTL,WID,ISHC,ISTAU1,0,0,0)
      END IF
C
      IF (AMN3SS.GT.(AML2SS+AMHC)) THEN
        A=G/SR2/AMW*((AMTAU**2*TANB-AMW**2*SIN(2*BETA))*SINL+
     $    AMTAU*(TWOM1-AAL*TANB)*COSL)
        WID=A*A*SQRT(SSXLAM(AMN3SS**2,AML2SS**2,AMHC**2))/
     $      16./PI/AMN3SS**3
        CALL SSSAVE(ISNTL,WID,ISHC,ISTAU2,0,0,0)
      END IF
C
      IF (AML1SS.GT.(AMN3SS+AMHC)) THEN
        A=G/SR2/AMW*((AMTAU**2*TANB-AMW**2*SIN(2*BETA))*COSL-
     $    AMTAU*(TWOM1-AAL*TANB)*SINL)
        WID=A*A*SQRT(SSXLAM(AML1SS**2,AMN3SS**2,AMHC**2))/
     $      16./PI/AML1SS**3
        CALL SSSAVE(ISTAU1,WID,-ISHC,ISNTL,0,0,0)
      END IF
C
      IF (AML2SS.GT.(AMN3SS+AMHC)) THEN
        A=G/SR2/AMW*((AMTAU**2*TANB-AMW**2*SIN(2*BETA))*SINL+
     $    AMTAU*(TWOM1-AAL*TANB)*COSL)
        WID=A*A*SQRT(SSXLAM(AML2SS**2,AMN3SS**2,AMHC**2))/
     $      16./PI/AML2SS**3
        CALL SSSAVE(ISTAU2,WID,-ISHC,ISNTL,0,0,0)
      END IF
C
C     Gauge mediated SUSY breaking model decays to gravitino
      IF (AMERSS.GT.(AME+AMGVSS)) THEN
        WID=(AMERSS**2-AME**2)**4/48./PI/AMERSS**3/(AMPL*AMGVSS)**2
        CALL SSSAVE(ISER,WID,IDE,91,0,0,0)
      END IF
      IF (AMMRSS.GT.(AMMU+AMGVSS)) THEN
        WID=(AMMRSS**2-AMMU**2)**4/48./PI/AMMRSS**3/(AMPL*AMGVSS)**2
        CALL SSSAVE(ISMUR,WID,IDMU,91,0,0,0)
      END IF
      IF (AML1SS.GT.(AMTAU+AMGVSS)) THEN
        WID=(AML1SS**2-AMTAU**2)**4/48./PI/AML1SS**3/(AMPL*AMGVSS)**2
        CALL SSSAVE(ISTAU1,WID,IDTAU,91,0,0,0)
      END IF
      IF (AMELSS.GT.(AME+AMGVSS)) THEN
        WID=(AMELSS**2-AME**2)**4/48./PI/AMELSS**3/(AMPL*AMGVSS)**2
        CALL SSSAVE(ISEL,WID,IDE,91,0,0,0)
      END IF
      IF (AMMLSS.GT.(AMMU+AMGVSS)) THEN
        WID=(AMMLSS**2-AMMU**2)**4/48./PI/AMMLSS**3/(AMPL*AMGVSS)**2
        CALL SSSAVE(ISMUL,WID,IDMU,91,0,0,0)
      END IF
      IF (AMN1SS.GT.AMGVSS) THEN
        WID=AMN1SS**5/48./PI/(AMPL*AMGVSS)**2
        CALL SSSAVE(ISNEL,WID,IDNE,91,0,0,0)
      END IF
      IF (AMN2SS.GT.AMGVSS) THEN
        WID=AMN2SS**5/48./PI/(AMPL*AMGVSS)**2
        CALL SSSAVE(ISNML,WID,IDNM,91,0,0,0)
      END IF
      IF (AMN3SS.GT.AMGVSS) THEN
        WID=AMN3SS**5/48./PI/(AMPL*AMGVSS)**2
        CALL SSSAVE(ISNTL,WID,IDNT,91,0,0,0)
      END IF
C
C          Normalize branching ratios 
C
      CALL SSNORM(ISEL)
      CALL SSNORM(ISMUL)
      CALL SSNORM(ISTAU1)
      CALL SSNORM(ISER)
      CALL SSNORM(ISMUR)
      CALL SSNORM(ISTAU2)
      CALL SSNORM(ISNEL)
      CALL SSNORM(ISNML)
      CALL SSNORM(ISNTL)
C
       RETURN
       END

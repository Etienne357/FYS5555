CDECK  ID>, SSHGM.
      SUBROUTINE SSHGM
C-----------------------------------------------------------------------
C
C     Calculate H -> gm gm decays including both SM particles and
C     SUSY particles in loop.
C
C     This subroutine uses the tau variable of the Higgs Hunters'
C     Guide.  Many other authors, including the paper cited in 
C     Higgs Hunters' Guide (PR. D. 38(11): 3481) and Collider Physics
C     by Barger and Phillips use the variable lambda
C          LAMBDA = ( MASS OF PARTICLE IN LOOP / MASS OF HIGGS )**2
C          TAU = 4.0 * LAMBDA 
C
C     Bisset's HGAMGAM
C-----------------------------------------------------------------------
      IMPLICIT NONE
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
C
      DOUBLE PRECISION MW1,MW2
      DOUBLE PRECISION MFL(3),MFD(3),MFU(3)
      DOUBLE PRECISION ETAH,IITOT,RITOT,TAU,IFFF,RFFF,IFHALF,RFHALF
     $,IF1,RF1,IF0,RF0,NCC,EF,TEMPCH,RHF,RHW,RHCH,RHSF,RHSFL,RHSFR
     $,TEMP,RHCNO,IIHF,RIHF,IIHW,RIHW,IIHCH,RIHCH,IIHSFL,RIHSFL
     $,IIHSFR,RIHSFR,IIHCNO,RIHCNO
     $,RHSF1,RHSF2,IIHSF1,IIHSF2,RIHSF1,RIHSF2
      DOUBLE PRECISION U11,U12,U21,U22,V11,V12,V21,V22,S11,Q11,S22,Q22
     $,SUMISQ,DW
      DOUBLE PRECISION PI,SR2,XM,YM,CGL,SGL,CGR,SGR,G2,MH,BETA,ALPHA
     $,THETX,THETY,THETM,THETP,CW2,AMSQ
      REAL WID
      INTEGER NUMH,IJ,II,NUMOUT,IDHHA       
C
C          Mass matrix parameters
C
      PI=4.*ATAN(1.D0)
      SR2=SQRT(2.D0)
      XM=1./TAN(GAMMAL)
      THETX=SIGN(1.D0,XM)
      YM=1./TAN(GAMMAR)
      THETY=SIGN(1.D0,YM)
      SGL=1/(DSQRT(1+XM**2))
      CGL=SGL*XM
      SGR=1/(DSQRT(1+YM**2))
      CGR=SGR*YM
      MW1=DBLE(ABS(AMW1SS))
      MW2=DBLE(ABS(AMW2SS))
      THETM=SIGN(1.,AMW1SS)
      THETP=SIGN(1.,AMW2SS)
      G2=4.0*PI*ALFAEM/SN2THW
      BETA=ATAN(1.0/RV2V1)
      ALPHA=ALFAH
      CW2=1.-SN2THW
C
C          Loop over neutral Higgs bosons
C
      DO 100 NUMH=1,3
        IF(NUMH.EQ.1) THEN
           MH=AMHL
           IDHHA=ISHL
        ELSEIF(NUMH.EQ.2) THEN
           MH=AMHH
           IDHHA=ISHH
        ELSE
           MH=AMHA
           IDHHA=ISHA
        ENDIF
        ETAH=1.0
        IITOT=0.0
        RITOT=0.0
C
C
      MFL(1)=DBLE(AME)
      MFL(2)=DBLE(AMMU)
      MFL(3)=DBLE(AMTAU)
      MFD(1)=DBLE(AMDN)
      MFD(2)=DBLE(AMST)
      MFD(3)=DBLE(MBQ)
      MFU(1)=DBLE(AMUP)
      MFU(2)=DBLE(AMCH)
      MFU(3)=DBLE(MTQ)
C
C            Charged lepton loops
C
        DO 10 II=1,3
          TAU=4*MFL(II)**2/MH**2                  
          CALL SSHGM1(TAU,IFFF,RFFF)         
          IFHALF=-2.0*TAU*(1.0-TAU*ETAH)*IFFF
          RFHALF=-2.0*TAU*(ETAH+(1.0-TAU*ETAH)*RFFF)
          NCC=1.0
          EF=-1.0
          IF(NUMH.EQ.1) THEN
            RHF=SIN(ALPHA)/COS(BETA)
          ELSEIF(NUMH.EQ.2) THEN
            RHF=COS(ALPHA)/COS(BETA)
          ELSE
            RHF=TAN(BETA)
          ENDIF
          IIHF=NCC*EF**2*RHF*IFHALF
          RIHF=NCC*EF**2*RHF*RFHALF
          IITOT=IITOT+IIHF
          RITOT=RITOT+RIHF
10      CONTINUE 
C
C            Down-type quark loops
C
        DO 20 II=1,3
          TAU=4*MFD(II)**2/MH**2                  
          CALL SSHGM1(TAU,IFFF,RFFF)         
          IFHALF=-2.0*TAU*(1.0-TAU*ETAH)*IFFF
          RFHALF=-2.0*TAU*(ETAH+(1.0-TAU*ETAH)*RFFF)
          NCC=3.0
          EF=-1.0/3.0
          IF(NUMH.EQ.1) THEN
            RHF=SIN(ALPHA)/COS(BETA)
          ELSEIF(NUMH.EQ.2) THEN
            RHF=COS(ALPHA)/COS(BETA)
          ELSE
            RHF=DTAN(BETA)
          ENDIF
          IIHF=NCC*EF**2*RHF*IFHALF
          RIHF=NCC*EF**2*RHF*RFHALF
          IITOT=IITOT+IIHF
          RITOT=RITOT+RIHF
20      CONTINUE 
C           
C            Up-type quark loops
C
        DO 30 II=1,2
          TAU=4*MFU(II)**2/MH**2                  
          CALL SSHGM1(TAU,IFFF,RFFF)         
          IFHALF=-2.0*TAU*(1.0-TAU*ETAH)*IFFF
          RFHALF=-2.0*TAU*(ETAH+(1.0-TAU*ETAH)*RFFF)
          NCC=3.0
          EF=2.0/3.0
          IF(NUMH.EQ.1) THEN
            RHF=COS(ALPHA)/SIN(BETA)
          ELSEIF(NUMH.EQ.2) THEN
            RHF=-SIN(ALPHA)/SIN(BETA)
          ELSE
            RHF=1.0/TAN(BETA)
          ENDIF
          IIHF=NCC*EF**2*RHF*IFHALF
          RIHF=NCC*EF**2*RHF*RFHALF
          IITOT=IITOT+IIHF
          RITOT=RITOT+RIHF
30      CONTINUE 
C
        TAU=4*MFU(3)**2/MH**2                  
        CALL SSHGM1(TAU,IFFF,RFFF)         
        IFHALF=-2.0*TAU*(1.0-TAU*ETAH)*IFFF
        RFHALF=-2.0*TAU*(ETAH+(1.0-TAU*ETAH)*RFFF)
        NCC=3.0
        EF=2.0/3.0
        IF(NUMH.EQ.1) THEN
          RHF=COS(ALPHA)/SIN(BETA)
        ELSEIF(NUMH.EQ.2) THEN
          RHF=-SIN(ALPHA)/SIN(BETA)
        ELSE
          RHF=1.0/TAN(BETA)
        ENDIF
        IIHF=NCC*EF**2*RHF*IFHALF
        RIHF=NCC*EF**2*RHF*RFHALF
        IITOT=IITOT+IIHF
        RITOT=RITOT+RIHF
C
C            W-boson loop
C           
        TAU=4*AMW**2/MH**2                  
        CALL SSHGM1(TAU,IFFF,RFFF)         
        IF1=3.0*TAU*(2.0-TAU)*IFFF
        RF1=2.0+3.0*TAU+3.0*TAU*(2.0-TAU)*RFFF
        IF(NUMH.EQ.1) THEN
          RHW=SIN(BETA+ALPHA)
        ELSEIF(NUMH.EQ.2) THEN
          RHW=COS(BETA+ALPHA)
        ELSE
          RHW=0
        ENDIF
        IIHW=RHW*IF1
        RIHW=RHW*RF1
        IITOT=IITOT+IIHW
        RITOT=RITOT+RIHW
C
C            Charged Higgs loop
C 
        TAU=4*AMHC**2/MH**2                  
        CALL SSHGM1(TAU,IFFF,RFFF)         
        IF0=-TAU*TAU*IFFF          
        RF0=TAU*(1.0-TAU*RFFF)          
        IF(NUMH.EQ.1) THEN
          TEMPCH=SIN(BETA-ALPHA)*COS(2.0*BETA)
          TEMPCH=TEMPCH/(2.0*CW2)
          RHCH=TEMPCH+SIN(BETA+ALPHA)
        ELSEIF(NUMH.EQ.2) THEN
          TEMPCH=-COS(BETA-ALPHA)*COS(2.0*BETA)
          TEMPCH=TEMPCH/(2.0*CW2)
          RHCH=COS(BETA+ALPHA)+TEMPCH
        ELSE
          RHCH=0
        ENDIF
        IIHCH=RHCH*IF0*AMW**2/AMHC**2
        RIHCH=RHCH*RF0*AMW**2/AMHC**2
        IITOT=IITOT+IIHCH
        RITOT=RITOT+RIHCH
C
C         Slepton loops
C         The 3 L-type sneutrinos can be omitted since the sfermion
C         decay width is proportional to the sfermion charge.
C         ==> There are two sets of 3 degenerate sleptons.
C
        NCC=1.0
        EF=-1.0
C         First, do e_L and mu_L sleptons
        DO 40 II=1,2
          IF(NUMH.EQ.1) THEN
            RHSF=(MFL(II)/AMZ)**2*SIN(ALPHA)/COS(BETA)
            TEMP=(-0.5-EF*SN2THW)*SIN(BETA-ALPHA)
            RHSFL=RHSF-TEMP
          ELSEIF(NUMH.EQ.2) THEN
            RHSF=(MFL(II)/AMZ)**2*COS(ALPHA)/COS(BETA)
            TEMP=(-0.5-EF*SN2THW)*COS(BETA-ALPHA)
            RHSFL=RHSF-TEMP
          ELSE
            RHSF=0
            RHSFL=0
          ENDIF
          IF (II.EQ.1) AMSQ=AMELSS
          IF (II.EQ.2) AMSQ=AMMLSS
          TAU=4*AMSQ**2/MH**2                  
          CALL SSHGM1(TAU,IFFF,RFFF)         
          IF0=-TAU*TAU*IFFF          
          RF0=TAU*(1.0-TAU*RFFF)          
          IIHSFL=NCC*(EF**2)*RHSFL*IF0*(AMZ/AMSQ)**2
          RIHSFL=NCC*(EF**2)*RHSFL*RF0*(AMZ/AMSQ)**2
          IITOT=IITOT+IIHSFL
          RITOT=RITOT+RIHSFL
40      CONTINUE
C         Next, do e_R and mu_R
        DO 41 II=1,2
          IF(NUMH.EQ.1) THEN
            RHSF=(MFL(II)/AMZ)**2*SIN(ALPHA)/COS(BETA)
            TEMP=-1.0*EF*SN2THW*SIN(BETA-ALPHA)
            RHSFR=RHSF+TEMP
          ELSEIF(NUMH.EQ.2) THEN
            RHSF=(MFL(II)/AMZ)**2*COS(ALPHA)/COS(BETA)
            TEMP=-1.0*EF*SN2THW*COS(BETA-ALPHA)
            RHSFR=RHSF+TEMP
          ELSE
            RHSF=0
            RHSFR=0
          ENDIF
          IF (II.EQ.1) AMSQ=AMERSS
          IF (II.EQ.2) AMSQ=AMMRSS
          TAU=4*AMSQ**2/MH**2                  
          CALL SSHGM1(TAU,IFFF,RFFF)         
          IF0=-TAU*TAU*IFFF          
          RF0=TAU*(1.0-TAU*RFFF)          
          IIHSFR=NCC*(EF**2)*RHSFR*IF0*(AMZ/AMSQ)**2
          RIHSFR=NCC*(EF**2)*RHSFR*RF0*(AMZ/AMSQ)**2
          IITOT=IITOT+IIHSFR
          RITOT=RITOT+RIHSFR
41      CONTINUE
C         Next, do stau_1 and stau_2 contribution
        IF(NUMH.EQ.1) THEN
          RHSF=(AMTAU/AMZ)**2*SIN(ALPHA)/COS(BETA)
          TEMP=(-0.5-EF*SN2THW)*SIN(BETA-ALPHA)
          RHSFL=RHSF-TEMP
          TEMP=-1.0*EF*SN2THW*SIN(BETA-ALPHA)
          RHSFR=RHSF+TEMP
        ELSEIF(NUMH.EQ.2) THEN
          RHSF=(AMTAU/AMZ)**2*COS(ALPHA)/COS(BETA)
          TEMP=(-0.5-EF*SN2THW)*COS(BETA-ALPHA)
          RHSFL=RHSF-TEMP
          TEMP=-1.0*EF*SN2THW*COS(BETA-ALPHA)
          RHSFR=RHSF+TEMP
        ELSE
          RHSF=0
          RHSFL=0
          RHSFR=0
        ENDIF
        RHSF1=RHSFL*COS(THETAL)-RHSFR*SIN(THETAL)
        RHSF2=RHSFL*SIN(THETAL)+RHSFR*COS(THETAL)
        TAU=4*AML1SS**2/MH**2                  
        CALL SSHGM1(TAU,IFFF,RFFF)
        IF0=-TAU*TAU*IFFF          
        RF0=TAU*(1.0-TAU*RFFF)          
        IIHSF1=NCC*(EF**2)*RHSF1*IF0*(AMZ/AML1SS)**2
        RIHSF1=NCC*(EF**2)*RHSF1*RF0*(AMZ/AML1SS)**2
        IITOT=IITOT+IIHSF1
        RITOT=RITOT+RIHSF1
        TAU=4*AML2SS**2/MH**2                  
        CALL SSHGM1(TAU,IFFF,RFFF)
        IF0=-TAU*TAU*IFFF          
        RF0=TAU*(1.0-TAU*RFFF)          
        IIHSF2=NCC*(EF**2)*RHSF2*IF0*(AMZ/AML2SS)**2
        RIHSF2=NCC*(EF**2)*RHSF2*RF0*(AMZ/AML2SS)**2
        IITOT=IITOT+IIHSF2
        RITOT=RITOT+RIHSF2
C
C          Down-type squark loops
C          Mixing between the sbottom squarks is also included, so  
C          masses used here are the mixed masses (AMB1SS & AMB2SS)
C
        NCC=3.0
        EF=-1.0/3.0
C          First, do d_L and s_L squarks
        DO 50 II=1,2
          IF(NUMH.EQ.1) THEN
            RHSF=(MFD(II)/AMZ)**2*SIN(ALPHA)/COS(BETA)
            TEMP=(-0.5-EF*SN2THW)*SIN(BETA-ALPHA)
            RHSFL=RHSF-TEMP
          ELSEIF(NUMH.EQ.2) THEN
            RHSF=(MFD(II)/AMZ)**2*COS(ALPHA)/COS(BETA)
            TEMP=(-0.5-EF*SN2THW)*COS(BETA-ALPHA)
            RHSFL=RHSF-TEMP
          ELSE
            RHSF=0
            RHSFL=0
          ENDIF
          IF (II.EQ.1) AMSQ=AMDLSS
          IF (II.EQ.2) AMSQ=AMSLSS
          TAU=4*AMSQ**2/MH**2                  
          CALL SSHGM1(TAU,IFFF,RFFF)         
          IF0=-TAU*TAU*IFFF          
          RF0=TAU*(1.0-TAU*RFFF)          
          IIHSFL=NCC*(EF**2)*RHSFL*IF0*(AMZ/AMSQ)**2
          RIHSFL=NCC*(EF**2)*RHSFL*RF0*(AMZ/AMSQ)**2
          IITOT=IITOT+IIHSFL
          RITOT=RITOT+RIHSFL
50      CONTINUE
C         Next, do d_R and s_R squarks
        DO 51 II=1,2
          IF(NUMH.EQ.1) THEN
            RHSF=(MFD(II)/AMZ)**2*SIN(ALPHA)/COS(BETA)
            TEMP=-1.0*EF*SN2THW*SIN(BETA-ALPHA)
            RHSFR=RHSF+TEMP
          ELSEIF(NUMH.EQ.2) THEN
            RHSF=(MFD(II)/AMZ)**2*COS(ALPHA)/COS(BETA)
            TEMP=-1.0*EF*SN2THW*COS(BETA-ALPHA)
            RHSFR=RHSF+TEMP
          ELSE
            RHSF=0
            RHSFR=0
          ENDIF
          IF (II.EQ.1) AMSQ=AMDRSS
          IF (II.EQ.2) AMSQ=AMSRSS
          TAU=4*AMSQ**2/MH**2                  
          CALL SSHGM1(TAU,IFFF,RFFF)         
          IF0=-TAU*TAU*IFFF          
          RF0=TAU*(1.0-TAU*RFFF)          
          IIHSFR=NCC*(EF**2)*RHSFR*IF0*(AMZ/AMSQ)**2
          RIHSFR=NCC*(EF**2)*RHSFR*RF0*(AMZ/AMSQ)**2
          IITOT=IITOT+IIHSFR
          RITOT=RITOT+RIHSFR
51      CONTINUE
C
        NCC=3.0
        EF=-1.0/3.0
        IF(NUMH.EQ.1) THEN
          RHSF=(MBQ/AMZ)**2*SIN(ALPHA)/COS(BETA)
          TEMP=(-0.5-EF*SN2THW)*SIN(BETA-ALPHA)
          RHSFL=RHSF-TEMP
          TEMP=-1.0*EF*SN2THW*SIN(BETA-ALPHA)
          RHSFR=RHSF+TEMP
        ELSEIF(NUMH.EQ.2) THEN
          RHSF=(MBQ/AMZ)**2*COS(ALPHA)/COS(BETA)
          TEMP=(-0.5-EF*SN2THW)*COS(BETA-ALPHA)
          RHSFL=RHSF-TEMP
          TEMP=-1.0*EF*SN2THW*COS(BETA-ALPHA)
          RHSFR=RHSF+TEMP
        ELSE
          RHSF=0
          RHSFL=0
          RHSFR=0
        ENDIF
        RHSF1=RHSFL*COS(THETAB)-RHSFR*SIN(THETAB)
        RHSF2=RHSFL*SIN(THETAB)+RHSFR*COS(THETAB)
        TAU=4*AMB1SS**2/MH**2                  
        CALL SSHGM1(TAU,IFFF,RFFF)
        IF0=-TAU*TAU*IFFF          
        RF0=TAU*(1.0-TAU*RFFF)          
        IIHSF1=NCC*(EF**2)*RHSF1*IF0*(AMZ/AMB1SS)**2
        RIHSF1=NCC*(EF**2)*RHSF1*RF0*(AMZ/AMB1SS)**2
        IITOT=IITOT+IIHSF1
        RITOT=RITOT+RIHSF1
        TAU=4*AMB2SS**2/MH**2                  
        CALL SSHGM1(TAU,IFFF,RFFF)
        IF0=-TAU*TAU*IFFF          
        RF0=TAU*(1.0-TAU*RFFF)          
        IIHSF2=NCC*(EF**2)*RHSF2*IF0*(AMZ/AMB2SS)**2
        RIHSF2=NCC*(EF**2)*RHSF2*RF0*(AMZ/AMB2SS)**2
        IITOT=IITOT+IIHSF2
        RITOT=RITOT+RIHSF2
C
C         Up-type squark loops
C         Mixing between the stop squarks is also included, so  
C         masses used here are the mixed masses (AMT1SS & AMT2SS)
C
        NCC=3.0
        EF=2.0/3.0            
C         First, do u_L and c_L squarks
        DO 60 II=1,2
          IF(NUMH.EQ.1) THEN
            RHSF=(MFU(II)/AMZ)**2*COS(ALPHA)/SIN(BETA)
            TEMP=(0.5-EF*SN2THW)*SIN(BETA-ALPHA)
            RHSFL=RHSF-TEMP
          ELSEIF(NUMH.EQ.2) THEN
            RHSF=(MFU(II)/AMZ)**2*(-1.0)*SIN(ALPHA)/SIN(BETA)
            TEMP=(0.5-EF*SN2THW)*COS(BETA-ALPHA)
            RHSFL=RHSF-TEMP
          ELSE
            RHSF=0
            RHSFL=0
          ENDIF
          IF (II.EQ.1) AMSQ=AMULSS
          IF (II.EQ.2) AMSQ=AMCLSS
          TAU=4*AMSQ**2/MH**2                  
          CALL SSHGM1(TAU,IFFF,RFFF)         
          IF0=-TAU*TAU*IFFF          
          RF0=TAU*(1.0-TAU*RFFF)          
          IIHSFL=NCC*(EF**2)*RHSFL*IF0*(AMZ/AMSQ)**2
          RIHSFL=NCC*(EF**2)*RHSFL*RF0*(AMZ/AMSQ)**2
          IITOT=IITOT+IIHSFL
          RITOT=RITOT+RIHSFL
60      CONTINUE
C          Next, do u_R and c_R squarks
        DO 61 II=1,2
          IF(NUMH.EQ.1) THEN
            RHSF=(MFU(II)/AMZ)**2*COS(ALPHA)/SIN(BETA)
            TEMP=-1.0*EF*SN2THW*SIN(BETA-ALPHA)
            RHSFR=RHSF+TEMP
          ELSEIF(NUMH.EQ.2) THEN
            RHSF=(MFU(II)/AMZ)**2*(-1.0)*SIN(ALPHA)/SIN(BETA)
            TEMP=-1.0*EF*SN2THW*COS(BETA-ALPHA)
            RHSFR=RHSF+TEMP
          ELSE
            RHSF=0
            RHSFR=0
          ENDIF
          IF (II.EQ.1) AMSQ=AMURSS
          IF (II.EQ.2) AMSQ=AMCRSS
          TAU=4*AMSQ**2/MH**2                  
          CALL SSHGM1(TAU,IFFF,RFFF)         
          IF0=-TAU*TAU*IFFF          
          RF0=TAU*(1.0-TAU*RFFF)          
          IIHSFR=NCC*(EF**2)*RHSFR*IF0*(AMZ/AMSQ)**2
          RIHSFR=NCC*(EF**2)*RHSFR*RF0*(AMZ/AMSQ)**2
          IITOT=IITOT+IIHSFR
          RITOT=RITOT+RIHSFR
61      CONTINUE
C
        NCC=3.0
        EF=2.0/3.0
        IF(NUMH.EQ.1) THEN
          RHSF=(MTQ/AMZ)**2*COS(ALPHA)/SIN(BETA)
          TEMP=(0.5-EF*SN2THW)*SIN(BETA-ALPHA)
          RHSFL=RHSF-TEMP
          TEMP=-1.0*EF*SN2THW*SIN(BETA-ALPHA)
          RHSFR=RHSF+TEMP
        ELSEIF(NUMH.EQ.2) THEN
          RHSF=(MTQ/AMZ)**2*(-1.0)*SIN(ALPHA)/SIN(BETA)
          TEMP=(0.5-EF*SN2THW)*COS(BETA-ALPHA)
          RHSFL=RHSF-TEMP
          TEMP=-1.0*EF*SN2THW*COS(BETA-ALPHA)
          RHSFR=RHSF+TEMP
        ELSE
          RHSF=0
          RHSFL=0
          IIHSFL=0
          RIHSFL=0
        ENDIF
        RHSF1=RHSFL*COS(THETAB)-RHSFR*SIN(THETAB)
        RHSF2=RHSFL*SIN(THETAB)+RHSFR*COS(THETAB)
        TAU=4*AMT1SS**2/MH**2                  
        CALL SSHGM1(TAU,IFFF,RFFF)         
        IF0=-TAU*TAU*IFFF          
        RF0=TAU*(1.0-TAU*RFFF)          
        IIHSF1=NCC*(EF**2)*RHSF1*IF0*(AMZ/AMT1SS)**2
        RIHSF1=NCC*(EF**2)*RHSF1*RF0*(AMZ/AMT1SS)**2
        IITOT=IITOT+IIHSF1
        RITOT=RITOT+RIHSF1
        TAU=4*AMT2SS**2/MH**2                  
        CALL SSHGM1(TAU,IFFF,RFFF)         
        IF0=-TAU*TAU*IFFF          
        RF0=TAU*(1.0-TAU*RFFF)          
        IIHSF2=NCC*(EF**2)*RHSF2*IF0*(AMZ/AMT2SS)**2
        RIHSF2=NCC*(EF**2)*RHSF2*RF0*(AMZ/AMT2SS)**2
        IITOT=IITOT+IIHSF2
        RITOT=RITOT+RIHSF2
C
C            Chargino loops
C
        TAU=4.0*(MW1)**2/MH**2                  
        CALL SSHGM1(TAU,IFFF,RFFF)         
        IFHALF=-2.0*TAU*(1.0-TAU*ETAH)*IFFF
        RFHALF=-2.0*TAU*(ETAH+(1.0-TAU*ETAH)*RFFF)
        U11=SGL
        U12=-CGL
        V11=THETM*SGR
        V12=-THETM*CGR
        S11=U11*V12/SR2
        Q11=U12*V11/SR2
        RHCNO=2.0*(S11*COS(ALPHA)+Q11*SIN(ALPHA))
        IIHCNO=RHCNO*IFHALF*AMW/MW1 
        RIHCNO=RHCNO*RFHALF*AMW/MW1 
        IITOT=IITOT+IIHCNO
        RITOT=RITOT+RIHCNO
C
        TAU=4.0*(MW2)**2/MH**2                  
        CALL SSHGM1(TAU,IFFF,RFFF)         
        IFHALF=-2.0*TAU*(1.0-TAU*ETAH)*IFFF
        RFHALF=-2.0*TAU*(ETAH+(1.0-TAU*ETAH)*RFFF)
        U21=THETX*CGL
        U22=THETX*SGL
        V21=THETP*THETY*CGR
        V22=THETP*THETY*SGR
        S22=U21*V22/SR2
        Q22=U22*V21/SR2
        RHCNO=2.0*(S22*COS(ALPHA)+Q22*SIN(ALPHA))
        IIHCNO=RHCNO*IFHALF*AMW/MW2 
        RIHCNO=RHCNO*RFHALF*AMW/MW2 
        IITOT=IITOT+IIHCNO
        RITOT=RITOT+RIHCNO
C
C          IITOT and RITOT now contain the total imaginary and real
C          parts of the I function
C
        SUMISQ=IITOT**2+RITOT**2
        DW=ALFAEM**2*G2*MH**3/(1024.0*(PI**3)*AMW**2) 
        WID=DW*SUMISQ
        CALL SSSAVE(IDHHA,WID,IDGM,IDGM,0,0,0)
100   CONTINUE
C
      RETURN
      END

CDECK  ID>, PRTLIM.
      SUBROUTINE PRTLIM
C
C          Print initial conditions and limits for generating jets
C
      IMPLICIT NONE
      COMMON/ITAPES/ITDKY,ITEVT,ITCOM,ITLIS
      SAVE /ITAPES/
      INTEGER   ITDKY,ITEVT,ITCOM,ITLIS
      INTEGER   MXFORC
      PARAMETER (MXFORC=40)
      COMMON/FORCE/NFORCE,IFORCE(MXFORC),MFORCE(5,MXFORC)
     $,LOOK2(2,MXFORC),LOOKST(MXFORC),MEFORC(MXFORC)
      SAVE /FORCE/
      INTEGER   NFORCE,IFORCE,MFORCE,LOOK2,LOOKST,MEFORC
      INTEGER   LIMPOM
      PARAMETER (LIMPOM=20)
      COMMON/MBGEN/POMWT(LIMPOM),POMGEN(LIMPOM),MNPOM,MXPOM,PDIFFR,
     $NPOM,XBARY(2),DXBARY(2),XPOM(LIMPOM,2)
      SAVE /MBGEN/
      INTEGER   MNPOM,MXPOM,NPOM
      REAL      POMWT,POMGEN,PDIFFR,XBARY,DXBARY,XPOM
      COMMON/QCDPAR/ALAM,ALAM2,CUTJET,ISTRUC
      SAVE /QCDPAR/
      INTEGER   ISTRUC
      REAL      ALAM,ALAM2,CUTJET
      COMMON/QLMASS/AMLEP(100),NQLEP,NMES,NBARY
      SAVE /QLMASS/
      INTEGER   NQLEP,NMES,NBARY
      REAL      AMLEP
      COMMON/WCON/SIN2W,WMASS(4),WGAM(4),AQ(12,4),BQ(12,4),COUT(4),
     1MATCH(25,4),WCBR(25,4),CUTOFF,CUTPOW,TBRWW(4,2),RBRWW(12,4,2),EZ,
     2AQDP(12,4),BQDP(12,4),EZDP,WFUDGE
      SAVE /WCON/
      DOUBLE PRECISION AQDP,BQDP,EZDP
      INTEGER   MATCH
      REAL      SIN2W,WMASS,WGAM,AQ,BQ,COUT,WCBR,CUTOFF,CUTPOW,TBRWW,
     +          RBRWW,EZ,WFUDGE
      COMMON/WCON2/CUMWBR(25,3)
      REAL CUMWBR
      COMMON/JETPAR/P(3),PT(3),YJ(3),PHI(3),XJ(3),TH(3),CTH(3),STH(3)
     1 ,JETTYP(3),SHAT,THAT,UHAT,QSQ,X1,X2,PBEAM(2)
     2 ,QMW,QW,QTW,YW,XW,THW,QTMW,PHIW,SHAT1,THAT1,UHAT1,JWTYP
     3 ,ALFQSQ,CTHW,STHW,Q0W
     4 ,INITYP(2),ISIGS,PBEAMS(5)
      SAVE /JETPAR/
      INTEGER   JETTYP,JWTYP,INITYP,ISIGS
      REAL      P,PT,YJ,PHI,XJ,TH,CTH,STH,SHAT,THAT,UHAT,QSQ,X1,X2,
     +          PBEAM,QMW,QW,QTW,YW,XW,THW,QTMW,PHIW,SHAT1,THAT1,UHAT1,
     +          ALFQSQ,CTHW,STHW,Q0W,PBEAMS
      INTEGER MXKEYS
      PARAMETER (MXKEYS=20)
      COMMON/KEYS/IKEYS,KEYON,KEYS(MXKEYS)
      COMMON/XKEYS/REAC
      SAVE /KEYS/,/XKEYS/
      LOGICAL KEYS
      LOGICAL KEYON
      CHARACTER*8 REAC
      INTEGER   IKEYS
C          KKGravity common
      COMMON/KKGRAV/NEXTRAD,MASSD,KKGSD,SURFD,UVCUT
      INTEGER NEXTRAD
      REAL    MASSD,KKGSD,SURFD
      LOGICAL UVCUT
      SAVE /KKGRAV/
      COMMON/FRGPAR/PUD,PBARY,SIGQT,PEND,XGEN(8),PSPIN1(8),
     $PMIX1(3,2),PMIX2(3,2),XGENSS(9)
      SAVE /FRGPAR/
      EQUIVALENCE (PMIX1(1,1),PMIXX1(1))
      EQUIVALENCE (PMIX2(1,1),PMIXX2(1))
      EQUIVALENCE(FRPAR(1),PUD)
      REAL      PUD,PBARY,SIGQT,PEND,XGEN,PSPIN1,PMIX1,PMIX2,XGENSS,
     +          PMIXX1(6),PMIXX2(6),FRPAR(32)
      COMMON/NODCAY/NODCAY,NOETA,NOPI0,NONUNU,NOEVOL,NOHADR,NOGRAV,
     $NOB,NOTAU
      LOGICAL NODCAY,NOETA,NOPI0,NONUNU,NOEVOL,NOHADR,NOGRAV,
     $NOB,NOTAU
      SAVE /NODCAY/
      COMMON/PRTOUT/NEVPRT,NJUMP
      SAVE /PRTOUT/
      INTEGER   NEVPRT,NJUMP
      COMMON/SEED/XSEED
      SAVE /SEED/
      CHARACTER*24 XSEED
      INTEGER MXTYPE
      PARAMETER (MXTYPE=8)
      COMMON/TYPES/LOC(100),NTYP,NJTTYP(MXTYPE),NWWTYP(2),NWMODE(3)
      COMMON/XTYPES/PARTYP(40),TITLE(10),JETYP(30,MXTYPE),WWTYP(30,2)
     $,WMODES(30,3)
      SAVE /TYPES/,/XTYPES/
      CHARACTER*8 JETYP,WWTYP,TITLE,PARTYP,WMODES
      INTEGER   LOC,NTYP,NJTTYP,NWWTYP,NWMODE
      INTEGER MXGOQ,MXGOJ
      PARAMETER (MXGOQ=85,MXGOJ=8)
      COMMON/Q1Q2/GOQ(MXGOQ,MXGOJ),GOALL(MXGOJ),GODY(4),STDDY,
     $GOWW(25,2),ALLWW(2),GOWMOD(25,MXGOJ)
      SAVE /Q1Q2/
      LOGICAL GOQ,GOALL,GODY,STDDY,GOWW,ALLWW,GOWMOD
C          Jet limits
      INTEGER MXLIM
      PARAMETER (MXLIM=8)
      INTEGER MXLX12
      PARAMETER (MXLX12=12*MXLIM)
      COMMON/JETLIM/PMIN(MXLIM),PMAX(MXLIM),PTMIN(MXLIM),PTMAX(MXLIM),
     $YJMIN(MXLIM),YJMAX(MXLIM),PHIMIN(MXLIM),PHIMAX(MXLIM),
     $XJMIN(MXLIM),XJMAX(MXLIM),THMIN(MXLIM),THMAX(MXLIM),
     $SETLMJ(12*MXLIM)
      SAVE /JETLIM/
      COMMON/FIXPAR/FIXP(MXLIM),FIXPT(MXLIM),FIXYJ(MXLIM),
     $FIXPHI(MXLIM),FIXXJ(MXLIM),FIXQM,FIXQT,FIXYW,FIXXW,FIXPHW
      SAVE /FIXPAR/
      COMMON/SGNPAR/CTHS(2,MXLIM),THS(2,MXLIM),YJS(2,MXLIM),XJS(2,MXLIM)  
      SAVE /SGNPAR/
      REAL      PMIN,PMAX,PTMIN,PTMAX,YJMIN,YJMAX,PHIMIN,PHIMAX,XJMIN,
     +          XJMAX,THMIN,THMAX,BLIMS(12*MXLIM),CTHS,THS,YJS,XJS
      LOGICAL SETLMJ
      LOGICAL FIXQM,FIXQT,FIXYW,FIXXW,FIXPHW
      LOGICAL FIXP,FIXPT,FIXYJ,FIXPHI,FIXXJ
      EQUIVALENCE(BLIMS(1),PMIN(1))
      COMMON/PRIMAR/NJET,SCM,HALFE,ECM,IDIN(2),NEVENT,NTRIES,NSIGMA,
     $WRTLHE
      SAVE /PRIMAR/
      INTEGER   NJET,IDIN,NEVENT,NTRIES,NSIGMA
      LOGICAL   WRTLHE
      REAL      SCM,HALFE,ECM
      COMMON/PTPAR/PTFUN1,PTFUN2,PTGEN1,PTGEN2,PTGEN3,SIGMAX
      SAVE /PTPAR/
      REAL      PTFUN1,PTFUN2,PTGEN1,PTGEN2,PTGEN3,SIGMAX
      COMMON/IDRUN/IDVER,IDG(2),IEVT,IEVGEN
      SAVE /IDRUN/
      INTEGER   IDVER,IDG,IEVT,IEVGEN
      COMMON/DYLIM/QMIN,QMAX,QTMIN,QTMAX,YWMIN,YWMAX,XWMIN,XWMAX,THWMIN,
     2  THWMAX,PHWMIN,PHWMAX
     3  ,SETLMQ(12)
      SAVE /DYLIM/
      LOGICAL SETLMQ
      EQUIVALENCE(BLIM1(1),QMIN)
      REAL      QMIN,QMAX,QTMIN,QTMAX,YWMIN,YWMAX,XWMIN,XWMAX,THWMIN,
     +          THWMAX,PHWMIN,PHWMAX,BLIM1(12)
      COMMON/HCON/ANWWWW(4,4,4),ADWWWW(2,4),AIWWWW(4)
     $,HMASS,HGAM,HGAMS(29),ETAHGG,MATCHH(29),ZSTARS(4,2)
     $,IHTYPE,HGAMSS(85,85)
      SAVE /HCON/
      DOUBLE PRECISION ANWWWW,ADWWWW,AIWWWW
      INTEGER   MATCHH,IHTYPE
      REAL      HMASS,HGAM,HGAMS,ETAHGG,ZSTARS,HGAMSS
      COMMON/ISLOOP/NEVOLV,NFRGMN,IEVOL,IFRG
      SAVE /ISLOOP/
      INTEGER NEVOLV,NFRGMN,IEVOL,IFRG
      COMMON/XMSSM/GOMSSM,GOSUG,GOGMSB,GOAMSB,AL3UNI,GOMMAM,GOHCAM
     $,XGLSS,XMUSS,XHASS,XTBSS
     $,XQ1SS,XDRSS,XURSS,XL1SS,XERSS
     $,XQ2SS,XSRSS,XCRSS,XL2SS,XMRSS
     $,XQ3SS,XBRSS,XTRSS,XL3SS,XTARSS,XATSS,XABSS,XATASS
     $,XM1SS,XM2SS,XM0SU,XMHSU,XA0SU,XTGBSU,XSMUSU
     $,XLAMGM,XMESGM,XN5GM,XCMGV,XMGVTO
     $,XRSLGM,XDHDGM,XDHUGM,XDYGM,XN51GM,XN52GM,XN53GM
     $,XMN3NR,XMAJNR,XANSS,XNRSS,XSBCS,
     $XCQAM,XCDAM,XCUAM,XCLAM,XCEAM,XCHDAM,XCHUAM,
     $XL1AM,XL2AM,XL3AM
      SAVE /XMSSM/
      REAL XGLSS,XMUSS,XHASS,XTBSS
     $,XQ1SS,XDRSS,XURSS,XL1SS,XERSS
     $,XQ2SS,XSRSS,XCRSS,XL2SS,XMRSS
     $,XQ3SS,XBRSS,XTRSS,XL3SS,XTARSS,XATSS,XABSS,XATASS
     $,XM1SS,XM2SS
     $,XM0SU,XMHSU,XA0SU,XTGBSU,XSMUSU
     $,XLAMGM,XMESGM,XN5GM,XCMGV,XMGVTO
     $,XRSLGM,XDHDGM,XDHUGM,XDYGM,XN51GM,XN52GM,XN53GM
     $,XMN3NR,XMAJNR,XANSS,XNRSS,XSBCS,
     $XCQAM,XCDAM,XCUAM,XCLAM,XCEAM,XCHDAM,XCHUAM,
     $XL1AM,XL2AM,XL3AM
      LOGICAL GOMSSM,GOSUG,GOGMSB,GOAMSB,AL3UNI,GOMMAM,GOHCAM
C          Parameters for RANLUX generator
C          Set by ALDATA and READIN but not by RESET
C          LUXSET=.TRUE. after RLUXGO has been called in PRTLIM
      INTEGER LUX
      PARAMETER (LUX=3)
      COMMON/LUXPAR/LUXINT,LUXK1,LUXK2,LUXGO
      INTEGER LUXINT,LUXK1,LUXK2
      LOGICAL LUXGO
C     XSUGIN contains the inputs to SUGRA:
C     XSUGIN(1) = M_0        XSUGIN(2) = M_(1/2)  XSUGIN(3) = A_0
C     XSUGIN(4) = tan(beta)  XSUGIN(5) = sgn(mu)  XSUGIN(6) = M_t
C     XSUGIN(7) = SUG BC scale
C     XGMIN(1) = LAM         XGMIN(2)  = M_MES    XGMIN(3)  = XN5
C     XGMIN(4) = tan(beta)   XGMIN(5)  = sgn(mu)  XGMIN(6) = M_t
C     XGMIN(7) = CGRAV       XGMIN(8)  =RSL       XGMIN(9)  = DEL_HD
C     XGMIN(10)  = DEL_HU    XGMIN(11) = DY       XGMIN(12) = N5_1
C     XGMIN(13)  = N5_2      XGMIN(14) = N5_3
C     XNRIN(1) = M_N3        XNRIN(2) = M_MAJ     XNRIN(3) = ANSS 
C     XNRIN(4) = M_N3SS
C     XISAIN contains the MSSMi inputs in natural order.
      COMMON /SUGXIN/ XISAIN(24),XSUGIN(7),XGMIN(14),XNRIN(4),
     $XAMIN(11)
      REAL XISAIN,XSUGIN,XGMIN,XNRIN,XAMIN
      SAVE /SUGXIN/
C          Frozen couplings from RG equations:
C     GSS( 1) = g_1        GSS( 2) = g_2        GSS( 3) = g_3
C     GSS( 4) = y_tau      GSS( 5) = y_b        GSS( 6) = y_t
C     GSS( 7) = M_1        GSS( 8) = M_2        GSS( 9) = M_3
C     GSS(10) = A_tau      GSS(11) = A_b        GSS(12) = A_t
C     GSS(13) = M_hd^2     GSS(14) = M_hu^2     GSS(15) = M_er^2
C     GSS(16) = M_el^2     GSS(17) = M_dnr^2    GSS(18) = M_upr^2
C     GSS(19) = M_upl^2    GSS(20) = M_taur^2   GSS(21) = M_taul^2
C     GSS(22) = M_btr^2    GSS(23) = M_tpr^2    GSS(24) = M_tpl^2
C     GSS(25) = mu         GSS(26) = B          GSS(27) = Y_N
C     GSS(28) = M_nr       GSS(29) = A_n        GSS(30) = vdq
C     GSS(31) = vuq
C          Masses:
C     MSS( 1) = glss     MSS( 2) = upl      MSS( 3) = upr
C     MSS( 4) = dnl      MSS( 5) = dnr      MSS( 6) = stl
C     MSS( 7) = str      MSS( 8) = chl      MSS( 9) = chr
C     MSS(10) = b1       MSS(11) = b2       MSS(12) = t1
C     MSS(13) = t2       MSS(14) = nuel     MSS(15) = numl
C     MSS(16) = nutl     MSS(17) = el-      MSS(18) = er-
C     MSS(19) = mul-     MSS(20) = mur-     MSS(21) = tau1
C     MSS(22) = tau2     MSS(23) = z1ss     MSS(24) = z2ss
C     MSS(25) = z3ss     MSS(26) = z4ss     MSS(27) = w1ss
C     MSS(28) = w2ss     MSS(29) = hl0      MSS(30) = hh0
C     MSS(31) = ha0      MSS(32) = h+
C          Unification:
C     MGUTSS  = M_GUT    GGUTSS  = g_GUT    AGUTSS  = alpha_GUT
      COMMON /SUGMG/ MSS(32),GSS(31),MGUTSS,GGUTSS,AGUTSS,FTGUT,
     $FBGUT,FTAGUT,FNGUT
      REAL MSS,GSS,MGUTSS,GGUTSS,AGUTSS,FTGUT,FBGUT,FTAGUT,FNGUT
      SAVE /SUGMG/
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
C     XNUSUG contains non-universal GUT scale soft terms for SUGRA:
C     XNUSUG(1)=M1 XNUSUG(2)=M2 XNUSUG(3)=M3
C     XNUSUG(4)=A_tau XNUSUG(5)=A_b XNUSUG(6)=A_t
C     XNUSUG(7)=m_Hd XNUSUG(8)=m_Hu XNUSUG(9)=m_eR XNUSUG(10)=m_eL
C     XNUSUG(11)=m_dR XNUSUG(12)=m_uR XNUSUG(13)=m_uL XNUSUG(14)=m_lR
C     XNUSUG(15)=m_lL XNUSUG(16)=m_bR XNUSUG(17)=m_tR XNUSUG(18)=m_tL
C     XNUSUG(19)=mu(Q) XNUSUG(20)=mA(Q)
      COMMON /SUGNU/ XNUSUG(20),INUHM
      REAL XNUSUG
      INTEGER INUHM
      SAVE /SUGNU/
C
      INTEGER I,J,II,K,NPRT,I1,I2,I3,J1,INDEX,IQ,KK,KKK,NN,N0J
      REAL AMASS
      CHARACTER*8 LSTRUC(10),LMODE(5),STUF(6),IDFMT(2)
      CHARACTER*8 WTITL(4)
      CHARACTER*8 LABEL,L0
      CHARACTER*8 BLANK
      CHARACTER*40 V,VISAJE
      REAL AM(6),AML(6)
      INTEGER NPRSS
      PARAMETER (NPRSS=32)
      INTEGER IDPRSS(NPRSS)
      REAL AMPRSS(NPRSS)
      CHARACTER*8 LPRSS(NPRSS)
      REAL ALEMI,AS,TANBQ,PI,MU,B,HIGFRZ
C
      DATA LSTRUC/'OWENS','BAIER','EICHTEN','DUKE','CTEQ2L','CTEQ3L',
     $'CTEQ5L','???','???','???'/
      DATA WTITL/'GM','W+','W-','Z0'/
      DATA BLANK/' '/
      DATA IDPRSS/21,22,23,24,25,26,41,42,43,44,45,46,
     $31,32,33,34,35,36,52,54,56,
     $29,30,40,50,60,39,49,82,83,84,86/
C
C          Print version
      PI=4.*ATAN(1.)
      V=VISAJE()
      WRITE(ITLIS,1000) V
1000  FORMAT('1',44('*')/' *',42X,'*'/
     C  ' * ',A40,' *'/
     C  ' *',42X,'*'/' ',44('*')/)
C
C          Print title, reaction, energy, number, run id
      WRITE(ITLIS,1010) TITLE
1010  FORMAT(/11X,10A8)
      WRITE(ITLIS,1020) NJET
1020  FORMAT(/2X,'NUMBER OF JETS TO BE GENERATED PER EVENT',I3)
      DO 100 I=1,2
        IDFMT(I)=LABEL(IDIN(I))
100   CONTINUE
      WRITE(ITLIS,1030) IDFMT(1),IDFMT(2),ECM
1030  FORMAT(/2X,A8,' ON ',A8,' AT COM ENERGY',E15.4)
      WRITE(ITLIS,1040) REAC,NEVENT
1040  FORMAT(/2X,'NUMBER OF ',A8,' EVENTS TO BE GENERATED',I10)
      IF(NEVPRT.GT.0) WRITE(ITLIS,1050) NEVPRT,NJUMP
1050  FORMAT(/2X,'PRINT A MAXIMUM OF ',I6,
     C  ' EVENTS SKIPPING ',I6,' EVENTS AT A TIME')
      WRITE(ITLIS,1060) IDG
1060  FORMAT(/2X,'RUN ID   ',2I10.6)
C
C          Print W/Higgs parameters
C
      IF(KEYS(3).OR.KEYS(7).OR.KEYS(11)) THEN
        IF(KEYS(3)) THEN
          II=0
          DO 200 I=1,4
            IF(.NOT.GODY(I)) GOTO 200
            II=II+1
            STUF(II)=WTITL(I)
200       CONTINUE
        ELSEIF(KEYS(11)) THEN
          II=1
          STUF(II)='GRAV'
        ELSE
          II=1
          STUF(II)='HIGGS'
          IF(IHTYPE.EQ.82) STUF(II)='HL0'
          IF(IHTYPE.EQ.83) STUF(II)='HH0'
          IF(IHTYPE.EQ.84) STUF(II)='HA0'
        ENDIF
        WRITE(ITLIS,2000) (STUF(K),K=1,II)
2000    FORMAT(//10X,'PARAMETERS FOR',4(2X,A8))
        WRITE(ITLIS,2010) QMIN,QMAX
2010    FORMAT(' MASS LIMITS',15X,2E15.4)
        WRITE(ITLIS,3020) QTMIN,QTMAX
        WRITE(ITLIS,3030) THWMIN,THWMAX
        WRITE(ITLIS,3040) PHWMIN,PHWMAX
        WRITE(ITLIS,3050) YWMIN,YWMAX
        WRITE(ITLIS,3060) XWMIN,XWMAX
        NPRT=0
        IF(FIXQT) THEN
          NPRT=NPRT+1
          STUF(NPRT)='QTW     '
        ENDIF
        IF(FIXQM) THEN
          NPRT=NPRT+1
          STUF(NPRT)='QMW     '
        ENDIF
        IF(FIXYW) THEN
          NPRT=NPRT+1
          STUF(NPRT)='YW      '
        ENDIF
        IF(FIXXW) THEN
          NPRT=NPRT+1
          STUF(NPRT)='XW      '
        ENDIF
        IF(FIXPHW) THEN
          NPRT=NPRT+1
          STUF(NPRT)='PHW     '
        ENDIF
        IF(NPRT.NE.0) WRITE(ITLIS,2070) (STUF(K),K=1,NPRT)
      ENDIF
C
C          Print jet parameters
C
      DO 300 I=1,6
300   STUF(I)=BLANK
      IF(KEYS(11)) THEN
        N0J=3
      ELSE
        N0J=1
      ENDIF
      DO 310 I=N0J,NJET
        NPRT=0
        WRITE(ITLIS,3000) I
3000    FORMAT(//10X,'JET NO.',I3,/)
        WRITE(ITLIS,3010) PMIN(I),PMAX(I)
3010    FORMAT(' MOMENTUM LIMITS',11X,2E15.4)
        WRITE(ITLIS,3020) PTMIN(I),PTMAX(I)
3020    FORMAT(' TRANSVERSE MOMENTUM LIMITS',2E15.4)
        WRITE(ITLIS,3030) THMIN(I),THMAX(I)
3030    FORMAT(' THETA LIMITS',14X,2E15.4)
        WRITE(ITLIS,3040) PHIMIN(I),PHIMAX(I)
3040    FORMAT(' PHI LIMITS',16X,2E15.4)
        WRITE(ITLIS,3050) YJMIN(I),YJMAX(I)
3050    FORMAT(' RAPIDITY (Y) LIMITS',7X,2E15.4)
        WRITE(ITLIS,3060) XJMIN(I),XJMAX(I)
3060    FORMAT(' FEYNMAN X LIMITS',10X,2E15.4)
        IF(.NOT.GOALL(I)) WRITE(ITLIS,3070) (JETYP(K,I),K=1,NJTTYP(I))
3070    FORMAT(' JET TYPE',23X,A8,1X,A8,1X,A8,1X,A8,1X,A8)
        IF((KEYS(6).OR.KEYS(7)).AND..NOT.ALLWW(I))
     $  WRITE(ITLIS,3080) (WWTYP(K,I),K=1,NWWTYP(I))
3080    FORMAT(' DECAY MODES',20X,A8,1X,A8,1X,A8,1X,A8,1X,A8)
        IF(FIXP(I)) THEN
          NPRT=NPRT+1
          STUF(NPRT)='P       '
        ENDIF
        IF(FIXPT(I)) THEN
          NPRT=NPRT+1
          STUF(NPRT)='PT      '
        ENDIF
        IF(FIXYJ(I)) THEN
          NPRT=NPRT+1
          STUF(NPRT)='TH      '
          NPRT=NPRT+1
          STUF(NPRT)='Y      '
        ENDIF
        IF(FIXPHI(I)) THEN
          NPRT=NPRT+1
          STUF(NPRT)='PHI     '
        ENDIF
        IF(FIXXJ(I)) THEN
          NPRT=NPRT+1
          STUF(NPRT)='X       '
        ENDIF
        IF(NPRT.EQ.0) GOTO 310
        WRITE(ITLIS,2070) (STUF(K),K=1,NPRT)
2070    FORMAT(/5X,'FOLLOWING PARAMETERS HAVE BEEN FIXED ',6A8)
310   CONTINUE
C
C          Print structure functions, QCD parameters, W parameters,
C          and other parameters changed from their default values.
C
      IF(KEYS(1).OR.KEYS(3).OR.KEYS(5).OR.KEYS(6).OR.KEYS(7)
     $.OR.KEYS(8).OR.KEYS(9).OR.KEYS(11).OR.KEYS(12)) THEN
        IF(ISTRUC.GT.0) THEN
          WRITE(ITLIS,4000) LSTRUC(ISTRUC)
4000      FORMAT(//1X,A8,' STRUCTURE FUNCTIONS')
        ELSEIF(ISTRUC.EQ.-999) THEN
          WRITE(ITLIS,4001)
4001      FORMAT(//1X,' PDFLIB STRUCTURE FUNCTIONS')
        ENDIF
      ENDIF
      WRITE(ITLIS,4010) ALAM,CUTJET
4010  FORMAT(//' QCD LAMBDA =',F10.4,10X,'JET CUTOFF MASS =',F10.3)
      WRITE(ITLIS,4020) AMLEP(6),AMLEP(7),AMLEP(8)
4020  FORMAT(/' HEAVY QUARK MASSES =',3F8.2)
      IF(LOC(36).NE.0) THEN
        CALL FLAVOR(80,I1,I2,I3,J1,INDEX)
        WRITE(ITLIS,4030) (AMLEP(INDEX+K),K=1,9)
4030    FORMAT(/' HIGGS MASSES =',6F8.2/15X,3F8.2)
      ENDIF
C
C          Supersymmetry
C
      IF(KEYS(5).AND..NOT.GOMSSM) THEN
        DO 410 IQ=1,6
          AM(IQ)=AMASS(20+IQ)
          AML(IQ)=AMASS(30+IQ)
410     CONTINUE
        WRITE(ITLIS,4040) (AM(KK),KK=1,6)
4040    FORMAT(//' SQUARK  MASSES ',7F9.2)
        WRITE(ITLIS,4050) (AML(KK),KK=1,6)
4050    FORMAT(' SLEPTON MASSES ',7F9.2)
        AM(1)=AMASS(29)
        AM(2)=AMASS(30)
        AM(3)=AMASS(39)
        AM(4)=AMASS(40)
        WRITE(ITLIS,4060) (AM(KK),KK=1,4)
4060    FORMAT(' GAUGINO MASSES (WITH SIGNS) ',7F9.2)
        IF(LOC(44).NE.0) WRITE(ITLIS,4070) XGENSS(9),
     $  (XGENSS(KK),KK=1,8) 
4070    FORMAT(/' FRAG. PARAM. XGENSS = ',9F8.3)
      ENDIF
C
C          MSSM model, including SUGRA, GMSB, AMSB
C
      IF(GOMSSM) THEN
C          Print masses
        DO 420 I=1,NPRSS
          LPRSS(I)=LABEL(IDPRSS(I))
          AMPRSS(I)=AMASS(IDPRSS(I))
420     CONTINUE
        WRITE(ITLIS,4100) (LPRSS(I),AMPRSS(I),I=1,NPRSS)
4100    FORMAT(/' MSSM MASSES (WITHOUT SIGNS):'/
     $  10(' M(',A5,') = ',F10.3,5X,'M(',A5,') = ',F10.3,
     $  5X,'M(',A5,') = ',F10.3/),
     $  ' M(',A5,') = ',F10.3,5X,'M(',A5,') = ',F10.3)
C
        IF(.NOT.(GOSUG.OR.GOGMSB.OR.GOAMSB)) THEN
C          If weak-scale MSSM, just print other inputs
          WRITE(ITLIS,4110) XTBSS,XMUSS,XATSS
4110      FORMAT(/' OTHER MSSM PARAMETERS:'/
     $    ' TAN(BETA) = ',F10.3,5X,'MU = ',F10.3,5X,'A_t = ',F10.3)
        ELSE
C          SUGRA, GMSB, or AMSB model
C          Printout copied from SUGPRT in ISASUGRA
          ALEMI=4*PI/GSS(2)**2/SIN2W
          AS=GSS(3)**2/4./PI
          TANBQ=VUQ/VDQ
          WRITE(ITLIS,4120) ALEMI,SIN2W,AS
4120      FORMAT(/' 1/ALPHAEM  =',F8.2,2X,
     $    '   SIN**2(THETAW) =',F7.4,1X,'   ALPHAS    =  ',F5.3)
          WRITE(ITLIS,4121) GSS(7),GSS(8),GSS(9)
4121      FORMAT(' M1         =',F8.2,2X,
     $    '   M2             =',F8.2,'   M3        =',F8.2)
          CALL GETPAS(MU,B,HIGFRZ)
          WRITE(ITLIS,4122) MU,B,HIGFRZ
4122      FORMAT(' MU(Q)      =',F8.2,2X,
     $    '   B(Q)           =',F8.2,'   Q         =',F8.2)
          WRITE(ITLIS,4123) GSS(13),GSS(14),TANBQ
4123      FORMAT(' M**2(H1)   =',E10.3,'   M**2(H2)       =',E10.3,
     $    ' TANBQ     =   ',F6.3)
C
          WRITE(ITLIS,4130) THETAT,THETAB,THETAL,ALFAH
4130       FORMAT(/,' theta_t=',F9.4,'   theta_b=',F9.4,
     $     '   theta_l=',F9.4,'   alpha_h=',F9.4)
C
          WRITE(ITLIS,4140) AMZ1SS,AMZ2SS,AMZ3SS,AMZ4SS
4140      FORMAT(/' NEUTRALINO MASSES (SIGNED) =',4F10.3)
          DO 4150 J=1,4
            WRITE(ITLIS,4151) J,(ZMIXSS(K,J),K=1,4)
4151        FORMAT(' EIGENVECTOR ',I1,'       =',4F10.5)
4150      CONTINUE
          WRITE(ITLIS,4160) AMW1SS,AMW2SS
4160      FORMAT(/' CHARGINO MASSES (SIGNED)  =',2F10.3)
          WRITE(ITLIS,4161) GAMMAL,GAMMAR
4161      FORMAT(' GAMMAL, GAMMAR             =',2F10.5/)
        ENDIF
      ENDIF
C
C          Other parameters
C
      IF(LOC(30).NE.0) WRITE(ITLIS,4200) XGEN
4200  FORMAT(/' FRAGMENTATION PARAMETER XGEN =',6F8.3)
      IF(LOC(31).NE.0) WRITE(ITLIS,4210) SIGQT
4210  FORMAT(/' FRAGMENTATION PARAMETER SIGQT =',F8.3)
      IF(KEYS(2).OR.KEYS(3).OR.KEYS(6).OR.KEYS(7)) THEN
        WRITE(ITLIS,4220) SIN2W,WMASS(2),WMASS(4),WGAM(2),WGAM(4)
4220    FORMAT(//' WEINBERG MODEL',5X,'SIN**2(THETA-W)=',F8.4/
     $  ' MASSES = ',F8.2,',',F8.2,'   WIDTHS = ',F8.3,',',F8.3)
      ENDIF
      IF(KEYS(3)) THEN
        IF(.NOT.STDDY) WRITE(ITLIS,4230) CUTOFF,CUTPOW
4230    FORMAT(/' CUTOFF FUNCTION IS QT**2=',E11.4,'*Q**',E11.4)
        IF(LOC(50).NE.0) WRITE(ITLIS,4240) WFUDGE
4240    FORMAT(/' W fudge factor (WFUDGE) = ',F8.3)
      ENDIF
      IF(KEYS(7)) THEN
        WRITE(ITLIS,4250) HMASS,HGAM
4250    FORMAT(/' HIGGS MASS = ',F8.2,'  WIDTH = ',F8.3)
      ENDIF
      WRITE(ITLIS,4260) LUX
4260  FORMAT(/' RANDOM NUMBER GENERATOR IS RANLUX, LUX=',I5)
      IF(LUXGO) CALL RLUXGO(LUX,LUXINT,LUXK1,LUXK2)
      LUXGO=.FALSE.
      IF(LOC(13).NE.0) WRITE(ITLIS,4270) FRPAR
4270  FORMAT(//'  FRAGMENTATION PARAMETERS ',8E11.3,2(/,26X,8E11.3))
      IF(LOC(34).NE.0) WRITE(ITLIS,4280) MNPOM,MXPOM
4280  FORMAT(//'  NUMBER OF POMERONS =',I4,' TO',I4)
C
C          Print KKG parameters
      IF(KEYS(11)) THEN
        WRITE(ITLIS,4291) NEXTRAD
        WRITE(ITLIS,4292) MASSD
        WRITE(ITLIS,4296) SURFD
        WRITE(ITLIS,4295) KKGSD
        WRITE(ITLIS,4297) UVCUT
4291    FORMAT(//' NB EXTRA-DIMENSIONS',7X,I4)
4292    FORMAT(' SCALE M_D',15X,E15.4)
4295    FORMAT(' KKGSD FACTOR',12X,E15.4)
4296    FORMAT(' SD SURFACE',14X,E15.4)
4297    FORMAT(' UV CUTOFF',17X,L4)
      ENDIF
C
C          Decay switches
C
      IF(LOC(46).NE.0) THEN
        WRITE(ITLIS,4300)
4300    FORMAT(//'  SECONDARY W DECAY MODES:')
        NN=MAX0(NWMODE(1),1)
        WRITE(ITLIS,4310) (WMODES(KKK,1),KKK=1,NN)
4310    FORMAT('  W+ --> '
     $  ,A8,1X,A8,1X,A8,1X,A8,1X,A8,1X,A8,1X,A8,1X,A8)
        NN=MAX0(NWMODE(2),1)
        WRITE(ITLIS,4320) (WMODES(KKK,2),KKK=1,NN)
4320    FORMAT('  W- --> '
     $  ,A8,1X,A8,1X,A8,1X,A8,1X,A8,1X,A8,1X,A8,1X,A8)
        WRITE(ITLIS,4330) (WMODES(KKK,3),KKK=1,NN)
4330    FORMAT('  Z0 --> '
     $  ,A8,1X,A8,1X,A8,1X,A8,1X,A8,1X,A8,1X,A8,1X,A8)
      ENDIF
C
      IF(NODCAY) WRITE(ITLIS,4400)
4400  FORMAT(//'  NO DECAYS OF HADRONS WILL BE GENERATED')
      IF(NOETA) WRITE(ITLIS,4410)
4410  FORMAT(//'  NO DECAYS OF ETAS WILL BE GENERATED')
      IF(NOPI0) WRITE(ITLIS,4420)
4420  FORMAT(//'  NO DECAYS OF PI0S WILL BE GENERATED')
      IF(NONUNU) WRITE(ITLIS,4430)
4430  FORMAT(//'  NO DECAYS Z0---->NU+NU WILL BE GENERATED')
      IF(NOEVOL) WRITE(ITLIS,4440)
4440  FORMAT(//'  NO QCD JET EVOLUTION WILL BE DONE')
      IF(NOHADR) WRITE(ITLIS,4450)
4450  FORMAT(//'  NO JET HADRONIZATION WILL BE DONE')
      IF(GOGMSB.AND.NOGRAV) WRITE(ITLIS,4460)
4460  FORMAT(//'  NO GRAVITINO DECAYS WILL BE GENERATED')
C
C          Print forced decay modes and M.E. flag
C
      IF(NFORCE.NE.0) THEN
        WRITE(ITLIS,4500)
4500    FORMAT(//7X,'FORCED DECAY MODES (MATRIX ELEMENT FLAGS)'/
     $  2X,'PART',6X,'DECAY MODE')
        DO 450 I=1,NFORCE
          IF(IFORCE(I).EQ.0) GOTO 450
          L0=LABEL(IFORCE(I))
          DO 451 K=1,5
            LMODE(K)=BLANK
            IF(MFORCE(K,I).EQ.0) GO TO 451
            LMODE(K)=LABEL(MFORCE(K,I))
451       CONTINUE
          WRITE(ITLIS,4510) L0,(LMODE(K),K=1,5),MEFORC(I)
4510      FORMAT(2X,6A10,'(M.E. =',I5,')')
450     CONTINUE
      ENDIF
C
C          Print multiple evolution/fragmentation information
C
      IF(NEVOLV.NE.1.OR.NFRGMN.NE.1) THEN
        WRITE(ITLIS,4600) NEVOLV,NFRGMN
4600    FORMAT(//,
     $  '  MULTIPLE EVOLUTION AND FRAGMENTATION VERSION'/
     $  '  EVENTS WILL BE EVOLVED',I6,' TIMES'/
     $  '  AND FRAGMENTED        ',I6,' TIMES'/)
      ENDIF
C
      RETURN
      END

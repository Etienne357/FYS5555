CDECK  ID>, WWKIN.
      SUBROUTINE WWKIN(AM1,AM2)
C          WPAIR KINEMATICS, INCLUDING DOUBLE PRECISION CONVERSION FOR
C          32-BIT MACHINES. CONVENTION IS THAT SINGLE PRECISION MASSES
C          AM1,AM2 ARE EXACT.
      COMMON/ITAPES/ITDKY,ITEVT,ITCOM,ITLIS
      SAVE /ITAPES/
      INTEGER   ITDKY,ITEVT,ITCOM,ITLIS
      COMMON/WWPAR/SWW,TWW,UWW,WM2,ZM2,P1WW(5),P2WW(5),P3WW(5),P4WW(5)
     $,PZERO(4,4),S13,P3(5),Q1(5),Q3(5),JQWW(2)
     $,CQ,CV,CA,CV1,CA1,CV3,CA3,CS,CT,CU
      SAVE /WWPAR/
      DOUBLE PRECISION SWW,TWW,UWW,WM2,ZM2,P1WW,P2WW,P3WW,P4WW
     $,PZERO,S13,P3,Q1,Q3
     $,CQ,CV,CA,CV1,CA1,CV3,CA3,CS,CT,CU
      INTEGER   JQWW
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
C          BASIC KINEMATICS FROM TWOKIN
      CALL TWOKIN(0.,0.,AM1,AM2)
C          WPAIR KINEMATICS -- JUST A COPY FOR CDC BUT CONSTRUCTS A
C          CONSISTENT SET OF DOUBLE PRECISION VARIABLES FOR 32-BIT
C          MACHINES.
      P3WW(1)=PT(1)*COS(PHI(1))
      P3WW(2)=PT(1)*SIN(PHI(1))
      P3WW(3)=P(1)*CTH(1)
      P3WW(5)=AM1
      P4WW(1)=-P3WW(1)
      P4WW(2)=-P3WW(2)
      P4WW(3)=P(2)*CTH(2)
      P4WW(5)=AM2
      P3WW(4)=DSQRT(P3WW(1)**2+P3WW(2)**2+P3WW(3)**2+P3WW(5)**2)
      P4WW(4)=DSQRT(P4WW(1)**2+P4WW(2)**2+P4WW(3)**2+P4WW(5)**2)
      P1WW(1)=0.
      P1WW(2)=0.
      P1WW(4)=.5*(P3WW(4)+P3WW(3)+P4WW(4)+P4WW(3))
      P1WW(3)=P1WW(4)
      P2WW(1)=0.
      P2WW(2)=0.
      P2WW(4)=.5*(P3WW(4)-P3WW(3)+P4WW(4)-P4WW(3))
      P2WW(3)=-P2WW(4)
C          INVARIANTS
      SWW=+2.*(P1WW(4)*P2WW(4)-P1WW(3)*P2WW(3))
      TWW=-2.*(P1WW(4)*P3WW(4)-P1WW(3)*P3WW(3))+P3WW(5)**2
      UWW=-2.*(P2WW(4)*P3WW(4)-P2WW(3)*P3WW(3))+P3WW(5)**2
      RETURN
      END

* se_HHHH.F
* generated 30-May-2012 11:49
* this file is part of FeynHiggs
* please do not edit directly

#include "externals.h"
#include "types.h"


	ComplexType function se_HHHH(k2,bX)
	implicit none
	integer bX
	RealType k2

#include "FH.h"
#include "looptools.h"

	integer Cha3, Cha4, Gen3, Neu3, Neu4, Sfe3, Sfe4

	ComplexType dup1, dup10, dup11, dup12, dup13, dup14, dup15
	ComplexType dup16, dup17, dup18, dup19, dup2, dup20, dup21
	ComplexType dup22, dup23, dup24, dup3, dup4, dup5, dup6
	ComplexType dup7, dup8, dup9, tmp1, tmp2

	se_HHHH = 0

	LOOP(Gen3, gM,3,1)

        se_HHHH = se_HHHH - 
     &    3/(4.D0*Pi)*(Alfa1L*SA2*Mf2(tM,Gen3)*
     &        (A0(Mf2(tM,Gen3)) + 
     &          k2*B1(k2,Mf2(tM,Gen3),Mf2(tM,Gen3)) + 
     &          2*B0(k2,Mf2(tM,Gen3),Mf2(tM,Gen3))*Mf2(tM,Gen3)))/
     &      (MW2*SB2*SW2)

	ENDLOOP(Gen3)

	LOOP(Gen3, gM,3,1)
	LOOP(Sfe3, 1,2,1)

        se_HHHH = se_HHHH + 
     &    1/(16.D0*Pi)*(Alfa1L*A0(MSf2(Sfe3,tM,Gen3))*
     &        ((C2A*MW2*SB2*(3 - 4*SW2) + 6*CW2*SA2*Mf2(tM,Gen3))*
     &           USf2(Sfe3,1,tM,Gen3) + 
     &          2*(2*C2A*MW2*SB2*SW2 + 3*CW2*SA2*Mf2(tM,Gen3))*
     &           USf2(Sfe3,2,tM,Gen3)))/(CW2*MW2*SB2*SW2)

	ENDLOOP(Sfe3)
	ENDLOOP(Gen3)

	LOOP(Gen3, gM,3,1)
	LOOP(Sfe4, 1,2,1)
	LOOP(Sfe3, 1,2,1)

	dup1 = SA*KfC(Gen3,Gen3,tM) - CA*MUE*Mf(tM,Gen3)

	dup2 = SA*Kf(Gen3,Gen3,tM) - CA*MUEC*Mf(tM,Gen3)

	dup3 = 2*CAB*MW*MZ*SB*SW2 + 3*CW*SA*Mf2(tM,Gen3)

	dup4 = CAB*MW*MZ*SB*(3 - 4*SW2) + 6*CW*SA*Mf2(tM,Gen3)

        se_HHHH = se_HHHH + 
     &    1/(48.D0*Pi)*(Alfa1L*
     &        B0(k2,MSf2(Sfe3,tM,Gen3),MSf2(Sfe4,tM,Gen3))*
     &        (USf(Sfe4,1,tM,Gen3)*
     &           (dup4*USfC(Sfe3,1,tM,Gen3) + 
     &             3*CW*dup1*USfC(Sfe3,2,tM,Gen3)) + 
     &          USf(Sfe4,2,tM,Gen3)*
     &           (3*CW*dup2*USfC(Sfe3,1,tM,Gen3) + 
     &             2*dup3*USfC(Sfe3,2,tM,Gen3)))*
     &        (USf(Sfe3,1,tM,Gen3)*
     &           (dup4*USfC(Sfe4,1,tM,Gen3) + 
     &             3*CW*dup1*USfC(Sfe4,2,tM,Gen3)) + 
     &          USf(Sfe3,2,tM,Gen3)*
     &           (3*CW*dup2*USfC(Sfe4,1,tM,Gen3) + 
     &             2*dup3*USfC(Sfe4,2,tM,Gen3))))/(CW2*MW2*SB2*SW2)

	ENDLOOP(Sfe3)
	ENDLOOP(Sfe4)
	ENDLOOP(Gen3)

#ifdef DETAILED_DEBUG
	DHIGGS "se_HHHH =", se_HHHH ENDL
#endif

	if( mssmpart .eq. 1 ) return

	LOOP(Gen3, gM,3,1)

        se_HHHH = se_HHHH - 
     &    3/(4.D0*Pi)*(Alfa1L*CA2*Mf2(bX,Gen3)*
     &        (A0(Mf2(bX,Gen3)) + 
     &          k2*B1(k2,Mf2(bX,Gen3),Mf2(bX,Gen3)) + 
     &          2*B0(k2,Mf2(bX,Gen3),Mf2(bX,Gen3))*Mf2(bX,Gen3)))/
     &      (CB2*MW2*SW2)

	ENDLOOP(Gen3)

	LOOP(Gen3, gM,3,1)
	LOOP(Sfe3, 1,2,1)

        se_HHHH = se_HHHH + 
     &    1/(16.D0*Pi)*(Alfa1L*A0(MSf2(Sfe3,bX,Gen3))*
     &        ((C2A*CB2*MW2*(-3 + 2*SW2) + 6*CA2*CW2*Mf2(bX,Gen3))*
     &           USf2(Sfe3,1,bX,Gen3) - 
     &          2*(C2A*CB2*MW2*SW2 - 3*CA2*CW2*Mf2(bX,Gen3))*
     &           USf2(Sfe3,2,bX,Gen3)))/(CB2*CW2*MW2*SW2)

	ENDLOOP(Sfe3)
	ENDLOOP(Gen3)

	LOOP(Gen3, gM,3,1)
	LOOP(Sfe4, 1,2,1)
	LOOP(Sfe3, 1,2,1)

	dup5 = CA*KfC(Gen3,Gen3,bX) - MUE*SA*Mf(bX,Gen3)

	dup6 = CA*Kf(Gen3,Gen3,bX) - MUEC*SA*Mf(bX,Gen3)

	dup7 = CAB*CB*MW*MZ*SW2 - 3*CA*CW*Mf2(bX,Gen3)

	dup8 = CAB*CB*MW*MZ*(-3 + 2*SW2) + 6*CA*CW*Mf2(bX,Gen3)

        se_HHHH = se_HHHH + 
     &    1/(48.D0*Pi)*(Alfa1L*
     &        B0(k2,MSf2(Sfe3,bX,Gen3),MSf2(Sfe4,bX,Gen3))*
     &        (USf(Sfe4,1,bX,Gen3)*
     &           (dup8*USfC(Sfe3,1,bX,Gen3) + 
     &             3*CW*dup5*USfC(Sfe3,2,bX,Gen3)) + 
     &          USf(Sfe4,2,bX,Gen3)*
     &           (3*CW*dup6*USfC(Sfe3,1,bX,Gen3) - 
     &             2*dup7*USfC(Sfe3,2,bX,Gen3)))*
     &        (USf(Sfe3,1,bX,Gen3)*
     &           (dup8*USfC(Sfe4,1,bX,Gen3) + 
     &             3*CW*dup5*USfC(Sfe4,2,bX,Gen3)) + 
     &          USf(Sfe3,2,bX,Gen3)*
     &           (3*CW*dup6*USfC(Sfe4,1,bX,Gen3) - 
     &             2*dup7*USfC(Sfe4,2,bX,Gen3))))/(CB2*CW2*MW2*SW2)

	ENDLOOP(Sfe3)
	ENDLOOP(Sfe4)
	ENDLOOP(Gen3)

#ifdef DETAILED_DEBUG
	DHIGGS "se_HHHH =", se_HHHH ENDL
#endif

	if( mssmpart .eq. 2 ) return

	LOOP(Gen3, 1,3,1)

        se_HHHH = se_HHHH + 
     &    1/(16.D0*Pi)*(Alfa1L*
     &        (CB2*MW2*(C2A*A0(MSf2(1,1,Gen3)) + 
     &             CAB**2*MZ2*B0(k2,MSf2(1,1,Gen3),MSf2(1,1,Gen3)))
     &            - 4*CA2*CW2*Mf2(2,Gen3)*
     &           (A0(Mf2(2,Gen3)) + 
     &             k2*B1(k2,Mf2(2,Gen3),Mf2(2,Gen3)) + 
     &             2*B0(k2,Mf2(2,Gen3),Mf2(2,Gen3))*Mf2(2,Gen3))))/
     &      (CB2*CW2*MW2*SW2)

	ENDLOOP(Gen3)

	LOOP(Sfe3, 1,2,1)
	LOOP(Gen3, 1,3,1)

        se_HHHH = se_HHHH + 
     &    1/(16.D0*Pi)*(Alfa1L*A0(MSf2(Sfe3,2,Gen3))*
     &        ((C2A*CB2*MW2*(-1 + 2*SW2) + 2*CA2*CW2*Mf2(2,Gen3))*
     &           USf2(Sfe3,1,2,Gen3) + 
     &          2*(-(C2A*CB2*MW2*SW2) + CA2*CW2*Mf2(2,Gen3))*
     &           USf2(Sfe3,2,2,Gen3)))/(CB2*CW2*MW2*SW2)

	ENDLOOP(Gen3)
	ENDLOOP(Sfe3)

	LOOP(Sfe4, 1,2,1)
	LOOP(Sfe3, 1,2,1)
	LOOP(Gen3, 1,3,1)

	dup9 = CA*KfC(Gen3,Gen3,2) - MUE*SA*Mf(2,Gen3)

	dup10 = CA*Kf(Gen3,Gen3,2) - MUEC*SA*Mf(2,Gen3)

	dup11 = -(CAB*CB*MW*MZ*SW2) + CA*CW*Mf2(2,Gen3)

	dup12 = CAB*CB*MW*MZ*(-1 + 2*SW2) + 2*CA*CW*Mf2(2,Gen3)

        se_HHHH = se_HHHH + 
     &    1/(16.D0*Pi)*(Alfa1L*
     &        B0(k2,MSf2(Sfe3,2,Gen3),MSf2(Sfe4,2,Gen3))*
     &        (USf(Sfe4,2,2,Gen3)*
     &           (CW*dup10*USfC(Sfe3,1,2,Gen3) + 
     &             2*dup11*USfC(Sfe3,2,2,Gen3)) + 
     &          USf(Sfe4,1,2,Gen3)*
     &           (dup12*USfC(Sfe3,1,2,Gen3) + 
     &             CW*dup9*USfC(Sfe3,2,2,Gen3)))*
     &        (USf(Sfe3,2,2,Gen3)*
     &           (CW*dup10*USfC(Sfe4,1,2,Gen3) + 
     &             2*dup11*USfC(Sfe4,2,2,Gen3)) + 
     &          USf(Sfe3,1,2,Gen3)*
     &           (dup12*USfC(Sfe4,1,2,Gen3) + 
     &             CW*dup9*USfC(Sfe4,2,2,Gen3))))/(CB2*CW2*MW2*SW2)

	ENDLOOP(Gen3)
	ENDLOOP(Sfe3)
	ENDLOOP(Sfe4)

#ifdef DETAILED_DEBUG
	DHIGGS "se_HHHH =", se_HHHH ENDL
#endif

	if( mssmpart .eq. 3 ) return

        se_HHHH = se_HHHH + 
     &    1/(32.D0*Pi)*(Alfa1L*
     &        (MW2*((C2A*CAB - 2*S2A*SAB)**2*B0(k2,Mh02,Mh02) + 
     &             CAB**2*(C2B**2*B0(k2,MA02,MA02) + 
     &                9*C2A**2*B0(k2,MHH2,MHH2)) + 
     &             2*((2*CAB*S2A + C2A*SAB)**2*B0(k2,Mh02,MHH2) + 
     &                (4*CBA2*CW2**2 + 
     &                   C2B*(C2B*CAB**2 - 4*CAB*CBA*CW2))*
     &                 B0(k2,MHp2,MHp2))) + 
     &          4*(CAB*(CAB*MW2*S2B**2 - 2*CW2*MW2*S2B*SBA) + 
     &             CW2**2*(-(k2*SBA2) - MHp2*SBA2 + MW2*SBA2))*
     &           B0(k2,MHp2,MW2) + 
     &          2*((CAB**2*MW2*S2B**2 + 
     &                CW2*(-(k2*SBA2) - MA02*SBA2))*B0(k2,MA02,MZ2)
     &               + (C2B**2*CAB**2*MW2 + 
     &                CBA2*CW2**2*(-2*k2 + 12*MW2))*B0(k2,MW2,MW2))
     &            + (C2B**2*CAB**2*MW2 - 
     &             2*CBA2*(-7*MW2 + CW2*(k2 + MZ2)))*B0(k2,MZ2,MZ2)
     &            + CW2*(-(C2A*C2B*A0(MA02)) + 
     &             (-1 + 3*S2A**2)*A0(Mh02) + 3*C2A**2*A0(MHH2) + 
     &             2*((CW2*(1 + S2A*S2B) - C2A*C2B*SW2)*A0(MHp2) + 
     &                (CW2*(7 - S2A*S2B) + C2A*C2B*SW2)*A0(MW2)) + 
     &             (6 + C2A*C2B)*A0(MZ2) + 
     &             4*k2*(SBA2*
     &                 (B1(k2,MA02,MZ2) + 2*CW2*B1(k2,MHp2,MW2)) + 
     &                CBA2*(2*CW2*B1(k2,MW2,MW2) + B1(k2,MZ2,MZ2)))
     &             )))/(CW2**2*SW2)

	LOOP(Cha4, 1,2,1)

	tmp1 = A0(MCha2(Cha4))

	LOOP(Cha3, 1,2,1)

        dup13 = CA*UCha(Cha4,2)*VCha(Cha3,1) + 
     &    SA*UCha(Cha4,1)*VCha(Cha3,2)

        dup14 = CA*UCha(Cha3,2)*VCha(Cha4,1) + 
     &    SA*UCha(Cha3,1)*VCha(Cha4,2)

        dup15 = CA*UChaC(Cha4,2)*VChaC(Cha3,1) + 
     &    SA*UChaC(Cha4,1)*VChaC(Cha3,2)

        dup16 = CA*UChaC(Cha3,2)*VChaC(Cha4,1) + 
     &    SA*UChaC(Cha3,1)*VChaC(Cha4,2)

        se_HHHH = se_HHHH - 
     &    1/(4.D0*Pi)*(Alfa1L*
     &        ((dup13*dup15 + dup14*dup16)*
     &           (tmp1 + k2*B1(k2,MCha2(Cha3),MCha2(Cha4))) + 
     &          B0(k2,MCha2(Cha3),MCha2(Cha4))*
     &           (dup15*dup16*MCha(Cha3)*MCha(Cha4) + 
     &             dup14*dup16*MCha2(Cha3) + 
     &             dup13*(dup14*MCha(Cha3)*MCha(Cha4) + 
     &                dup15*MCha2(Cha3)))))/SW2

	ENDLOOP(Cha3)

	ENDLOOP(Cha4)

	LOOP(Neu4, 1,4,1)

	tmp2 = A0(MNeu2(Neu4))

	LOOP(Neu3, 1,4,1)

	dup17 = SW*ZNeu(Neu3,1) - CW*ZNeu(Neu3,2)

	dup18 = SW*ZNeu(Neu4,1) - CW*ZNeu(Neu4,2)

	dup19 = -(SW*ZNeu(Neu4,1)) + CW*ZNeu(Neu4,2)

	dup20 = CA*ZNeu(Neu4,3) - SA*ZNeu(Neu4,4)

	dup21 = SW*ZNeuC(Neu3,1) - CW*ZNeuC(Neu3,2)

	dup22 = SW*ZNeuC(Neu4,1) - CW*ZNeuC(Neu4,2)

	dup23 = -(SW*ZNeuC(Neu4,1)) + CW*ZNeuC(Neu4,2)

	dup24 = CA*ZNeuC(Neu4,3) - SA*ZNeuC(Neu4,4)

        se_HHHH = se_HHHH + 
     &    1/(16.D0*Pi)*(Alfa1L*
     &        (-2*(tmp2 + k2*B1(k2,MNeu2(Neu3),MNeu2(Neu4)))*
     &           (dup17*dup20 + CA*dup18*ZNeu(Neu3,3) + 
     &             dup19*SA*ZNeu(Neu3,4))*
     &           (dup21*dup24 + CA*dup22*ZNeuC(Neu3,3) + 
     &             dup23*SA*ZNeuC(Neu3,4)) + 
     &          B0(k2,MNeu2(Neu3),MNeu2(Neu4))*
     &           (-2*MNeu2(Neu3)*
     &              (dup17*dup20 + CA*dup18*ZNeu(Neu3,3) + 
     &                dup19*SA*ZNeu(Neu3,4))*
     &              (dup21*dup24 + CA*dup22*ZNeuC(Neu3,3) + 
     &                dup23*SA*ZNeuC(Neu3,4)) - 
     &             MNeu(Neu3)*MNeu(Neu4)*
     &              ((dup17*dup20 + CA*dup18*ZNeu(Neu3,3) + 
     &                   dup19*SA*ZNeu(Neu3,4))**2 + 
     &                (dup21*dup24 + CA*dup22*ZNeuC(Neu3,3) + 
     &                   dup23*SA*ZNeuC(Neu3,4))**2))))/(CW2*SW2)

	ENDLOOP(Neu3)

	ENDLOOP(Neu4)

#ifdef DETAILED_DEBUG
	DHIGGS "se_HHHH =", se_HHHH ENDL
#endif

	end


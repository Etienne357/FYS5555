* se_h0G0.F
* generated 30-May-2012 12:11
* this file is part of FeynHiggs
* please do not edit directly

#include "externals.h"
#include "types.h"


	ComplexType function se_h0G0(k2,bX)
	implicit none
	integer bX
	RealType k2

#include "FH.h"
#include "looptools.h"

	integer All3, All4, Cha3, Cha4, Gen3, Ind1, Ind2, Ind3, Ind4
	integer Neu3, Neu4, Sfe3, Sfe4

	ComplexType dup1, dup10, dup11, dup12, dup13, dup14, dup15
	ComplexType dup16, dup17, dup18, dup2, dup3, dup4, dup5
	ComplexType dup6, dup7, dup8, dup9, tmp1, tmp2, tmp3, tmp4

	se_h0G0 = 0

	LOOP(All4, 1,6,gM)
	LOOP(All3, 1,6,gM)

	tmp1 = B0(k2,MASf2(All3,tM),MASf2(All4,tM))

	LOOP(Ind4, 1,3,1)
	LOOP(Ind3, 1,3,1)
	LOOP(Ind2, 1,3,1)
	LOOP(Ind1, 1,3,1)

        se_h0G0 = se_h0G0 + 
     &    cI/(16.D0*Pi)*(Alfa1L*tmp1*
     &        ((Delta(Ind3,Ind4)*
     &              (MW*MZ*SAB*SB*(-3 + 4*SW2) + 
     &                6*CA*CW*Mf2(tM,Ind3))*UASf(All4,Ind4,tM) + 
     &             3*CW*(CA*Kf(Ind3,Ind4,tM) + 
     &                MUEC*SA*Delta(Ind3,Ind4)*Mf(tM,Ind3))*
     &              UASf(All4,3 + Ind4,tM))*UASfC(All3,Ind3,tM) + 
     &          (3*CW*(CA*KfC(Ind4,Ind3,tM) + 
     &                MUE*SA*Delta(Ind3,Ind4)*Mf(tM,Ind3))*
     &              UASf(All4,Ind4,tM) + 
     &             2*Delta(Ind3,Ind4)*
     &              (-2*MW*MZ*SAB*SB*SW2 + 3*CA*CW*Mf2(tM,Ind3))*
     &              UASf(All4,3 + Ind4,tM))*UASfC(All3,3 + Ind3,tM)
     &          )*((TB*Kf(Ind1,Ind2,tM) - 
     &             MUEC*Delta(Ind1,Ind2)*Mf(tM,Ind1))*
     &           UASf(All3,3 + Ind2,tM)*UASfC(All4,Ind1,tM) + 
     &          (-(TB*KfC(Ind2,Ind1,tM)) + 
     &             MUE*Delta(Ind1,Ind2)*Mf(tM,Ind1))*
     &           UASf(All3,Ind2,tM)*UASfC(All4,3 + Ind1,tM)))/
     &      (CW*MW2*SB*SW2*TB)

	ENDLOOP(Ind1)
	ENDLOOP(Ind2)
	ENDLOOP(Ind3)
	ENDLOOP(Ind4)

	ENDLOOP(All3)
	ENDLOOP(All4)

#ifdef DETAILED_DEBUG
	DHIGGS "se_h0G0 =", se_h0G0 ENDL
#endif

	if( mssmpart .eq. 1 ) return

	LOOP(All4, 1,6,gM)
	LOOP(All3, 1,6,gM)

	tmp2 = B0(k2,MASf2(All3,bX),MASf2(All4,bX))

	LOOP(Ind4, 1,3,1)
	LOOP(Ind3, 1,3,1)
	LOOP(Ind2, 1,3,1)
	LOOP(Ind1, 1,3,1)

        se_h0G0 = se_h0G0 - 
     &    cI/(16.D0*Pi)*(Alfa1L*tmp2*
     &        ((Delta(Ind3,Ind4)*
     &              (CB*MW*MZ*SAB*(-3 + 2*SW2) + 
     &                6*CW*SA*Mf2(bX,Ind3))*UASf(All4,Ind4,bX) + 
     &             3*CW*(SA*Kf(Ind3,Ind4,bX) + 
     &                CA*MUEC*Delta(Ind3,Ind4)*Mf(bX,Ind3))*
     &              UASf(All4,3 + Ind4,bX))*UASfC(All3,Ind3,bX) + 
     &          (3*CW*(SA*KfC(Ind4,Ind3,bX) + 
     &                CA*MUE*Delta(Ind3,Ind4)*Mf(bX,Ind3))*
     &              UASf(All4,Ind4,bX) - 
     &             2*Delta(Ind3,Ind4)*
     &              (CB*MW*MZ*SAB*SW2 - 3*CW*SA*Mf2(bX,Ind3))*
     &              UASf(All4,3 + Ind4,bX))*UASfC(All3,3 + Ind3,bX)
     &          )*((-Kf(Ind1,Ind2,bX) + 
     &             MUEC*TB*Delta(Ind1,Ind2)*Mf(bX,Ind1))*
     &           UASf(All3,3 + Ind2,bX)*UASfC(All4,Ind1,bX) + 
     &          (KfC(Ind2,Ind1,bX) - 
     &             MUE*TB*Delta(Ind1,Ind2)*Mf(bX,Ind1))*
     &           UASf(All3,Ind2,bX)*UASfC(All4,3 + Ind1,bX)))/
     &      (CB*CW*MW2*SW2)

	ENDLOOP(Ind1)
	ENDLOOP(Ind2)
	ENDLOOP(Ind3)
	ENDLOOP(Ind4)

	ENDLOOP(All3)
	ENDLOOP(All4)

#ifdef DETAILED_DEBUG
	DHIGGS "se_h0G0 =", se_h0G0 ENDL
#endif

	if( mssmpart .eq. 2 ) return

	LOOP(Sfe4, 1,2,1)
	LOOP(Sfe3, 1,2,1)
	LOOP(Gen3, 1,3,1)

        se_h0G0 = se_h0G0 + 
     &    cI/(16.D0*Pi)*(Alfa1L*
     &        B0(k2,MSf2(Sfe3,2,Gen3),MSf2(Sfe4,2,Gen3))*
     &        (USf(Sfe4,1,2,Gen3)*
     &           ((CB*MW*MZ*SAB*(-1 + 2*SW2) + 
     &                2*CW*SA*Mf2(2,Gen3))*USfC(Sfe3,1,2,Gen3) + 
     &             CW*(SA*KfC(Gen3,Gen3,2) + CA*MUE*Mf(2,Gen3))*
     &              USfC(Sfe3,2,2,Gen3)) + 
     &          USf(Sfe4,2,2,Gen3)*
     &           (CW*(SA*Kf(Gen3,Gen3,2) + CA*MUEC*Mf(2,Gen3))*
     &              USfC(Sfe3,1,2,Gen3) + 
     &             2*(-(CB*MW*MZ*SAB*SW2) + CW*SA*Mf2(2,Gen3))*
     &              USfC(Sfe3,2,2,Gen3)))*
     &        ((Kf(Gen3,Gen3,2) - MUEC*TB*Mf(2,Gen3))*
     &           USf(Sfe3,2,2,Gen3)*USfC(Sfe4,1,2,Gen3) + 
     &          (-KfC(Gen3,Gen3,2) + MUE*TB*Mf(2,Gen3))*
     &           USf(Sfe3,1,2,Gen3)*USfC(Sfe4,2,2,Gen3)))/
     &      (CB*CW*MW2*SW2)

	ENDLOOP(Gen3)
	ENDLOOP(Sfe3)
	ENDLOOP(Sfe4)

#ifdef DETAILED_DEBUG
	DHIGGS "se_h0G0 =", se_h0G0 ENDL
#endif

	if( mssmpart .eq. 3 ) return

	LOOP(Cha4, 1,2,1)

	tmp3 = A0(MCha2(Cha4))

	LOOP(Cha3, 1,2,1)

        dup1 = SA*UCha(Cha4,2)*VCha(Cha3,1) - 
     &    CA*UCha(Cha4,1)*VCha(Cha3,2)

        dup2 = -(CB*UCha(Cha3,2)*VCha(Cha4,1)) + 
     &    SB*UCha(Cha3,1)*VCha(Cha4,2)

        dup3 = CB*UChaC(Cha4,2)*VChaC(Cha3,1) - 
     &    SB*UChaC(Cha4,1)*VChaC(Cha3,2)

        dup4 = SA*UChaC(Cha3,2)*VChaC(Cha4,1) - 
     &    CA*UChaC(Cha3,1)*VChaC(Cha4,2)

        se_h0G0 = se_h0G0 + 
     &    cI/(4.D0*Pi)*(Alfa1L*
     &        ((dup1*dup3 + dup2*dup4)*
     &           (tmp3 + k2*B1(k2,MCha2(Cha3),MCha2(Cha4))) + 
     &          B0(k2,MCha2(Cha3),MCha2(Cha4))*
     &           (dup3*dup4*MCha(Cha3)*MCha(Cha4) + 
     &             dup2*dup4*MCha2(Cha3) + 
     &             dup1*(dup2*MCha(Cha3)*MCha(Cha4) + 
     &                dup3*MCha2(Cha3)))))/SW2

	ENDLOOP(Cha3)

	ENDLOOP(Cha4)

	LOOP(Neu4, 1,4,1)

	tmp4 = A0(MNeu2(Neu4))

	LOOP(Neu3, 1,4,1)

	dup5 = SW*ZNeu(Neu3,1) - CW*ZNeu(Neu3,2)

	dup6 = SA*ZNeu(Neu3,3) + CA*ZNeu(Neu3,4)

	dup7 = CB*ZNeu(Neu3,3) + SB*ZNeu(Neu3,4)

	dup8 = SW*ZNeu(Neu4,1) - CW*ZNeu(Neu4,2)

	dup9 = -(SW*ZNeu(Neu4,1)) + CW*ZNeu(Neu4,2)

	dup10 = SA*ZNeu(Neu4,3) + CA*ZNeu(Neu4,4)

	dup11 = CB*ZNeu(Neu4,3) + SB*ZNeu(Neu4,4)

	dup12 = SW*ZNeuC(Neu3,1) - CW*ZNeuC(Neu3,2)

	dup13 = SA*ZNeuC(Neu3,3) + CA*ZNeuC(Neu3,4)

	dup14 = CB*ZNeuC(Neu3,3) + SB*ZNeuC(Neu3,4)

	dup15 = SW*ZNeuC(Neu4,1) - CW*ZNeuC(Neu4,2)

	dup16 = SA*ZNeuC(Neu4,3) + CA*ZNeuC(Neu4,4)

	dup17 = CB*ZNeuC(Neu4,3) + SB*ZNeuC(Neu4,4)

        dup18 = -(dup10*dup12*dup17*dup5) + 
     &    dup11*(dup13*dup15*dup5 + dup12*dup16*dup5) + 
     &    dup13*dup15*dup7*dup8 + 
     &    dup15*(-(dup10*dup14*dup5) + dup14*dup6*dup9) + 
     &    dup12*(dup16*dup7*dup8 + dup17*dup6*dup9)

        se_h0G0 = se_h0G0 - 
     &    cI/(16.D0*Pi)*(Alfa1L*
     &        (dup18*(tmp4 + k2*B1(k2,MNeu2(Neu3),MNeu2(Neu4))) - 
     &          B0(k2,MNeu2(Neu3),MNeu2(Neu4))*
     &           ((dup12*dup14*dup15*dup16 + 
     &                dup12**2*dup16*dup17 + 
     &                dup13*(dup14*dup15**2 + dup12*dup15*dup17) + 
     &                dup10*(-(dup11*dup5**2) - dup5*dup7*dup8) + 
     &                dup11*dup5*dup6*dup9 + dup6*dup7*dup8*dup9)*
     &              MNeu(Neu3)*MNeu(Neu4) - dup18*MNeu2(Neu3))))/
     &      (CW2*SW2)

	ENDLOOP(Neu3)

	ENDLOOP(Neu4)

#ifdef DETAILED_DEBUG
	DHIGGS "se_h0G0 =", se_h0G0 ENDL
#endif

	end


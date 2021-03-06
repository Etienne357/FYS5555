#if 0
* huu-v1_All4_Ind1.F
* form factors for {S[10, {hno}]} -> {F[3, {gno1, Index[Colour, 2]}], -F[3, {gno2, Index[Colour, 3]}]}
* generated by FormCalc 7.5 on 27-Sep-2012 9:19
* this file is part of FeynHiggs
#endif

#include "huu-vars.h"

	subroutine huu_v1_All4_Ind1
	implicit none

#include "huu-vars.h"

#include "inline.h"

        Cloop(1) = Cloop(1) + 
     &    cI/(32.D0*Pi)*(AbbSum1*AlfaMZ*ELMZ*S2B*Delta(gno1,gno2)*
     &        Mf(tH,gno1)*(SB2*lint56(All4)*Sub416(All4,Ind1) + 
     &          CB2*lint57(All4)*Sub419(All4,Ind1))*
     &        XHiggs(hno,3,uzext))/
     &      (CB2*CW2*MW*MW2*(m12 - MZ2)*SB2*SW*SW2)

#ifdef DETAILED_DEBUG
	DCOUP "v1_All4_Ind1: Cloop(1) =", Cloop(1) ENDL
#endif

	end

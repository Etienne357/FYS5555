* gzvert_sqv5.F
* form factors for {MNE1, MNE1} -> {0, MZ}
* generated by FormCalc 12 Apr 2013 17:41

	subroutine gzvert_sqv5
	implicit none

#include "gzvars.h"

        Cloop(1) = Cloop(1) + 
     -   (Cval(cc00,iint57(sqv5))*
     -       (1/(12.D0*Pi**2)*
     -          (Abb5*EE*MTR052(sqv5)*MTR083(sqv5)*MTR181(1,1)) + 
     -         1/(12.D0*Pi**2)*
     -          (Abb7*EE*MTR052(sqv5)*MTR083(sqv5)*MTR182(1,1))) + 
     -      Cval(cc12,iint57(sqv5))*
     -       (-(1/(12.D0*Pi**2)*
     -            (AbbSum30*EE*MTR052(sqv5)*MTR083(sqv5)*
     -              MTR181(1,1))) - 
     -         1/(12.D0*Pi**2)*
     -          (AbbSum31*EE*MTR052(sqv5)*MTR083(sqv5)*MTR182(1,1))
     -         ) + 1/(144.D0*Pi**2)*
     -       (AbbSum72*MNE1*B1(S,sqvMass(sqv5)**2,sqvMass(sqv5)**2)*MTR083(sqv5)*
     -         (MTR191(1,1) + MTR192(1,1))*MTR269(sqv5)) + 
     -      B0(S,sqvMass(sqv5)**2,sqvMass(sqv5)**2)*
     -       (-(1/(48.D0*Pi**2)*
     -            (Abb5*MTR052(sqv5)*MTR181(1,1)*MTR269(sqv5))) - 
     -         1/(48.D0*Pi**2)*
     -          (Abb7*MTR052(sqv5)*MTR182(1,1)*MTR269(sqv5)) + 
     -         AbbSum72*MNE1*
     -          (1/(288.D0*Pi**2)*MTR191(1,1) + 
     -            1/(288.D0*Pi**2)*MTR192(1,1))*MTR083(sqv5)*
     -          MTR269(sqv5)))/(-MZ2 + S)

#ifdef DEBUG
	DEB 'vert_sqv5: Cloop(1) =', Cloop(1)
#endif

	end


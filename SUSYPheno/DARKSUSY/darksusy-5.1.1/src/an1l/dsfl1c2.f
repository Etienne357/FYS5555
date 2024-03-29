c====================================================================
c
c   auxiliary function used in:  
c   dsti_5.f
c
c   author: piero ullio (piero@tapir.caltech.edu)
c
c____________________________________________________________________

      real*8 function dsfl1c2(r1,r2,r3,r4,r5)
      implicit none
      real*8 r1,r2,r3,r4,r5,c0,c1,c2,c3
      c3=((r3+r4)*0.5d0-r2-r5)/(r1+r5)
      c0=r2
      c1=r1-r2+r3
      c2=-r1
      dsfl1c2=c2*c3*c3/(c0+c1*c3+c2*c3*c3)
      return
      end

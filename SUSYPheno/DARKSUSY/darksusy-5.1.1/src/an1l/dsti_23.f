c====================================================================
c
c   auxiliary function used in:  
c   dsanzgpar.f 
c
c   author: piero ullio (piero@tapir.caltech.edu)
c
c____________________________________________________________________

      real*8 function dsti_23(r1,r2,r3)
      implicit none
      real*8 dsti_5,r1,r2,r3
      dsti_23=dsti_5(r1,r2,1.d0,1.d0,r3)
      return
      end

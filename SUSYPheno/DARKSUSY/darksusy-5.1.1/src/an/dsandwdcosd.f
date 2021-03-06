      function dsandwdcosd(costheta)
c_______________________________________________________________________
c  10^15*annihilation differential invariant rate.
c  input:
c    p - initial cm momentum (real) for lsp annihilations via common
c    costheta - cosine of c.m. annihilation angle
c  uses dwdcos
c  used for gaussian integration with gadap.f
c  author: joakim edsjo (edsjo@physto.se)
c  date: 97-01-09
c=======================================================================
      implicit none
      real*8 dsandwdcosd,costheta,tmp
      real*8 dsandwdcos,tmp1
      external dsandwdcos

c-----------------------------------------------------------------------
      real*8 pd
      common /gadint/ pd
c-----------------------------------------------------------------------

      tmp1=dsandwdcos(pd,costheta)
      tmp=tmp1*1.0d15
      dsandwdcosd=tmp

      end









































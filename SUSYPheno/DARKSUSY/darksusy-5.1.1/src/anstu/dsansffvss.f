********************************************************
*** subroutine dsansffvss                            ***
*** fermion + fermion -> scalar + scalar in          ***
*** s-channel gauge boson exchange (index k)         ***
*** 1 - arrow in, 2 - arrow out, k intermediate      ***
*** this code is computer generated by reduce        ***
*** and gentran.                                     ***
*** author: joakim edsjo, edsjo@physto.se            ***
********************************************************

      subroutine dsansffvss(p,costheta,kp1,kp2,kpk,kp3,kp4)
      implicit none

      include 'dsmssm.h'
      include 'dsandiacom.h'
      integer kp1,kp2,kpk,kp3,kp4
      real*8 p,costheta
      complex*16 dv,gv2,ga2

      call dsankinvar(p,costheta,kp1,kp2,kpk,kp3,kp4)
      if (s.lt.(mp3+mp4)**2) return
      dv=1.0d0/dcmplx(mk**2-s,-width(kpk)*mk)
      gv2=gl(kpk,kp4,kp3)*
     &  (gl(kpk,kp2,kp1)+gr(kpk,kp2,kp1))
      ga2=gl(kpk,kp4,kp3)*
     &  (gl(kpk,kp2,kp1)-gr(kpk,kp2,kp1))


      if (kpk.eq.kgamma) then

      aa(0,0,0,0)=aa(0,0,0,0)+dsqrt(2.0d0)*((e3-e4)*emi+2.0d0*wd(1,0,0
     . )*kk*pmi)*dv*ga2
      aa(1,-1,0,0)=aa(1,-1,0,0)+2.0d0*dsqrt(2.0d0)*(epl*gv2+ga2*ppl)*
     . wd(1,-1,0)*dv*kk
      aa(1,0,0,0)=aa(1,0,0,0)+dsqrt(2.0d0)*((e3-e4)*pmi+2.0d0*wd(1,0,0
     . )*emi*kk)*dv*gv2
      aa(1,1,0,0)=aa(1,1,0,0)+2.0d0*dsqrt(2.0d0)*(epl*gv2-(ga2*ppl))*
     . wd(1,1,0)*dv*kk

      else

      aa(0,0,0,0)=aa(0,0,0,0)-(dsqrt(2.0d0)*((e1+e2+mk)*(e1+e2-mk)*(
     . e3-e4)*emi-(2.0d0*wd(1,0,0)*kk*mk**2*pmi))*dv*ga2)/mk**2
      aa(1,-1,0,0)=aa(1,-1,0,0)+2.0d0*dsqrt(2.0d0)*(epl*gv2+ga2*ppl)*
     . wd(1,-1,0)*dv*kk
      aa(1,0,0,0)=aa(1,0,0,0)-(dsqrt(2.0d0)*((e1+e2+mk)*(e1+e2-mk)*(
     . e3-e4)*pmi-(2.0d0*wd(1,0,0)*emi*kk*mk**2))*dv*gv2)/mk**2
      aa(1,1,0,0)=aa(1,1,0,0)+2.0d0*dsqrt(2.0d0)*(epl*gv2-(ga2*ppl))*
     . wd(1,1,0)*dv*kk

      endif
      return

      end

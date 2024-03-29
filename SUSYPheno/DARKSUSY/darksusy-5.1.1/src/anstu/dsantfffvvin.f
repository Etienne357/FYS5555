*********************************************************
*** subroutine dsantfffvvin                           ***
*** fermion + fermion -> gauge boson + gauge boson in ***
*** t-channel fermion exchange (index k)              ***
*** 1 - arrow in, 2 - arrow out, k intermediate       ***
*** both fermion arrows point inwards                 ***
*** this code is computer generated by reduce         ***
*** and gentran.                                      ***
*** author: joakim edsjo, edsjo@physto.se             ***
*********************************************************

      subroutine dsantfffvvin(p,costheta,kp1,kp2,kpk,kp3,kp4)
      implicit none

      include 'dsmssm.h'
      include 'dsandiacom.h'
      integer kp1,kp2,kpk,kp3,kp4
      real*8 p,costheta
      complex*16 dt,gp2,gm2,gx2,gy2

      call dsankinvar(p,costheta,kp1,kp2,kpk,kp3,kp4)
      if (s.lt.(mp3+mp4)**2) return
      dt=1.0d0/dcmplx(mk**2-t,-width(kpk)*mk)
      gp2=gl(kp3,kpk,kp1)*gl(kp4,kpk,kp2)+
     &    gr(kp3,kpk,kp1)*gr(kp4,kpk,kp2)
      gm2=gl(kp3,kpk,kp1)*gl(kp4,kpk,kp2)-
     &    gr(kp3,kpk,kp1)*gr(kp4,kpk,kp2)
      gx2=gl(kp3,kpk,kp1)*gr(kp4,kpk,kp2)+
     &    gr(kp3,kpk,kp1)*gl(kp4,kpk,kp2)
      gy2=gl(kp3,kpk,kp1)*gr(kp4,kpk,kp2)-
     &    gr(kp3,kpk,kp1)*gl(kp4,kpk,kp2)

      if (kp3.eq.kgamma) then
        if (kp4.eq.kgamma) then
      aa(0,0,-1,-1)=aa(0,0,-1,-1)-(dsqrt(2.0d0)*(3.0d0*(e1*gx2*pmi-(
     . e3*gx2*pmi)+emi*gx2*pp-(gp2*mk*ppl)+gy2*kk*pmi)*wd(1,0,0)-(
     . 2.0d0*wd(2,0,0)*gy2*pmi*pp)-(3.0d0*e1*emi*gy2)+3.0d0*e3*emi*gy2
     . -(3.0d0*emi*gx2*kk)-(3.0d0*epl*gm2*mk)-(gy2*pmi*pp))*dt)/3.0d0
      aa(0,0,-1,1)=aa(0,0,-1,1)+(4.0d0*wd(2,0,-2)*dt*gy2*pmi*pp)/dsqrt
     . (3.0d0)
      aa(0,0,1,-1)=aa(0,0,1,-1)+(4.0d0*wd(2,0,2)*dt*gy2*pmi*pp)/dsqrt(
     . 3.0d0)
      aa(0,0,1,1)=aa(0,0,1,1)+(dsqrt(2.0d0)*(3.0d0*(e1*gx2*pmi-(e3*gx2
     . *pmi)+emi*gx2*pp-(gp2*mk*ppl)-(gy2*kk*pmi))*wd(1,0,0)+2.0d0*wd(
     . 2,0,0)*gy2*pmi*pp+3.0d0*e1*emi*gy2-(3.0d0*e3*emi*gy2)-(3.0d0*
     . emi*gx2*kk)+3.0d0*epl*gm2*mk+gy2*pmi*pp)*dt)/3.0d0
      aa(1,-1,-1,-1)=aa(1,-1,-1,-1)-(dsqrt(2.0d0)*(dsqrt(3.0d0)*((e1-
     . e3)*(epl*gy2+gx2*ppl)+emi*gm2*mk+epl*gx2*kk-(gp2*mk*pmi)+gy2*kk
     . *ppl)*wd(1,-1,0)-((epl*gx2+gy2*ppl)*wd(2,-1,0)*pp))*dt)/dsqrt(
     . 3.0d0)
      aa(1,-1,-1,1)=aa(1,-1,-1,1)+2.0d0*(epl*gx2+gy2*ppl)*wd(2,-1,-2)*
     . dt*pp
      aa(1,-1,1,-1)=aa(1,-1,1,-1)+2.0d0*(epl*gx2+gy2*ppl)*wd(2,-1,2)*
     . dt*pp
      aa(1,-1,1,1)=aa(1,-1,1,1)+(dsqrt(2.0d0)*(dsqrt(3.0d0)*((e1-e3)*(
     . epl*gy2+gx2*ppl)+emi*gm2*mk-(epl*gx2*kk)-(gp2*mk*pmi)-(gy2*kk*
     . ppl))*wd(1,-1,0)+(epl*gx2+gy2*ppl)*wd(2,-1,0)*pp)*dt)/dsqrt(
     . 3.0d0)
      aa(1,0,-1,-1)=aa(1,0,-1,-1)-(dsqrt(2.0d0)*(3.0d0*(e1*emi*gy2-(
     . e3*emi*gy2)+emi*gx2*kk+epl*gm2*mk+gy2*pmi*pp)*wd(1,0,0)-(2.0d0*
     . wd(2,0,0)*emi*gx2*pp)-(3.0d0*e1*gx2*pmi)+3.0d0*e3*gx2*pmi-(emi*
     . gx2*pp)+3.0d0*gp2*mk*ppl-(3.0d0*gy2*kk*pmi))*dt)/3.0d0
      aa(1,0,-1,1)=aa(1,0,-1,1)+(4.0d0*wd(2,0,-2)*dt*emi*gx2*pp)/dsqrt
     . (3.0d0)
      aa(1,0,1,-1)=aa(1,0,1,-1)+(4.0d0*wd(2,0,2)*dt*emi*gx2*pp)/dsqrt(
     . 3.0d0)
      aa(1,0,1,1)=aa(1,0,1,1)+(dsqrt(2.0d0)*(3.0d0*(e1*emi*gy2-(e3*emi
     . *gy2)-(emi*gx2*kk)+epl*gm2*mk+gy2*pmi*pp)*wd(1,0,0)+2.0d0*wd(2,
     . 0,0)*emi*gx2*pp+3.0d0*e1*gx2*pmi-(3.0d0*e3*gx2*pmi)+emi*gx2*pp-
     . (3.0d0*gp2*mk*ppl)-(3.0d0*gy2*kk*pmi))*dt)/3.0d0
      aa(1,1,-1,-1)=aa(1,1,-1,-1)-(dsqrt(2.0d0)*(dsqrt(3.0d0)*((e1-e3
     . )*(epl*gy2-(gx2*ppl))+emi*gm2*mk+epl*gx2*kk+gp2*mk*pmi-(gy2*kk*
     . ppl))*wd(1,1,0)-((epl*gx2-(gy2*ppl))*wd(2,1,0)*pp))*dt)/dsqrt(
     . 3.0d0)
      aa(1,1,-1,1)=aa(1,1,-1,1)+2.0d0*(epl*gx2-(gy2*ppl))*wd(2,1,-2)*
     . dt*pp
      aa(1,1,1,-1)=aa(1,1,1,-1)+2.0d0*(epl*gx2-(gy2*ppl))*wd(2,1,2)*dt
     . *pp
      aa(1,1,1,1)=aa(1,1,1,1)+(dsqrt(2.0d0)*(dsqrt(3.0d0)*((e1-e3)*(
     . epl*gy2-(gx2*ppl))+emi*gm2*mk-(epl*gx2*kk)+gp2*mk*pmi+gy2*kk*
     . ppl)*wd(1,1,0)+(epl*gx2-(gy2*ppl))*wd(2,1,0)*pp)*dt)/dsqrt(
     . 3.0d0)

        else

      aa(0,0,-1,-1)=aa(0,0,-1,-1)-(dsqrt(2.0d0)*(3.0d0*(e1*gx2*pmi-(
     . e3*gx2*pmi)+emi*gx2*pp-(gp2*mk*ppl)+gy2*kk*pmi)*wd(1,0,0)-(
     . 2.0d0*wd(2,0,0)*gy2*pmi*pp)-(3.0d0*e1*emi*gy2)+3.0d0*e3*emi*gy2
     . -(3.0d0*emi*gx2*kk)-(3.0d0*epl*gm2*mk)-(gy2*pmi*pp))*dt)/3.0d0
      aa(0,0,-1,0)=aa(0,0,-1,0)-(dsqrt(2.0d0)*(dsqrt(3.0d0)*((e1-e3)*
     . (e4*gx2-(gy2*kk))*pmi+(emi*gx2*pp-(gp2*mk*ppl)+gy2*kk*pmi)*e4+
     . emi*gy2*kk*pp-(gm2*kk*mk*ppl)-(gx2*kk**2*pmi))*wd(1,0,-1)-(
     . 2.0d0*wd(2,0,-1)*e4*gy2*pmi*pp))*dt)/(dsqrt(3.0d0)*mp4)
      aa(0,0,-1,1)=aa(0,0,-1,1)+(4.0d0*wd(2,0,-2)*dt*gy2*pmi*pp)/dsqrt
     . (3.0d0)
      aa(0,0,1,-1)=aa(0,0,1,-1)+(4.0d0*wd(2,0,2)*dt*gy2*pmi*pp)/dsqrt(
     . 3.0d0)
      aa(0,0,1,0)=aa(0,0,1,0)+(dsqrt(2.0d0)*(dsqrt(3.0d0)*((e1-e3)*(e4
     . *gx2+gy2*kk)*pmi+(emi*gx2*pp-(gp2*mk*ppl)-(gy2*kk*pmi))*e4-(emi
     . *gy2*kk*pp)+gm2*kk*mk*ppl-(gx2*kk**2*pmi))*wd(1,0,1)+2.0d0*wd(2
     . ,0,1)*e4*gy2*pmi*pp)*dt)/(dsqrt(3.0d0)*mp4)
      aa(0,0,1,1)=aa(0,0,1,1)+(dsqrt(2.0d0)*(3.0d0*(e1*gx2*pmi-(e3*gx2
     . *pmi)+emi*gx2*pp-(gp2*mk*ppl)-(gy2*kk*pmi))*wd(1,0,0)+2.0d0*wd(
     . 2,0,0)*gy2*pmi*pp+3.0d0*e1*emi*gy2-(3.0d0*e3*emi*gy2)-(3.0d0*
     . emi*gx2*kk)+3.0d0*epl*gm2*mk+gy2*pmi*pp)*dt)/3.0d0
      aa(1,-1,-1,-1)=aa(1,-1,-1,-1)-(dsqrt(2.0d0)*(dsqrt(3.0d0)*((e1-
     . e3)*(epl*gy2+gx2*ppl)+emi*gm2*mk+epl*gx2*kk-(gp2*mk*pmi)+gy2*kk
     . *ppl)*wd(1,-1,0)-((epl*gx2+gy2*ppl)*wd(2,-1,0)*pp))*dt)/dsqrt(
     . 3.0d0)
      aa(1,-1,-1,0)=aa(1,-1,-1,0)-(dsqrt(2.0d0)*((((epl*gy2+gx2*ppl)*
     . e4-(epl*gx2*kk)-(gy2*kk*ppl))*(e1-e3)+(emi*gm2*mk+epl*gx2*kk-(
     . gp2*mk*pmi)+gy2*kk*ppl)*e4-((epl*gy2+gx2*ppl)*(kk-pp)*kk)+emi*
     . gp2*kk*mk-(gm2*kk*mk*pmi))*wd(1,-1,-1)-((epl*gx2+gy2*ppl)*wd(2,
     . -1,-1)*e4*pp))*dt)/mp4
      aa(1,-1,-1,1)=aa(1,-1,-1,1)+2.0d0*(epl*gx2+gy2*ppl)*wd(2,-1,-2)*
     . dt*pp
      aa(1,-1,1,-1)=aa(1,-1,1,-1)+2.0d0*(epl*gx2+gy2*ppl)*wd(2,-1,2)*
     . dt*pp
      aa(1,-1,1,0)=aa(1,-1,1,0)+(dsqrt(2.0d0)*((((epl*gy2+gx2*ppl)*e4+
     . epl*gx2*kk+gy2*kk*ppl)*(e1-e3)+(emi*gm2*mk-(epl*gx2*kk)-(gp2*mk
     . *pmi)-(gy2*kk*ppl))*e4-((epl*gy2+gx2*ppl)*(kk+pp)*kk)-(emi*gp2*
     . kk*mk)+gm2*kk*mk*pmi)*wd(1,-1,1)+(epl*gx2+gy2*ppl)*wd(2,-1,1)*
     . e4*pp)*dt)/mp4
      aa(1,-1,1,1)=aa(1,-1,1,1)+(dsqrt(2.0d0)*(dsqrt(3.0d0)*((e1-e3)*(
     . epl*gy2+gx2*ppl)+emi*gm2*mk-(epl*gx2*kk)-(gp2*mk*pmi)-(gy2*kk*
     . ppl))*wd(1,-1,0)+(epl*gx2+gy2*ppl)*wd(2,-1,0)*pp)*dt)/dsqrt(
     . 3.0d0)
      aa(1,0,-1,-1)=aa(1,0,-1,-1)-(dsqrt(2.0d0)*(3.0d0*(e1*emi*gy2-(
     . e3*emi*gy2)+emi*gx2*kk+epl*gm2*mk+gy2*pmi*pp)*wd(1,0,0)-(2.0d0*
     . wd(2,0,0)*emi*gx2*pp)-(3.0d0*e1*gx2*pmi)+3.0d0*e3*gx2*pmi-(emi*
     . gx2*pp)+3.0d0*gp2*mk*ppl-(3.0d0*gy2*kk*pmi))*dt)/3.0d0
      aa(1,0,-1,0)=aa(1,0,-1,0)-(dsqrt(2.0d0)*(dsqrt(3.0d0)*((e1-e3)*
     . (e4*gy2-(gx2*kk))*emi+(emi*gx2*kk+epl*gm2*mk+gy2*pmi*pp)*e4-(
     . emi*gy2*kk**2)+epl*gp2*kk*mk+gx2*kk*pmi*pp)*wd(1,0,-1)-(2.0d0*
     . wd(2,0,-1)*e4*emi*gx2*pp))*dt)/(dsqrt(3.0d0)*mp4)
      aa(1,0,-1,1)=aa(1,0,-1,1)+(4.0d0*wd(2,0,-2)*dt*emi*gx2*pp)/dsqrt
     . (3.0d0)
      aa(1,0,1,-1)=aa(1,0,1,-1)+(4.0d0*wd(2,0,2)*dt*emi*gx2*pp)/dsqrt(
     . 3.0d0)
      aa(1,0,1,0)=aa(1,0,1,0)+(dsqrt(2.0d0)*(dsqrt(3.0d0)*((e1-e3)*(e4
     . *gy2+gx2*kk)*emi-((emi*gx2*kk-(epl*gm2*mk)-(gy2*pmi*pp))*e4)-(
     . emi*gy2*kk**2)-(epl*gp2*kk*mk)-(gx2*kk*pmi*pp))*wd(1,0,1)+2.0d0
     . *wd(2,0,1)*e4*emi*gx2*pp)*dt)/(dsqrt(3.0d0)*mp4)
      aa(1,0,1,1)=aa(1,0,1,1)+(dsqrt(2.0d0)*(3.0d0*(e1*emi*gy2-(e3*emi
     . *gy2)-(emi*gx2*kk)+epl*gm2*mk+gy2*pmi*pp)*wd(1,0,0)+2.0d0*wd(2,
     . 0,0)*emi*gx2*pp+3.0d0*e1*gx2*pmi-(3.0d0*e3*gx2*pmi)+emi*gx2*pp-
     . (3.0d0*gp2*mk*ppl)-(3.0d0*gy2*kk*pmi))*dt)/3.0d0
      aa(1,1,-1,-1)=aa(1,1,-1,-1)-(dsqrt(2.0d0)*(dsqrt(3.0d0)*((e1-e3
     . )*(epl*gy2-(gx2*ppl))+emi*gm2*mk+epl*gx2*kk+gp2*mk*pmi-(gy2*kk*
     . ppl))*wd(1,1,0)-((epl*gx2-(gy2*ppl))*wd(2,1,0)*pp))*dt)/dsqrt(
     . 3.0d0)
      aa(1,1,-1,0)=aa(1,1,-1,0)-(dsqrt(2.0d0)*((((epl*gy2-(gx2*ppl))*
     . e4-(epl*gx2*kk)+gy2*kk*ppl)*(e1-e3)+(emi*gm2*mk+epl*gx2*kk+gp2*
     . mk*pmi-(gy2*kk*ppl))*e4-((epl*gy2-(gx2*ppl))*(kk+pp)*kk)+emi*
     . gp2*kk*mk+gm2*kk*mk*pmi)*wd(1,1,-1)-((epl*gx2-(gy2*ppl))*wd(2,1
     . ,-1)*e4*pp))*dt)/mp4
      aa(1,1,-1,1)=aa(1,1,-1,1)+2.0d0*(epl*gx2-(gy2*ppl))*wd(2,1,-2)*
     . dt*pp
      aa(1,1,1,-1)=aa(1,1,1,-1)+2.0d0*(epl*gx2-(gy2*ppl))*wd(2,1,2)*dt
     . *pp
      aa(1,1,1,0)=aa(1,1,1,0)+(dsqrt(2.0d0)*((((epl*gy2-(gx2*ppl))*e4+
     . epl*gx2*kk-(gy2*kk*ppl))*(e1-e3)+(emi*gm2*mk-(epl*gx2*kk)+gp2*
     . mk*pmi+gy2*kk*ppl)*e4-((epl*gy2-(gx2*ppl))*(kk-pp)*kk)-(emi*gp2
     . *kk*mk)-(gm2*kk*mk*pmi))*wd(1,1,1)+(epl*gx2-(gy2*ppl))*wd(2,1,1
     . )*e4*pp)*dt)/mp4
      aa(1,1,1,1)=aa(1,1,1,1)+(dsqrt(2.0d0)*(dsqrt(3.0d0)*((e1-e3)*(
     . epl*gy2-(gx2*ppl))+emi*gm2*mk-(epl*gx2*kk)+gp2*mk*pmi+gy2*kk*
     . ppl)*wd(1,1,0)+(epl*gx2-(gy2*ppl))*wd(2,1,0)*pp)*dt)/dsqrt(
     . 3.0d0)
        endif
      else
        if (kp4.eq.kgamma) then

      aa(0,0,-1,-1)=aa(0,0,-1,-1)-(dsqrt(2.0d0)*(3.0d0*(e1*gx2*pmi-(
     . e3*gx2*pmi)+emi*gx2*pp-(gp2*mk*ppl)+gy2*kk*pmi)*wd(1,0,0)-(
     . 2.0d0*wd(2,0,0)*gy2*pmi*pp)-(3.0d0*e1*emi*gy2)+3.0d0*e3*emi*gy2
     . -(3.0d0*emi*gx2*kk)-(3.0d0*epl*gm2*mk)-(gy2*pmi*pp))*dt)/3.0d0
      aa(0,0,-1,1)=aa(0,0,-1,1)+(4.0d0*wd(2,0,-2)*dt*gy2*pmi*pp)/dsqrt
     . (3.0d0)
      aa(0,0,0,-1)=aa(0,0,0,-1)-(dsqrt(2.0d0)*(dsqrt(3.0d0)*((e3*gx2+
     . gy2*kk)*e1*pmi+(emi*gx2*pp-(gp2*mk*ppl))*e3-(e3**2*gx2*pmi)-(
     . emi*gy2*kk*pp)-(gm2*kk*mk*ppl)+gx2*kk**2*pmi)*wd(1,0,1)-(2.0d0*
     . wd(2,0,1)*e3*gy2*pmi*pp))*dt)/(dsqrt(3.0d0)*mp3)
      aa(0,0,0,1)=aa(0,0,0,1)+(dsqrt(2.0d0)*(dsqrt(3.0d0)*wd(1,0,-1)*
     . e1*e3*gx2*pmi-(dsqrt(3.0d0)*wd(1,0,-1)*e1*gy2*kk*pmi)-(dsqrt(
     . 3.0d0)*wd(1,0,-1)*e3**2*gx2*pmi)+dsqrt(3.0d0)*wd(1,0,-1)*e3*emi
     . *gx2*pp-(dsqrt(3.0d0)*wd(1,0,-1)*e3*gp2*mk*ppl)+dsqrt(3.0d0)*wd
     . (1,0,-1)*emi*gy2*kk*pp+dsqrt(3.0d0)*wd(1,0,-1)*gm2*kk*mk*ppl+
     . dsqrt(3.0d0)*wd(1,0,-1)*gx2*kk**2*pmi+2.0d0*wd(2,0,-1)*e3*gy2*
     . pmi*pp)*dt)/(dsqrt(3.0d0)*mp3)
      aa(0,0,1,-1)=aa(0,0,1,-1)+(4.0d0*wd(2,0,2)*dt*gy2*pmi*pp)/dsqrt(
     . 3.0d0)
      aa(0,0,1,1)=aa(0,0,1,1)+(dsqrt(2.0d0)*(3.0d0*(e1*gx2*pmi-(e3*gx2
     . *pmi)+emi*gx2*pp-(gp2*mk*ppl)-(gy2*kk*pmi))*wd(1,0,0)+2.0d0*wd(
     . 2,0,0)*gy2*pmi*pp+3.0d0*e1*emi*gy2-(3.0d0*e3*emi*gy2)-(3.0d0*
     . emi*gx2*kk)+3.0d0*epl*gm2*mk+gy2*pmi*pp)*dt)/3.0d0
      aa(1,-1,-1,-1)=aa(1,-1,-1,-1)-(dsqrt(2.0d0)*(dsqrt(3.0d0)*((e1-
     . e3)*(epl*gy2+gx2*ppl)+emi*gm2*mk+epl*gx2*kk-(gp2*mk*pmi)+gy2*kk
     . *ppl)*wd(1,-1,0)-((epl*gx2+gy2*ppl)*wd(2,-1,0)*pp))*dt)/dsqrt(
     . 3.0d0)
      aa(1,-1,-1,1)=aa(1,-1,-1,1)+2.0d0*(epl*gx2+gy2*ppl)*wd(2,-1,-2)*
     . dt*pp
      aa(1,-1,0,-1)=aa(1,-1,0,-1)-(dsqrt(2.0d0)*((((epl*gy2+gx2*ppl)*
     . e3+epl*gx2*kk+gy2*kk*ppl)*e1+((kk+pp)*kk-e3**2)*(epl*gy2+gx2*
     . ppl)+(emi*gm2-(gp2*pmi))*e3*mk+emi*gp2*kk*mk-(gm2*kk*mk*pmi))*
     . wd(1,-1,1)-((epl*gx2+gy2*ppl)*wd(2,-1,1)*e3*pp))*dt)/mp3
      aa(1,-1,0,1)=aa(1,-1,0,1)+(dsqrt(2.0d0)*((((epl*gy2+gx2*ppl)*e3-
     . (epl*gx2*kk)-(gy2*kk*ppl))*e1+((kk-pp)*kk-e3**2)*(epl*gy2+gx2*
     . ppl)+(emi*gm2-(gp2*pmi))*e3*mk-(emi*gp2*kk*mk)+gm2*kk*mk*pmi)*
     . wd(1,-1,-1)+(epl*gx2+gy2*ppl)*wd(2,-1,-1)*e3*pp)*dt)/mp3
      aa(1,-1,1,-1)=aa(1,-1,1,-1)+2.0d0*(epl*gx2+gy2*ppl)*wd(2,-1,2)*
     . dt*pp
      aa(1,-1,1,1)=aa(1,-1,1,1)+(dsqrt(2.0d0)*(dsqrt(3.0d0)*((e1-e3)*(
     . epl*gy2+gx2*ppl)+emi*gm2*mk-(epl*gx2*kk)-(gp2*mk*pmi)-(gy2*kk*
     . ppl))*wd(1,-1,0)+(epl*gx2+gy2*ppl)*wd(2,-1,0)*pp)*dt)/dsqrt(
     . 3.0d0)
      aa(1,0,-1,-1)=aa(1,0,-1,-1)-(dsqrt(2.0d0)*(3.0d0*(e1*emi*gy2-(
     . e3*emi*gy2)+emi*gx2*kk+epl*gm2*mk+gy2*pmi*pp)*wd(1,0,0)-(2.0d0*
     . wd(2,0,0)*emi*gx2*pp)-(3.0d0*e1*gx2*pmi)+3.0d0*e3*gx2*pmi-(emi*
     . gx2*pp)+3.0d0*gp2*mk*ppl-(3.0d0*gy2*kk*pmi))*dt)/3.0d0
      aa(1,0,-1,1)=aa(1,0,-1,1)+(4.0d0*wd(2,0,-2)*dt*emi*gx2*pp)/dsqrt
     . (3.0d0)
      aa(1,0,0,-1)=aa(1,0,0,-1)-(dsqrt(2.0d0)*(dsqrt(3.0d0)*((e3*gy2+
     . gx2*kk)*e1*emi+(epl*gm2*mk+gy2*pmi*pp)*e3-(e3**2*emi*gy2)+emi*
     . gy2*kk**2+epl*gp2*kk*mk-(gx2*kk*pmi*pp))*wd(1,0,1)-(2.0d0*wd(2,
     . 0,1)*e3*emi*gx2*pp))*dt)/(dsqrt(3.0d0)*mp3)
      aa(1,0,0,1)=aa(1,0,0,1)+(dsqrt(2.0d0)*(dsqrt(3.0d0)*wd(1,0,-1)*
     . e1*e3*emi*gy2-(dsqrt(3.0d0)*wd(1,0,-1)*e1*emi*gx2*kk)-(dsqrt(
     . 3.0d0)*wd(1,0,-1)*e3**2*emi*gy2)+dsqrt(3.0d0)*wd(1,0,-1)*e3*epl
     . *gm2*mk+dsqrt(3.0d0)*wd(1,0,-1)*e3*gy2*pmi*pp+dsqrt(3.0d0)*wd(1
     . ,0,-1)*emi*gy2*kk**2-(dsqrt(3.0d0)*wd(1,0,-1)*epl*gp2*kk*mk)+
     . dsqrt(3.0d0)*wd(1,0,-1)*gx2*kk*pmi*pp+2.0d0*wd(2,0,-1)*e3*emi*
     . gx2*pp)*dt)/(dsqrt(3.0d0)*mp3)
      aa(1,0,1,-1)=aa(1,0,1,-1)+(4.0d0*wd(2,0,2)*dt*emi*gx2*pp)/dsqrt(
     . 3.0d0)
      aa(1,0,1,1)=aa(1,0,1,1)+(dsqrt(2.0d0)*(3.0d0*(e1*emi*gy2-(e3*emi
     . *gy2)-(emi*gx2*kk)+epl*gm2*mk+gy2*pmi*pp)*wd(1,0,0)+2.0d0*wd(2,
     . 0,0)*emi*gx2*pp+3.0d0*e1*gx2*pmi-(3.0d0*e3*gx2*pmi)+emi*gx2*pp-
     . (3.0d0*gp2*mk*ppl)-(3.0d0*gy2*kk*pmi))*dt)/3.0d0
      aa(1,1,-1,-1)=aa(1,1,-1,-1)-(dsqrt(2.0d0)*(dsqrt(3.0d0)*((e1-e3
     . )*(epl*gy2-(gx2*ppl))+emi*gm2*mk+epl*gx2*kk+gp2*mk*pmi-(gy2*kk*
     . ppl))*wd(1,1,0)-((epl*gx2-(gy2*ppl))*wd(2,1,0)*pp))*dt)/dsqrt(
     . 3.0d0)
      aa(1,1,-1,1)=aa(1,1,-1,1)+2.0d0*(epl*gx2-(gy2*ppl))*wd(2,1,-2)*
     . dt*pp
      aa(1,1,0,-1)=aa(1,1,0,-1)-(dsqrt(2.0d0)*((((epl*gy2-(gx2*ppl))*
     . e3+epl*gx2*kk-(gy2*kk*ppl))*e1+((kk-pp)*kk-e3**2)*(epl*gy2-(gx2
     . *ppl))+(emi*gm2+gp2*pmi)*e3*mk+emi*gp2*kk*mk+gm2*kk*mk*pmi)*wd(
     . 1,1,1)-((epl*gx2-(gy2*ppl))*wd(2,1,1)*e3*pp))*dt)/mp3
      aa(1,1,0,1)=aa(1,1,0,1)+(dsqrt(2.0d0)*((((epl*gy2-(gx2*ppl))*e3-
     . (epl*gx2*kk)+gy2*kk*ppl)*e1+((kk+pp)*kk-e3**2)*(epl*gy2-(gx2*
     . ppl))+(emi*gm2+gp2*pmi)*e3*mk-(emi*gp2*kk*mk)-(gm2*kk*mk*pmi))*
     . wd(1,1,-1)+(epl*gx2-(gy2*ppl))*wd(2,1,-1)*e3*pp)*dt)/mp3
      aa(1,1,1,-1)=aa(1,1,1,-1)+2.0d0*(epl*gx2-(gy2*ppl))*wd(2,1,2)*dt
     . *pp
      aa(1,1,1,1)=aa(1,1,1,1)+(dsqrt(2.0d0)*(dsqrt(3.0d0)*((e1-e3)*(
     . epl*gy2-(gx2*ppl))+emi*gm2*mk-(epl*gx2*kk)+gp2*mk*pmi+gy2*kk*
     . ppl)*wd(1,1,0)+(epl*gx2-(gy2*ppl))*wd(2,1,0)*pp)*dt)/dsqrt(
     . 3.0d0)

        else

      aa(0,0,-1,-1)=aa(0,0,-1,-1)-(dsqrt(2.0d0)*(3.0d0*(e1*gx2*pmi-(
     . e3*gx2*pmi)+emi*gx2*pp-(gp2*mk*ppl)+gy2*kk*pmi)*wd(1,0,0)-(
     . 2.0d0*wd(2,0,0)*gy2*pmi*pp)-(3.0d0*e1*emi*gy2)+3.0d0*e3*emi*gy2
     . -(3.0d0*emi*gx2*kk)-(3.0d0*epl*gm2*mk)-(gy2*pmi*pp))*dt)/3.0d0
      aa(0,0,-1,0)=aa(0,0,-1,0)-(dsqrt(2.0d0)*(dsqrt(3.0d0)*((e1-e3)*
     . (e4*gx2-(gy2*kk))*pmi+(emi*gx2*pp-(gp2*mk*ppl)+gy2*kk*pmi)*e4+
     . emi*gy2*kk*pp-(gm2*kk*mk*ppl)-(gx2*kk**2*pmi))*wd(1,0,-1)-(
     . 2.0d0*wd(2,0,-1)*e4*gy2*pmi*pp))*dt)/(dsqrt(3.0d0)*mp4)
      aa(0,0,-1,1)=aa(0,0,-1,1)+(4.0d0*wd(2,0,-2)*dt*gy2*pmi*pp)/dsqrt
     . (3.0d0)
      aa(0,0,0,-1)=aa(0,0,0,-1)-(dsqrt(2.0d0)*(dsqrt(3.0d0)*((e3*gx2+
     . gy2*kk)*e1*pmi+(emi*gx2*pp-(gp2*mk*ppl))*e3-(e3**2*gx2*pmi)-(
     . emi*gy2*kk*pp)-(gm2*kk*mk*ppl)+gx2*kk**2*pmi)*wd(1,0,1)-(2.0d0*
     . wd(2,0,1)*e3*gy2*pmi*pp))*dt)/(dsqrt(3.0d0)*mp3)
      aa(0,0,0,0)=aa(0,0,0,0)+(dsqrt(2.0d0)*(3.0d0*((e3-e4)*e1*gy2*pmi
     . +(emi*gy2*pp+gm2*mk*ppl)*e4-((emi*gy2*pp-(gm2*mk*ppl))*e3)-(e3
     . **2*gy2*pmi)+gy2*kk**2*pmi)*wd(1,0,0)*kk-(3.0d0*(e3*e4-kk**2)*
     . e1*emi*gy2)-((3.0d0*epl*gm2*mk+gy2*pmi*pp)*e3*e4)+4.0d0*wd(2,0,
     . 0)*e3*e4*gy2*pmi*pp+3.0d0*e3**2*e4*emi*gy2-(3.0d0*e4*emi*gy2*kk
     . **2)-(3.0d0*epl*gm2*kk**2*mk)-(3.0d0*gy2*kk**2*pmi*pp))*dt)/(
     . 3.0d0*mp3*mp4)
      aa(0,0,0,1)=aa(0,0,0,1)+(dsqrt(2.0d0)*(dsqrt(3.0d0)*((e3*gx2-(
     . gy2*kk))*e1*pmi+(emi*gx2*pp-(gp2*mk*ppl))*e3-(e3**2*gx2*pmi)+
     . emi*gy2*kk*pp+gm2*kk*mk*ppl+gx2*kk**2*pmi)*wd(1,0,-1)+2.0d0*wd(
     . 2,0,-1)*e3*gy2*pmi*pp)*dt)/(dsqrt(3.0d0)*mp3)
      aa(0,0,1,-1)=aa(0,0,1,-1)+(4.0d0*wd(2,0,2)*dt*gy2*pmi*pp)/dsqrt(
     . 3.0d0)
      aa(0,0,1,0)=aa(0,0,1,0)+(dsqrt(2.0d0)*(dsqrt(3.0d0)*((e1-e3)*(e4
     . *gx2+gy2*kk)*pmi+(emi*gx2*pp-(gp2*mk*ppl)-(gy2*kk*pmi))*e4-(emi
     . *gy2*kk*pp)+gm2*kk*mk*ppl-(gx2*kk**2*pmi))*wd(1,0,1)+2.0d0*wd(2
     . ,0,1)*e4*gy2*pmi*pp)*dt)/(dsqrt(3.0d0)*mp4)
      aa(0,0,1,1)=aa(0,0,1,1)+(dsqrt(2.0d0)*(3.0d0*(e1*gx2*pmi-(e3*gx2
     . *pmi)+emi*gx2*pp-(gp2*mk*ppl)-(gy2*kk*pmi))*wd(1,0,0)+2.0d0*wd(
     . 2,0,0)*gy2*pmi*pp+3.0d0*e1*emi*gy2-(3.0d0*e3*emi*gy2)-(3.0d0*
     . emi*gx2*kk)+3.0d0*epl*gm2*mk+gy2*pmi*pp)*dt)/3.0d0
      aa(1,-1,-1,-1)=aa(1,-1,-1,-1)-(dsqrt(2.0d0)*(dsqrt(3.0d0)*((e1-
     . e3)*(epl*gy2+gx2*ppl)+emi*gm2*mk+epl*gx2*kk-(gp2*mk*pmi)+gy2*kk
     . *ppl)*wd(1,-1,0)-((epl*gx2+gy2*ppl)*wd(2,-1,0)*pp))*dt)/dsqrt(
     . 3.0d0)
      aa(1,-1,-1,0)=aa(1,-1,-1,0)-(dsqrt(2.0d0)*((((epl*gy2+gx2*ppl)*
     . e4-(epl*gx2*kk)-(gy2*kk*ppl))*(e1-e3)+(emi*gm2*mk+epl*gx2*kk-(
     . gp2*mk*pmi)+gy2*kk*ppl)*e4-((epl*gy2+gx2*ppl)*(kk-pp)*kk)+emi*
     . gp2*kk*mk-(gm2*kk*mk*pmi))*wd(1,-1,-1)-((epl*gx2+gy2*ppl)*wd(2,
     . -1,-1)*e4*pp))*dt)/mp4
      aa(1,-1,-1,1)=aa(1,-1,-1,1)+2.0d0*(epl*gx2+gy2*ppl)*wd(2,-1,-2)*
     . dt*pp
      aa(1,-1,0,-1)=aa(1,-1,0,-1)-(dsqrt(2.0d0)*((((epl*gy2+gx2*ppl)*
     . e3+epl*gx2*kk+gy2*kk*ppl)*e1+((kk+pp)*kk-e3**2)*(epl*gy2+gx2*
     . ppl)+(emi*gm2-(gp2*pmi))*e3*mk+emi*gp2*kk*mk-(gm2*kk*mk*pmi))*
     . wd(1,-1,1)-((epl*gx2+gy2*ppl)*wd(2,-1,1)*e3*pp))*dt)/mp3
      aa(1,-1,0,0)=aa(1,-1,0,0)-(dsqrt(2.0d0)*(dsqrt(3.0d0)*((e3+e4)*
     . (emi*gp2*mk+epl*gy2*pp-(gm2*mk*pmi)+gx2*pp*ppl)-((e3-e4)*(epl*
     . gx2+gy2*ppl)*e1)+(epl*gx2+gy2*ppl)*e3**2-(epl*gx2*kk**2)-(gy2*
     . kk**2*ppl))*wd(1,-1,0)*kk-(2.0d0*(epl*gx2+gy2*ppl)*wd(2,-1,0)*
     . e3*e4*pp))*dt)/(dsqrt(3.0d0)*mp3*mp4)
      aa(1,-1,0,1)=aa(1,-1,0,1)+(dsqrt(2.0d0)*((((epl*gy2+gx2*ppl)*e3-
     . (epl*gx2*kk)-(gy2*kk*ppl))*e1+((kk-pp)*kk-e3**2)*(epl*gy2+gx2*
     . ppl)+(emi*gm2-(gp2*pmi))*e3*mk-(emi*gp2*kk*mk)+gm2*kk*mk*pmi)*
     . wd(1,-1,-1)+(epl*gx2+gy2*ppl)*wd(2,-1,-1)*e3*pp)*dt)/mp3
      aa(1,-1,1,-1)=aa(1,-1,1,-1)+2.0d0*(epl*gx2+gy2*ppl)*wd(2,-1,2)*
     . dt*pp
      aa(1,-1,1,0)=aa(1,-1,1,0)+(dsqrt(2.0d0)*((((epl*gy2+gx2*ppl)*e4+
     . epl*gx2*kk+gy2*kk*ppl)*(e1-e3)+(emi*gm2*mk-(epl*gx2*kk)-(gp2*mk
     . *pmi)-(gy2*kk*ppl))*e4-((epl*gy2+gx2*ppl)*(kk+pp)*kk)-(emi*gp2*
     . kk*mk)+gm2*kk*mk*pmi)*wd(1,-1,1)+(epl*gx2+gy2*ppl)*wd(2,-1,1)*
     . e4*pp)*dt)/mp4
      aa(1,-1,1,1)=aa(1,-1,1,1)+(dsqrt(2.0d0)*(dsqrt(3.0d0)*((e1-e3)*(
     . epl*gy2+gx2*ppl)+emi*gm2*mk-(epl*gx2*kk)-(gp2*mk*pmi)-(gy2*kk*
     . ppl))*wd(1,-1,0)+(epl*gx2+gy2*ppl)*wd(2,-1,0)*pp)*dt)/dsqrt(
     . 3.0d0)
      aa(1,0,-1,-1)=aa(1,0,-1,-1)-(dsqrt(2.0d0)*(3.0d0*(e1*emi*gy2-(
     . e3*emi*gy2)+emi*gx2*kk+epl*gm2*mk+gy2*pmi*pp)*wd(1,0,0)-(2.0d0*
     . wd(2,0,0)*emi*gx2*pp)-(3.0d0*e1*gx2*pmi)+3.0d0*e3*gx2*pmi-(emi*
     . gx2*pp)+3.0d0*gp2*mk*ppl-(3.0d0*gy2*kk*pmi))*dt)/3.0d0
      aa(1,0,-1,0)=aa(1,0,-1,0)-(dsqrt(2.0d0)*(dsqrt(3.0d0)*((e1-e3)*
     . (e4*gy2-(gx2*kk))*emi+(emi*gx2*kk+epl*gm2*mk+gy2*pmi*pp)*e4-(
     . emi*gy2*kk**2)+epl*gp2*kk*mk+gx2*kk*pmi*pp)*wd(1,0,-1)-(2.0d0*
     . wd(2,0,-1)*e4*emi*gx2*pp))*dt)/(dsqrt(3.0d0)*mp4)
      aa(1,0,-1,1)=aa(1,0,-1,1)+(4.0d0*wd(2,0,-2)*dt*emi*gx2*pp)/dsqrt
     . (3.0d0)
      aa(1,0,0,-1)=aa(1,0,0,-1)-(dsqrt(2.0d0)*(dsqrt(3.0d0)*((e3*gy2+
     . gx2*kk)*e1*emi+(epl*gm2*mk+gy2*pmi*pp)*e3-(e3**2*emi*gy2)+emi*
     . gy2*kk**2+epl*gp2*kk*mk-(gx2*kk*pmi*pp))*wd(1,0,1)-(2.0d0*wd(2,
     . 0,1)*e3*emi*gx2*pp))*dt)/(dsqrt(3.0d0)*mp3)
      aa(1,0,0,0)=aa(1,0,0,0)+(dsqrt(2.0d0)*(3.0d0*((e3-e4)*e1*emi*gx2
     . -((epl*gp2*mk+gx2*pmi*pp)*e3)-((epl*gp2*mk-(gx2*pmi*pp))*e4)-(
     . e3**2*emi*gx2)+emi*gx2*kk**2)*wd(1,0,0)*kk-(3.0d0*(e3*e4-kk**2)
     . *e1*gx2*pmi)-((emi*gx2*pp-(3.0d0*gp2*mk*ppl))*e3*e4)+4.0d0*wd(2
     . ,0,0)*e3*e4*emi*gx2*pp+3.0d0*e3**2*e4*gx2*pmi-(3.0d0*e4*gx2*kk
     . **2*pmi)-(3.0d0*emi*gx2*kk**2*pp)+3.0d0*gp2*kk**2*mk*ppl)*dt)/(
     . 3.0d0*mp3*mp4)
      aa(1,0,0,1)=aa(1,0,0,1)+(dsqrt(2.0d0)*(dsqrt(3.0d0)*((e3*gy2-(
     . gx2*kk))*e1*emi+(epl*gm2*mk+gy2*pmi*pp)*e3-(e3**2*emi*gy2)+emi*
     . gy2*kk**2-(epl*gp2*kk*mk)+gx2*kk*pmi*pp)*wd(1,0,-1)+2.0d0*wd(2,
     . 0,-1)*e3*emi*gx2*pp)*dt)/(dsqrt(3.0d0)*mp3)
      aa(1,0,1,-1)=aa(1,0,1,-1)+(4.0d0*wd(2,0,2)*dt*emi*gx2*pp)/dsqrt(
     . 3.0d0)
      aa(1,0,1,0)=aa(1,0,1,0)+(dsqrt(2.0d0)*(dsqrt(3.0d0)*((e1-e3)*(e4
     . *gy2+gx2*kk)*emi-((emi*gx2*kk-(epl*gm2*mk)-(gy2*pmi*pp))*e4)-(
     . emi*gy2*kk**2)-(epl*gp2*kk*mk)-(gx2*kk*pmi*pp))*wd(1,0,1)+2.0d0
     . *wd(2,0,1)*e4*emi*gx2*pp)*dt)/(dsqrt(3.0d0)*mp4)
      aa(1,0,1,1)=aa(1,0,1,1)+(dsqrt(2.0d0)*(3.0d0*(e1*emi*gy2-(e3*emi
     . *gy2)-(emi*gx2*kk)+epl*gm2*mk+gy2*pmi*pp)*wd(1,0,0)+2.0d0*wd(2,
     . 0,0)*emi*gx2*pp+3.0d0*e1*gx2*pmi-(3.0d0*e3*gx2*pmi)+emi*gx2*pp-
     . (3.0d0*gp2*mk*ppl)-(3.0d0*gy2*kk*pmi))*dt)/3.0d0
      aa(1,1,-1,-1)=aa(1,1,-1,-1)-(dsqrt(2.0d0)*(dsqrt(3.0d0)*((e1-e3
     . )*(epl*gy2-(gx2*ppl))+emi*gm2*mk+epl*gx2*kk+gp2*mk*pmi-(gy2*kk*
     . ppl))*wd(1,1,0)-((epl*gx2-(gy2*ppl))*wd(2,1,0)*pp))*dt)/dsqrt(
     . 3.0d0)
      aa(1,1,-1,0)=aa(1,1,-1,0)-(dsqrt(2.0d0)*((((epl*gy2-(gx2*ppl))*
     . e4-(epl*gx2*kk)+gy2*kk*ppl)*(e1-e3)+(emi*gm2*mk+epl*gx2*kk+gp2*
     . mk*pmi-(gy2*kk*ppl))*e4-((epl*gy2-(gx2*ppl))*(kk+pp)*kk)+emi*
     . gp2*kk*mk+gm2*kk*mk*pmi)*wd(1,1,-1)-((epl*gx2-(gy2*ppl))*wd(2,1
     . ,-1)*e4*pp))*dt)/mp4
      aa(1,1,-1,1)=aa(1,1,-1,1)+2.0d0*(epl*gx2-(gy2*ppl))*wd(2,1,-2)*
     . dt*pp
      aa(1,1,0,-1)=aa(1,1,0,-1)-(dsqrt(2.0d0)*((((epl*gy2-(gx2*ppl))*
     . e3+epl*gx2*kk-(gy2*kk*ppl))*e1+((kk-pp)*kk-e3**2)*(epl*gy2-(gx2
     . *ppl))+(emi*gm2+gp2*pmi)*e3*mk+emi*gp2*kk*mk+gm2*kk*mk*pmi)*wd(
     . 1,1,1)-((epl*gx2-(gy2*ppl))*wd(2,1,1)*e3*pp))*dt)/mp3
      aa(1,1,0,0)=aa(1,1,0,0)-(dsqrt(2.0d0)*(dsqrt(3.0d0)*((e3+e4)*(
     . emi*gp2*mk-(epl*gy2*pp)+gm2*mk*pmi+gx2*pp*ppl)-((e3-e4)*(epl*
     . gx2-(gy2*ppl))*e1)+(epl*gx2-(gy2*ppl))*e3**2-(epl*gx2*kk**2)+
     . gy2*kk**2*ppl)*wd(1,1,0)*kk-(2.0d0*(epl*gx2-(gy2*ppl))*wd(2,1,0
     . )*e3*e4*pp))*dt)/(dsqrt(3.0d0)*mp3*mp4)
      aa(1,1,0,1)=aa(1,1,0,1)+(dsqrt(2.0d0)*((((epl*gy2-(gx2*ppl))*e3-
     . (epl*gx2*kk)+gy2*kk*ppl)*e1+((kk+pp)*kk-e3**2)*(epl*gy2-(gx2*
     . ppl))+(emi*gm2+gp2*pmi)*e3*mk-(emi*gp2*kk*mk)-(gm2*kk*mk*pmi))*
     . wd(1,1,-1)+(epl*gx2-(gy2*ppl))*wd(2,1,-1)*e3*pp)*dt)/mp3
      aa(1,1,1,-1)=aa(1,1,1,-1)+2.0d0*(epl*gx2-(gy2*ppl))*wd(2,1,2)*dt
     . *pp
      aa(1,1,1,0)=aa(1,1,1,0)+(dsqrt(2.0d0)*((((epl*gy2-(gx2*ppl))*e4+
     . epl*gx2*kk-(gy2*kk*ppl))*(e1-e3)+(emi*gm2*mk-(epl*gx2*kk)+gp2*
     . mk*pmi+gy2*kk*ppl)*e4-((epl*gy2-(gx2*ppl))*(kk-pp)*kk)-(emi*gp2
     . *kk*mk)-(gm2*kk*mk*pmi))*wd(1,1,1)+(epl*gx2-(gy2*ppl))*wd(2,1,1
     . )*e4*pp)*dt)/mp4
      aa(1,1,1,1)=aa(1,1,1,1)+(dsqrt(2.0d0)*(dsqrt(3.0d0)*((e1-e3)*(
     . epl*gy2-(gx2*ppl))+emi*gm2*mk-(epl*gx2*kk)+gp2*mk*pmi+gy2*kk*
     . ppl)*wd(1,1,0)+(epl*gx2-(gy2*ppl))*wd(2,1,0)*pp)*dt)/dsqrt(
     . 3.0d0)

        endif
      endif

      return

      end












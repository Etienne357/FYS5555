C-----------------------------------------------------------------
      SUBROUTINE GAMMAHP(T,CH2,F)            
C-----------------------------------------------------------------
      IMPLICIT NONE
      REAL*8 T,CH2(19),F(19)
      COMMON /CHRGN/ MCHA(2),MSQU(3),MSQD(3),SMIX(6),RMIX(2),ABMIX(2)     
      REAL*8 MCHA,MSQU,MSQD,SMIX,RMIX,ABMIX
      SAVE /CHRGN/
      COMMON/SCALEQ/Q
      REAL*8 Q
      SAVE /SCALEQ/
      COMMON /G3/G3
      REAL*8 G3
      SAVE /G3/         
      INTEGER NS,NF,NFT
      REAL*8 PI,FAC,BB
      
      PI=4.*ATAN(1.d0)
      FAC=G3**2/(8.d0*PI**2)

      NS=0
      IF(MSQU(1).LT.Q) THEN
       NS=NS+1
      ENDIF
      IF(MSQU(2).LT.Q) THEN
       NS=NS+1
      ENDIF
      IF(MSQU(3).LT.Q) THEN
       NS=NS+10
      ENDIF             
      NF=6
      NFT=3-2*3
      BB=-11./2.d0+1./3.d0*NF+1./12.d0*NS
C
      F(1)=FAC*(20./3.d0*CH2(1)-8.d0*CH2(2)+6.d0*CH2(4)
     $         +4.d0*CH2(5)+2.d0*CH2(6))
      F(2)=FAC*(CH2(1)+2./3.d0*CH2(2)+2.d0*CH2(4)
     $         +3./2.d0*CH2(5)+CH2(6)+1./2.d0*CH2(7)
     $         -3./2.d0*CH2(10)-119./54.d0*CH2(11)
     $         +(70./27.d0+3./2.d0*NF)*CH2(12)
     $         +(3.d0+35./27.d0*NF)*CH2(13)
     $         +(-7./3.d0-3./2.d0*NF)*CH2(14)
     $         +(-2.d0-119./54.d0*NF)*CH2(15)
     $         -1./2.d0*CH2(17)+1./2.d0*CH2(19))
      F(3)=FAC*(-2.d0*CH2(1)+4./3.d0*CH2(2)+16./3.d0*CH2(3)
     $         -CH2(4)+CH2(6)+2.d0*CH2(7)+4./3.d0*CH2(9)
     $         +224./27.d0*CH2(11)+232./27.d0*CH2(12)
     $         +(8./27.d0*NF+4.d0*NFT)*CH2(13)
     $         -16./3.d0*CH2(14)
     $         +(8./27.d0*NF-4.d0*NFT)*CH2(15)
     $         +3.d0*CH2(16)+CH2(17)
     $         -3.d0*CH2(18)-CH2(19))
      F(4)=FAC*(2./3.d0*CH2(4)-113./36.d0*CH2(5)-2.d0*CH2(6)
     $         -113./36.d0*CH2(7)
     $         +2./3.d0*CH2(11)+4./3.d0*CH2(12)
     $         +2.*NF/3.d0*CH2(13)+2.*NF/3.d0*CH2(15))    
      F(5)=FAC*(2.d0*CH2(4)+137./18.d0*CH2(5)+2.d0*CH2(6)
     $         +89./18.d0*CH2(7)
     $         -4./3.d0*CH2(11)-8./3.d0*CH2(12)
     $         -4.*NF/3.d0*CH2(13)-4.*NF/3.d0*CH2(15))    
      F(6)=FAC*(-2.d0*CH2(4)-113./36.d0*CH2(5)+2./3.d0*CH2(6)
     $         -113./36.d0*CH2(7)
     $         +2./3.d0*CH2(11)+4./3.d0*CH2(12)
     $         +2.*NF/3.d0*CH2(13)+2.*NF/3.d0*CH2(15))    
      F(7)=FAC*(-2.d0*CH2(4)-4./3.d0*CH2(5)-2.d0*CH2(6)
     $         +4./3.d0*CH2(7))
      F(8)=FAC*(9./4.d0*CH2(5)+9./4.d0*CH2(7)
     $         -4.d0*CH2(10)-2.d0*CH2(11)-6.d0*CH2(12)
     $         +2./3.d0*(3-NF)*CH2(13)-6.d0*CH2(14)    
     $         +2./3.d0*(-3-NF)*CH2(15))     
      F(9)=0.d0
      F(10)=FAC*(CH2(10))
      F(11)=FAC*(-3.d0*CH2(10)-8.d0*CH2(11))
      F(12)=FAC*(-1./9.d0*CH2(11)-11./9.d0*CH2(12)
     $           +(3.d0-NF/9.d0)*CH2(13)-NF/9.d0*CH2(15)    
     $          -1./36.d0*RMIX(1)+1./36.d0*RMIX(2))   
      F(13)=FAC*(1./3.d0*CH2(11)+11./3.d0*CH2(12)
     $           +(NF/3.d0-1.d0)*CH2(13)+NF/3.d0*CH2(15)     
     $          +1./12.d0*RMIX(1)-1./12.d0*RMIX(2))   
      F(14)=FAC*(-1./9.d0*CH2(11)-2./9.d0*CH2(12)
     $           -NF/9.d0*CH2(13)+CH2(14)-NF/9.d0*CH2(15) 
     $          -1./36.d0*RMIX(1)+1./36.d0*RMIX(2))   
      F(15)=FAC*(1./3.d0*CH2(11)+2./3.d0*CH2(12)
     $           +NF/3.d0*CH2(13)-3.d0*CH2(14)
     $           +(NF/3.d0-8.d0)*CH2(15) 
     $          +1./12.d0*RMIX(1)-1./12.d0*RMIX(2))   
      F(16)=FAC*((1.d0-2.d0*BB)*CH2(16)-7.d0*CH2(18)-6.d0*CH2(19))    
      F(17)=FAC*(-3.d0*CH2(16)+(-8.d0-2.d0*BB)*CH2(17)
     $           -3.d0*CH2(18)+2.d0*CH2(19))    
      F(18)=FAC*(-7./3.d0*CH2(16)-2.d0*CH2(17)
     $           +(-19./3.d0-2.d0*BB)*CH2(18))   
      F(19)=FAC*(-CH2(16)+2./3.d0*CH2(17)
     $          +(8./3.d0-2.d0*BB)*CH2(19))
      
      RETURN
      END
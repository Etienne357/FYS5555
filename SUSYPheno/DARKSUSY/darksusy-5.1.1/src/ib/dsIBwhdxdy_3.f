*****************************************************************************
*** auxiliary routine called by dsIBwhdxdy
*** author: Torsten Bringmann, 2007-04-18
*****************************************************************************

      real*8 function dsIBwhdxdy_3(x,y,m0,mw,mhc,mc1)
      implicit none
      real*8 x,y,m0,mw,mhc,mc1

      dsIBwhdxdy_3 = 
     -   (8*m0**4*(mw**2*(mhc**4*mw**4*(1 - 3*x) - 
     -         mhc**2*mw**6*(-3 + x) + mhc**8*x - 
     -         mhc**6*mw**2*(1 + x) + mw**8*(1 + 4*x) - 
     -         2*mc1**2*(mhc**2 - mw**2)**2*(-mw**2 + mhc**2*x)) + 
     -      512*m0**10*(-1 + x)*y*(-1 + 2*y)*
     -       (-x + 2*x**2 + y - 4*x*y + 2*y**2) + 
     -      2*m0**2*(-2*mhc**8*x*y + 
     -         mhc**6*mw**2*(-7*x + 2*x**2 + 4*y) + 
     -         mw**8*(1 + 4*x + 28*x**2 - 12*y - 30*x*y) + 
     -         mhc**2*mw**6*(6 + 13*x + 2*x**2 - 20*y + 16*x*y) + 
     -         mhc**4*mw**4*(5 - 6*x - 8*x**2 - 4*y + 16*x*y) + 
     -         4*mc1**2*(mhc**6*x*y - mhc**4*mw**2*(x*(-3 + y) + 2*y) - 
     -            mhc**2*mw**4*(2 + (-4 + x)*y) + 
     -            mw**6*(-2 + x - 2*x**2 - 2*y + x*y))) - 
     -      8*m0**4*(-(mw**6*
     -            (-4 + x + 36*x**3 + 6*y - 17*x*y - 76*x**2*y + 
     -              22*y**2 + 38*x*y**2)) + 
     -         mhc**6*y*(4*x**2 + 2*y - x*(7 + 2*y)) + 
     -         mhc**4*mw**2*(x**2*(6 - 12*y) - 2*(-5 + y)*y + 
     -            x*(-9 - 13*y + 14*y**2)) + 
     -         mhc**2*mw**4*(4 - 8*x**3 + 12*y - 26*y**2 - 
     -            4*x**2*(2 + 3*y) + x*(-14 + 35*y + 26*y**2)) + 
     -         4*mc1**2*(mhc**4*y*(-x**2 - y + x*(3 + y)) + 
     -            mhc**2*mw**2*
     -             (2*x**2*y + 2*(-2 + y)*y + x*(3 + 2*y - 2*y**2)) + 
     -            mw**4*(-1 + 4*x**3 - 4*y - 5*x**2*y - y**2 + 
     -               x*(2 + 3*y + y**2)))) + 
     -      128*m0**8*(mw**2*
     -          (4*x**5 + 4*x**3*y*(1 + 6*y) - 2*x**4*(1 + 8*y) + 
     -            2*y*(-1 - 2*y + 8*y**2 + 2*y**3) - 
     -            2*x**2*(1 + y - 7*y**2 + 8*y**3) + 
     -            x*(1 + 9*y - 16*y**2 - 20*y**3 + 4*y**4)) + 
     -         y*(4*mc1**2*(-1 + x)*(x - y) + 
     -            mhc**2*(-4*x**3*(-1 + y) + 4*y*(-1 + y**2) + 
     -               2*x**2*(-5 + 2*y + 4*y**2) + 
     -               x*(5 + 8*y - 12*y**2 - 4*y**3)))) + 
     -      32*m0**6*(mw**4*(1 + 20*x**4 + 8*y - 19*y**2 - 16*y**3 - 
     -            2*x**3*(2 + 31*y) + x**2*y*(-1 + 62*y) + 
     -            x*(-6 + 7*y + 29*y**2 - 20*y**3)) + 
     -         mhc**2*y*(mc1**2*(-8*x**2 - 8*y + 4*x*(3 + 2*y)) + 
     -            mhc**2*(-2*x**3 + x**2*(11 - 2*y) + 5*y + 
     -               x*(-9 - 7*y + 4*y**2))) + 
     -         mw**2*(-4*mc1**2*
     -             (2*x**4 - 4*x**3*y + 2*y*(1 + y) + 
     -               2*x**2*y*(1 + y) - x*(1 + 3*y + 2*y**2)) + 
     -            mhc**2*(4*x**4 + x**2*(6 - 6*y - 20*y**2) + 
     -               2*y*(4 + 3*y - 8*y**2) + 
     -               x*(-5 - 22*y + 34*y**2 + 16*y**3))))))/
     -  (mw**2*(-2*mc1**2 + mhc**2 + 2*mw**2 + m0**2*(-2 + 4*x - 4*y))*
     -    (mw**2 + 4*m0**2*(x - y))**2*(mw**2 - 4*m0**2*y)**2*
     -    (-2*mc1**2 + mhc**2 + m0**2*(-2 + 4*y)))
      return
      end   ! dsIBwhdxdy_3
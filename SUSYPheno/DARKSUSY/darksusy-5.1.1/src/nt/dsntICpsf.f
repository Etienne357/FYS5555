***********************************************************************
*** dsntICpsf returns the point spread function for the IceCube detector
*** implied by an input angular error sigma, at some observed and predicted
*** angles relative to some position on the sky.  The psf is rescaled so
*** as to produce unit integrated probability over the range [0,phimax]
*** Sigma is interpreted as the 1 sigma error in a single direction of
*** a 2D Gaussian PSF, i.e. the 39.3% confidence value of the angular 
*** deviation (not 68%), and may be given by e.g. the parabaloid sigma
*** for an individual event, or the global mean angular error.
*** 
*** Input:	phi_obs	        observed angle (degrees)
***             phi_pred        predicted angle (degrees)
***             phi_max         maximum angle considered (degrees)
***             sigma           angular error corresponding to 39.3%
***                             containment angle (degrees)
***          
*** Output:			PSF (degrees^-1)
***       
*** Author: Pat Scott (patscott@physics.mcgill.ca)
*** Date: May 6, 2011
***********************************************************************

      real*8 function dsntICpsf(phi_obs, phi_pred, phi_max, sigma)

      implicit none
      include 'dsntIC.h'
      include 'dsge.h'

      real*8 phi_obs, phi_pred, sigma, sigma2, expo, diff
      real*8 phi_max, prefac

      sigma2 = sigma*sigma
      diff = phi_max - phi_pred
      expo = exp(-diff*diff / (2.d0 * sigma2))
      prefac = (1.d0-expo)

      diff = phi_obs - phi_pred
      expo = exp(-diff*diff / (2.d0 * sigma2))
      dsntICpsf = expo*abs(diff)/(sigma2*prefac) 
 
      end function dsntICpsf

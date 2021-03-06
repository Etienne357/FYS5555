
//**.****|****.****|****.****|****.****|****.****|****.****|****.****|****.****|
// * gen_IC_emiss.cc *                             galprop package * 4/25/2002 
//**"****!****"****!****"****!****"****!****"****!****"****!****"****!****"****|

// generate inverse Compton emissivity
/*
  ISRF is in Hz eV cm-3 Hz-1
  -> N(nu)*nu = nu*density in Hz cm-3 Hz-1 = ISRF * eV_to_erg / (h_planck * nu)
  integral  density Hz-1  d(nu) = integral (nu*density Hz-1) d(log nu)
  d(log nu) is constant in this ISRF

Etarget= (h_planck*nu)* erg_to_eV ! target photon energy in eV

CR density  gcr.cr_density is in c/4pi * n(E) [ cm s^-1 sr^-1 cm^-3 MeV^-1]

emissivity (cm^-3 s^-1 sr^-1 MeV^-1)=
(c/4pi)*integral[integral(sigma{Egamma,Eelectron,Etarget} N(nu) *nu dlog nu ) n(E)E dlog(E)]
factor=(eV_to_erg / h_planck)  *  log(nu(2)/nu(1)) * log(Ekin_factor)
*/

using namespace std;//AWS20050624
#include"galprop_classes.h"
#include"galproph.h"

int Galprop::gen_IC_emiss()
{
   cout<<" >>>> gen_IC_emiss"<<endl;

   int stat=0;
   double *ISRF_over_nu, *Etarget, sum;
   int i, ir,ix,iy,iz,ip, i_comp, ielectrons;
   double *IC_cross_section_array; //AWS20001128
   int    iIC_cross_section;       //AWS20001128
   Distribution electrons;

// identify the electrons/positrons IMOS20030217
   if(galdef.n_spatial_dimensions==2) electrons.init(gcr[0].n_rgrid,                 gcr[0].n_zgrid, gcr[0].n_pgrid);
   if(galdef.n_spatial_dimensions==3) electrons.init(gcr[0].n_xgrid, gcr[0].n_ygrid, gcr[0].n_zgrid, gcr[0].n_pgrid);
   electrons = 0.;
   for(i=0, ielectrons=-1; i<n_species; i++)  
      if(100==100*abs(gcr[i].Z)+gcr[i].A)
      {
         ielectrons=i;
 	 electrons+=gcr[ielectrons].cr_density;
         cout<<"  CR "<<gcr[ielectrons].name<<" found as species #"<<ielectrons<<endl;
      }
   if(ielectrons==-1) { cout<<"CR electrons/positrons not found!"<<endl; electrons.delete_array(); return 1; }

   cout<<"gen_IC_emiss: generating ISRF_w and ISRF_over_nu"<<endl;
   Etarget     =new double[galaxy.ISRF[0].n_pgrid];
   ISRF_over_nu=new double[galaxy.ISRF[0].n_pgrid];

   for(int inu=0; inu<galaxy.ISRF[0].n_pgrid; inu++)
      Etarget[inu]=h_planck * galaxy.nu_ISRF[inu] * erg_to_eV;  // target photon energy in eV
 
   double factor=(eV_to_erg /h_planck) *log(galaxy.nu_ISRF[1] /galaxy.nu_ISRF[0]) *log(galdef.Ekin_factor);

   if(galdef.n_spatial_dimensions==2)
   {
      cout<<"generating IC emissivity for n_spatial_dimensions="<<galdef.n_spatial_dimensions<<endl;
      for(ir=0; ir<gcr[ielectrons].n_rgrid; ir++)
      {
         for(iz=0; iz<gcr[ielectrons].n_zgrid; iz++)
         {
            for(i_comp=0; i_comp<galaxy.n_ISRF_components; i_comp++)
            {
//cout<<" "<<ir<<" "<<iz<<" "<<i_comp<<endl;
               for(int inu=0; inu<galaxy.ISRF[0].n_pgrid; inu++)
               {
                  ISRF_over_nu[inu] =galaxy.ISRF[i_comp].d2[ir][iz].s[inu]/galaxy.nu_ISRF[inu];
//cout<<inu<<" "<<ISRF_over_nu[inu];
               }
               for(int iEgamma=0; iEgamma<galaxy.n_E_gammagrid; iEgamma++)
               {
                  for(ip=0; ip<gcr[ielectrons].n_pgrid; ip++)
                  {
                     sum=0.0;
                     for(int inu=0; inu<galaxy.ISRF[0].n_pgrid; inu++)
		     {
		        if(galaxy.E_gamma[iEgamma] > 4.*Etarget[inu]*1.e-6 *pow(gcr[ielectrons].gamma[ip],2)
                                                /(1.+4.*Etarget[inu]*1.e-6/Mele*gcr[ielectrons].gamma[ip])) continue;
                        sum+= ISRF_over_nu[inu]*fjones_cc(gcr[ielectrons].gamma[ip],Etarget[inu]*1.e-6/Mele,galaxy.E_gamma[iEgamma]/Mele);//IMOS20060420
		     }

//cout<<"ir iz i_comp Ekin E_gamma sum cr_density "<<ir<<" "<<iz<<" "<<i_comp<<" "<<gcr[ielectrons].Ekin[ip]
//<<" "<<galaxy.E_gamma[iEgamma]<<" "<<sum<<" "<<gcr[ielectrons].cr_density.d2[ir][iz].s[ip]<<endl;

                     sum*=factor; // to avoid loss of accuracy
                     galaxy.IC_iso_emiss[i_comp].d2[ir][iz].s[iEgamma]+=sum *electrons.d2[ir][iz].s[ip]*gcr[ielectrons].Ekin[ip]; // IMOS20020425
                  }//ip
//cout<<"ir iz i_comp  E_gamma IC_iso_emiss "<<ir<<" "<<iz<<" "<<i_comp<<" "<<" "<<galaxy.E_gamma[iEgamma]
//<<" "<<galaxy.IC_iso_emiss[i_comp].d2[ir][iz].s[iEgamma]<<endl;     
               }//iEgamma
            }//ISRF_components
         }//iz
      }//ir
   }//particle.n_spatial_dimensions==2

///////////////////////////////////////////////////////////////////////////
   if(galdef.n_spatial_dimensions==3)
   {
      cout<<"generating IC emissivity for n_spatial_dimensions="<<galdef.n_spatial_dimensions<<endl;
                                 //AWS20001128 >-----------------
      IC_cross_section_array=
         new double[galaxy.n_E_gammagrid*gcr[ielectrons].n_pgrid*galaxy.ISRF[0].n_pgrid];

      iIC_cross_section=0;
      for      (int iEgamma=0;    iEgamma<galaxy.n_E_gammagrid;iEgamma++)
         for   (    ip     =0;    ip<gcr[ielectrons].n_pgrid;       ip++)
            for(int inu    =0;    inu<galaxy.ISRF[0].n_pgrid;      inu++)
            {
               IC_cross_section_array[iIC_cross_section]=
		 fjones_cc(gcr[ielectrons].gamma[ip],Etarget[inu]*1.e-6/Mele,galaxy.E_gamma[iEgamma]/Mele);//IMOS20060420
               iIC_cross_section++;
            }                     //AWS20001128 -----------------<
            for(ix=0; ix<gcr[ielectrons].n_xgrid; ix++)
            {
               for(iy=0; iy<gcr[ielectrons].n_ygrid; iy++)
               {
                  for(iz=0; iz<gcr[ielectrons].n_zgrid; iz++)
                  {
                     cout<<" gen_IC_emiss ix iy iz "<<ix<<" "<<iy<<" "<<iz<<endl;
                     for(i_comp=0; i_comp<galaxy.n_ISRF_components; i_comp++)
                     {
//cout<<" "<<ix<<" "<<iy<<" "<<iz<<" "<<i_comp<<endl;
                        for(int inu=0; inu<galaxy.ISRF[0].n_pgrid; inu++)
                        {
                           ISRF_over_nu[inu] =galaxy.ISRF[i_comp].d3[ix][iy][iz].s[inu]/galaxy.nu_ISRF[inu];
//cout<<inu<<" "<<ISRF_over_nu[inu];
                        }
                        iIC_cross_section=0; //AWS20001128
                        for(int iEgamma=0; iEgamma<galaxy.n_E_gammagrid; iEgamma++)
                        {
                           for(ip=0; ip<gcr[ielectrons].n_pgrid; ip++)
                           {
                              sum=0.0;
                              for(int inu=0; inu<galaxy.ISRF[0].n_pgrid; inu++)
                              {
                                 if(galaxy.E_gamma[iEgamma] > 4.*Etarget[inu]*1.e-6 *pow(gcr[ielectrons].gamma[ip],2)  // IMOS20030217
                                                         /(1.+4.*Etarget[inu]*1.e-6/Mele*gcr[ielectrons].gamma[ip])) continue;
	                         sum+=ISRF_over_nu[inu]*IC_cross_section_array[iIC_cross_section]; //AWS20001128
                                 iIC_cross_section++;                                              //AWS20001128
	                      }//inu
//AWS20001128    IC_cross_section( galaxy.E_gamma[iEgamma],gcr[ielectrons].Ekin[ip],Etarget[inu] );
// cout<<"ix iz i_comp Ekin E_gamma sum "<<ix<<" "<<iz<<" "<<i_comp<<" "<<gcr[ielectrons].Ekin[ip]
//<<" "<<galaxy.E_gamma[iEgamma]<<" "<<sum<<endl;

	                      sum*=factor; // to avoid loss of accuracy
                              galaxy.IC_iso_emiss[i_comp].d3[ix][iy][iz].s[iEgamma]+=sum *electrons.d3[ix][iy][iz].s[ip]*gcr[ielectrons].Ekin[ip];// IMOS20020425
                           } //ip
                        } //iEgamma
                     } //ISRF_components
                  } //iz
               } //iy
            } //ix
   } //particle.n_spatial_dimensions==3

   if(galdef.verbose>=2)
   {
      for(int icomp=0; icomp<galaxy.n_ISRF_components; icomp++)
      {
         cout<<"   inverse Compton isotropic emissivity for ISRF component #"<<icomp<<endl;
         galaxy.IC_iso_emiss[icomp].print();
      }
   }//galdef.verbose
   electrons.delete_array();  // IMOS20020425
   cout<<" <<<< gen_IC_emiss"<<endl;
   return stat;
}

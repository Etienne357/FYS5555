
//**.****|****.****|****.****|****.****|****.****|****.****|****.****|****.****|
// * tridag_sym_ext.cc *                           galprop package * 3/29/2002
//**"****!****"****!****"****!****"****!****"****!****"****!****"****!****"****|
using namespace std;//AWS20050624
#include <cstdio>
#include <iostream>

//int tridag_sym_ext( float*, float*, float*, float*, float*,int,int);

int tridag_sym_ext_init=0;

int tridag_sym_ext(float  a[], float  b[], float  c[], float  r[], float  u[], int n,int nk) 
{
   int j,key,k,kk,kksym;
   static int NMAX;
/*
#define NMAX 10000000
   static float  gam[NMAX];
   static float  bet[NMAX];
 
   static float   u_sym[NMAX];
*/
   int n_sym=2*n-1; /* dimension of expanded matrix */
   int m=n-1;       /* index of central bin of expanded matrix */
   static float  *gam;
   static float  *bet;
   static float  *u_sym;

   if( tridag_sym_ext_init==0)
   {
      tridag_sym_ext_init=1;
      NMAX=n_sym*nk;
      cout<<"  tridag_sym_ext: initializing arrays: n_sym="<<n_sym<<" nk= "<<nk<<endl;
      cout<<"  tridag_sym_ext: initializing arrays to dimension ="<<NMAX<<endl;
      gam  =new float[NMAX];
      bet  =new float[NMAX];
      u_sym=new float[NMAX];
   }

// the dimensions in x,y,z are different so may need to reallocate: AWS20010123
   if(n_sym*nk>NMAX)
   { 
      cout<<" tridag_sym_ext ... n_sym*nk>NMAX"<<endl;
      cout<<"  tridag_sym_ext: : n_sym="<<n_sym<<" nk= "<<nk<<" NMAX="<<NMAX<<endl;
      NMAX=n_sym*nk;
      cout<<"  tridag_sym_ext: re-initializing arrays: n_sym="<<n_sym<<" nk= "<<nk<<endl;
      cout<<"  tridag_sym_ext: re-initializing arrays to dimension ="<<NMAX<<endl;
      delete[] gam;
      delete[] bet;
      delete[] u_sym;
      gam  =new float[NMAX];
      bet  =new float[NMAX];
      u_sym=new float[NMAX];
   }

   if(b[0] == 0) { printf("\ntridag ... rewrite equations\n\n"); return (1); }

// -------------- lower segment 
#pragma vdir nodep 
   for(k=0,kk=0;k<nk;k++,kk+=n)  bet[k]  =b[m+kk];
#pragma vdir nodep
   for(k=0,kk=0,kksym=0;k<nk;k++,kk+=n,kksym+=n_sym) u_sym[kksym]= r[m+kk]/bet[k];
   for(j=1; j<m; j++) 
   {
#pragma vdir nodep
      for(k=0,kk=0,kksym=0;k<nk;k++,kk+=n,kksym+=n_sym)
      gam[j+kksym] = a[m-j+1+kk]/bet[k];     /* c[j-1]=a'[m-(j-1)]=a'[jj+1] */

#pragma vdir nodep
      for(k=0,kk=0,kksym=0;k<nk;k++,kk+=n,kksym+=n_sym)
         bet[k]    = b[m-j+kk]-c[m-j+kk]*gam[j+kksym];
//      if(bet == 0.) { printf("\ntridag ... tridag failed\n\n"); return (2); }

#pragma vdir nodep
      for(k=0,kk=0,kksym=0;k<nk;k++,kk+=n,kksym+=n_sym)
         u_sym[j+kksym] = (r[m-j+kk]-c[m-j+kk]*u_sym[j-1+kksym])/bet[k];
   }

// -------------- upper segment
   j=m;
#pragma vdir nodep
   for(k=0,kk=0,kksym=0;k<nk;k++,kk+=n,kksym+=n_sym) gam[j+kksym]=a[1+kk]/bet[k];
#pragma vdir nodep
   for(k=0,kk=0,kksym=0;k<nk;k++,kk+=n,kksym+=n_sym) bet[k]=b[kk]-a[kk]*gam[j+kksym];
#pragma vdir nodep
   for(k=0,kk=0,kksym=0;k<nk;k++,kk+=n,kksym+=n_sym) u_sym[j+kksym] = (r[kk]-c[kk] *u_sym[j-1+kksym])/bet[k];

   for(j=m+1; j<n_sym; j++) 
   {
#pragma vdir nodep
      for(k=0,kk=0,kksym=0;k<nk;k++,kk+=n,kksym+=n_sym)
         gam[j+kksym] = c[j-m-1+kk]/bet[k];    

#pragma vdir nodep
      for(k=0,kk=0,kksym=0;k<nk;k++,kk+=n,kksym+=n_sym)
         bet[k]    = b[j-m+kk]-a[j-m+kk]*gam[j+kksym];
//      if(bet == 0.) { printf("\ntridag ... tridag failed\n\n"); return (2); }

#pragma vdir nodep
      for(k=0,kk=0,kksym=0;k<nk;k++,kk+=n,kksym+=n_sym)
         u_sym[j+kksym] = (r[j-m+kk]-a[j-m+kk]*u_sym[j-1+kksym])/bet[k];
   }

// ---------------- substitution -------------------
   for(j=n_sym-2; j>=m;j--)
#pragma vdir nodep
     for(k=0,kk=0,kksym=0;k<nk;k++,kk+=n,kksym+=n_sym) u_sym[j+kksym]=u_sym[j+kksym]-gam[j+1+kksym]*u_sym[j+1+kksym];
   
// ----------------- symmetrical part only required ----
   for(j=0;j<n;j++)
#pragma vdir nodep
      for(k=0,kk=0,kksym=0;k<nk;k++,kk+=n,kksym+=n_sym)u[j+kk]=u_sym[j+m+kksym];

   return (0);
}

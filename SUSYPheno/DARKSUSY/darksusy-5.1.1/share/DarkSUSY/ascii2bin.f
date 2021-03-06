*****************************************************************************
*** Program ascii2bin converts system-independent ascii data files to
*** system-dependent binary files.
*** Author: Joakim Edsjo  edsjo@physto.se
*** Date: 97-12-03
*** Modified: 08-03-31, 11-04-28
*** Updated 11-04-28 to allow for new WimpSim files with 22 masses instead
*** of 19.
*** Updated 2013-01-27 to allow for 28 masses instead of 22.
*****************************************************************************

      program ascii2bin
      implicit none


C------------------------ Variables ------------------------------------

      real*8 phifull(0:91),fconv
      real phitmp(0:91)
      integer i,j,k,l,m,flxkfile,thn,zn
      character*50 filein
      character*50 fileout
      character*255 scr
      character*10 scr2
      character*1 inp
      integer flxk,flt,ch,mi
      real mx
      character*2 wh
      integer nm,nch,nhead
      parameter(nm=28) ! number of masses
      parameter(nch=13) ! number of channels
c      parameter(nhead=37) ! number of header lines to remove (WimpSimp 2.xx)
c      parameter(nhead=44) ! number of header lines to remove (WimpSim 3.01)
      parameter(nhead=50) ! number of header lines to remove (WimpSim 3.03-3.04)
      integer milow(13) ! which mass index that is the lowest for
                        ! each channel
      data milow/1,1,1,1,4,16, ! quarks
     &   1,12,13,1,1,1,1/ ! gluon, gauge bosons, tau, neutrinos
      integer chi2ch(13)
      data chi2ch/1,2,3,4,5,6,7,8,9,11,12,13,14/

C----------------------------------------- Set-up common block variables

      write(*,*)
      write(*,*) '***************************************************'
      write(*,*) '*** Welcome to ascii2bin 3.2 (Jan 27, 2013)     ***'
      write(*,*) '*** This program converts system-independent    ***'
      write(*,*) '*** ascii data files generated by mktab in      ***'
      write(*,*) '*** wimpsim to system-dependent binary files    ***'
      write(*,*) '***************************************************'   
      write(*,*)


c... Number of bins in tables
c... The actual table in the file covers 1:thn
      thn=91  ! Number of bins in theta
      zn=50  ! Number of bins in z

C------------------------------------------------------ Load muon tables

        write(*,*) 'Enter input file name for integrated muon flux',
     &    ' tables (ascii):'
        read(5,'(a)') filein
        write(*,*) filein
        write(*,*) 'Enter output file name for binary file:'
        read(5,'(a)') fileout
        write(*,*) fileout

        write(*,*) 'Loading integrated muon flux tables from file ',
     &    filein
        write(*,*) 'and saving to file ',fileout
        open(unit=13,file=filein,status='old',form='formatted')
        open(unit=14,file=fileout,status='unknown',form='unformatted')
        read(13,500) scr2,flxkfile
        do i=1,nhead-1
          read(13,'(a)') scr
        enddo
 500    format(1x,A10,1x,I3)
c        write(14) flxkfile ! don't write this, as we write tag below instead

        do i=1,2
          if (i.eq.1) then
            write(*,*) '   ...for the Sun...'
          else
            write(*,*) '   ...for the Earth...'
          endif
          do j=1,nch
            write(*,*) '      channel number ',chi2ch(j)
            do k=1,nm
              if (k.ge.milow(j)) then
                read(13,'(a)') scr
                read(scr(8:40),*) flxk,flt,wh,ch,mi,mx
                write(14) 'NY',flxk,flt,wh,ch,mi,mx
                if (flt.ge.7.and.flt.le.12.or.flt.ge.15) then
                   fconv=1.d36
                else
                   fconv=1.d34
                endif
                do l=0,zn-1
                  read(13,2000) (phifull(m),m=0,thn-1)
c                  write(*,*) 'One entry: ',phitmp(0)
                  do m=0,thn-1
                     phitmp(m)=phifull(m)*fconv ! cm^-2(3) -> 10^-30 m^-2(3)
                  enddo
                  write(14) (phitmp(m),m=0,thn-1)
                enddo
              endif
            enddo
          enddo
        enddo
        close(13)
        close(14)
           
      write(*,*) 'Reading and writing of data files completed.'
 
 2000 format(100(1x,E12.6))

      end



















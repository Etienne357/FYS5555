#if 0
* hgagaSM-vars.h
* variable declarations
* generated by FormCalc 7.5 on 27-Sep-2012 9:08
* this file is part of FeynHiggs
#endif

#ifndef VARS_H
#define VARS_H

#include "externals.h"
#include "types.h"
#include "debug.h"

#else

#include "Decay.h"

	ComplexType Sub4(3), Sub5(3), Sub6(3)
	common /hgagaSM_abbrev1s/ Sub4, Sub5, Sub6

	ComplexType Abb1, Abb2, Abb3, Pair1, Pair2, Pair3, Pair4
	ComplexType Pair5, Sub1, Sub2, Sub3
	common /hgagaSM_abbrev1hel/ Abb1, Abb2, Abb3, Pair1, Pair2
	common /hgagaSM_abbrev1hel/ Pair3, Pair4, Pair5, Sub1, Sub2
	common /hgagaSM_abbrev1hel/ Sub3

	ComplexType lint1, lint2, lint4, lint10(Ncc,3), lint3(Ncc)
	ComplexType lint5(3), lint6(Ncc,3), lint7(3), lint8(Ncc,3)
	ComplexType lint9(3)
	common /hgagaSM_loopint1s/ lint1, lint2, lint4, lint10, lint3
	common /hgagaSM_loopint1s/ lint5, lint6, lint7, lint8, lint9

	integer seq(2), Hel(3)
	common /hgagaSM_helvars/ seq, Hel

	integer Gen4
	common /hgagaSM_indices/ Gen4

	ComplexType Cloop(1)
	common /hgagaSM_formfactors/ Cloop

#endif

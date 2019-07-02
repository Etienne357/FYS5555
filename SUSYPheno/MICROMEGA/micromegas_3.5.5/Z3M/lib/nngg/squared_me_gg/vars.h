* vars.h
* variable declarations
* generated by FormCalc 23 Apr 2013 15:15

#include "decl.h"

	double precision S, T, U
	common /kinvars/ S, T, U

	integer Hel(4)
	common /kinvars/ Hel

	double complex Pair3, Pair4, Pair7, Pair5, Pair6, Abb8, Abb9
	double complex Abb10, Abb11, AbbSum93, AbbSum94, AbbSum95
	double complex AbbSum117, AbbSum21, AbbSum100, AbbSum101
	double complex AbbSum102, AbbSum139, AbbSum99, AbbSum114
	double complex AbbSum20, AbbSum142, AbbSum133, AbbSum90
	double complex AbbSum118, AbbSum119, AbbSum154, AbbSum120
	double complex AbbSum148, AbbSum19, AbbSum125, AbbSum126
	double complex AbbSum127, AbbSum112, AbbSum135, AbbSum18
	double complex AbbSum149, AbbSum150, AbbSum25, AbbSum86
	double complex AbbSum138, AbbSum113, AbbSum116, AbbSum115
	double complex AbbSum79, AbbSum131, AbbSum107, AbbSum132
	double complex AbbSum33, AbbSum103, AbbSum27, AbbSum108
	double complex AbbSum53, AbbSum69, AbbSum70, AbbSum110
	double complex AbbSum54, AbbSum55, AbbSum111, AbbSum71
	double complex AbbSum128, AbbSum57, AbbSum17, AbbSum24
	double complex AbbSum98, AbbSum104, AbbSum97, AbbSum105
	double complex AbbSum66, AbbSum61, AbbSum34, AbbSum74
	double complex AbbSum75, AbbSum15, AbbSum155, AbbSum87
	double complex AbbSum30, AbbSum72, AbbSum76, AbbSum67
	double complex AbbSum77, AbbSum78, AbbSum140, AbbSum143
	double complex AbbSum121, AbbSum62, AbbSum141, AbbSum109
	double complex AbbSum39, AbbSum88, AbbSum13, AbbSum85
	double complex AbbSum41, AbbSum14, AbbSum42, AbbSum43
	double complex AbbSum32, AbbSum156, AbbSum96, AbbSum23
	double complex AbbSum83, AbbSum49, AbbSum106, AbbSum36
	double complex AbbSum157, AbbSum89, AbbSum44, AbbSum50
	double complex AbbSum45, AbbSum51, AbbSum52, AbbSum28
	double complex AbbSum37, AbbSum91, AbbSum56, AbbSum92
	double complex AbbSum40, AbbSum82, AbbSum60, AbbSum29
	double complex AbbSum136, AbbSum38, AbbSum147, AbbSum22
	double complex AbbSum146, AbbSum152, AbbSum151, AbbSum26
	double complex AbbSum35, AbbSum65, AbbSum153, AbbSum16
	double complex AbbSum81, AbbSum58, AbbSum12, AbbSum122
	double complex AbbSum46, AbbSum123, AbbSum63, AbbSum144
	double complex AbbSum64, AbbSum124, AbbSum84, AbbSum68
	double complex AbbSum134, AbbSum129, AbbSum145, AbbSum137
	double complex AbbSum73, AbbSum31, AbbSum47, AbbSum80
	double complex AbbSum130, AbbSum59, AbbSum48
	common /abbrev/ Pair3, Pair4, Pair7, Pair5, Pair6, Abb8, Abb9
	common /abbrev/ Abb10, Abb11, AbbSum93, AbbSum94, AbbSum95
	common /abbrev/ AbbSum117, AbbSum21, AbbSum100, AbbSum101
	common /abbrev/ AbbSum102, AbbSum139, AbbSum99, AbbSum114
	common /abbrev/ AbbSum20, AbbSum142, AbbSum133, AbbSum90
	common /abbrev/ AbbSum118, AbbSum119, AbbSum154, AbbSum120
	common /abbrev/ AbbSum148, AbbSum19, AbbSum125, AbbSum126
	common /abbrev/ AbbSum127, AbbSum112, AbbSum135, AbbSum18
	common /abbrev/ AbbSum149, AbbSum150, AbbSum25, AbbSum86
	common /abbrev/ AbbSum138, AbbSum113, AbbSum116, AbbSum115
	common /abbrev/ AbbSum79, AbbSum131, AbbSum107, AbbSum132
	common /abbrev/ AbbSum33, AbbSum103, AbbSum27, AbbSum108
	common /abbrev/ AbbSum53, AbbSum69, AbbSum70, AbbSum110
	common /abbrev/ AbbSum54, AbbSum55, AbbSum111, AbbSum71
	common /abbrev/ AbbSum128, AbbSum57, AbbSum17, AbbSum24
	common /abbrev/ AbbSum98, AbbSum104, AbbSum97, AbbSum105
	common /abbrev/ AbbSum66, AbbSum61, AbbSum34, AbbSum74
	common /abbrev/ AbbSum75, AbbSum15, AbbSum155, AbbSum87
	common /abbrev/ AbbSum30, AbbSum72, AbbSum76, AbbSum67
	common /abbrev/ AbbSum77, AbbSum78, AbbSum140, AbbSum143
	common /abbrev/ AbbSum121, AbbSum62, AbbSum141, AbbSum109
	common /abbrev/ AbbSum39, AbbSum88, AbbSum13, AbbSum85
	common /abbrev/ AbbSum41, AbbSum14, AbbSum42, AbbSum43
	common /abbrev/ AbbSum32, AbbSum156, AbbSum96, AbbSum23
	common /abbrev/ AbbSum83, AbbSum49, AbbSum106, AbbSum36
	common /abbrev/ AbbSum157, AbbSum89, AbbSum44, AbbSum50
	common /abbrev/ AbbSum45, AbbSum51, AbbSum52, AbbSum28
	common /abbrev/ AbbSum37, AbbSum91, AbbSum56, AbbSum92
	common /abbrev/ AbbSum40, AbbSum82, AbbSum60, AbbSum29
	common /abbrev/ AbbSum136, AbbSum38, AbbSum147, AbbSum22
	common /abbrev/ AbbSum146, AbbSum152, AbbSum151, AbbSum26
	common /abbrev/ AbbSum35, AbbSum65, AbbSum153, AbbSum16
	common /abbrev/ AbbSum81, AbbSum58, AbbSum12, AbbSum122
	common /abbrev/ AbbSum46, AbbSum123, AbbSum63, AbbSum144
	common /abbrev/ AbbSum64, AbbSum124, AbbSum84, AbbSum68
	common /abbrev/ AbbSum134, AbbSum129, AbbSum145, AbbSum137
	common /abbrev/ AbbSum73, AbbSum31, AbbSum47, AbbSum80
	common /abbrev/ AbbSum130, AbbSum59, AbbSum48

	integer iint1, iint2, iint3, iint4, iint5, iint6, iint7, iint8
	integer iint9, iint10, iint11, iint12, iint13, iint14, iint15
	integer iint16, iint17, iint18, iint19, iint20, iint21, iint22
	integer iint23, iint24, iint25, iint26, iint27, iint28, iint29
	integer iint30, iint31, iint32, iint33, iint34, iint35, iint36
	integer iint37, iint38, iint39, iint40
	common /loopint/ iint1, iint2, iint3, iint4, iint5, iint6
	common /loopint/ iint7, iint8, iint9, iint10, iint11, iint12
	common /loopint/ iint13, iint14, iint15, iint16, iint17
	common /loopint/ iint18, iint19, iint20, iint21, iint22
	common /loopint/ iint23, iint24, iint25, iint26, iint27
	common /loopint/ iint28, iint29, iint30, iint31, iint32
	common /loopint/ iint33, iint34, iint35, iint36, iint37
	common /loopint/ iint38, iint39, iint40

	integer ij
	common /indices/ ij

	double complex Cloop(1)
	common /formfactors/ Cloop


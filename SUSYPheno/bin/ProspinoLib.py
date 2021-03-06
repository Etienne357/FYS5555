
prospino_code2txtpair = {
    0 : ('~x','~x'),   # ~x is any sparticle : so this is the sum of all subprocs
    1 : ('~gl','~sq'),
    2 : ('~gl','~gl'),
    3 : ('~sq','~sq'),
    4 : ('~sq','~sq_'),
    51 : ('~b1','~b1_'),
    52 : ('~b2','~b2_'),
    55 : ('~b1','~t1_'),
    56 : ('~b1','~t2_'),
    57 : ('~b2','~t1_'),
    58 : ('~b2','~t2_'),
    61 : ('~t1','~t1_'),
    62 : ('~t2','~t2_'),
    71 : ('~gl','~N1'),
    72 : ('~gl','~N2'),
    73 : ('~gl','~N3'),
    74 : ('~gl','~N4'),
    75 : ('~gl','~C1+'),
    76 : ('~gl','~C2+'),
    77 : ('~gl','~C1-'),
    78 : ('~gl','~C2-'),
    81 : ('~sq','~N1'),
    82 : ('~sq','~N2'),
    83 : ('~sq','~N3'),
    84 : ('~sq','~N4'),
    85 : ('~sq','~C1+'),
    86 : ('~sq','~C2+'),
    87 : ('~sq','~C1-'),
    88 : ('~sq','~C2-'),
    111 : ('~N1','~N1'),
    112 : ('~N1','~N2'),
    113 : ('~N1','~N3'),
    114 : ('~N1','~N4'),
    115 : ('~N1','~C1+'),
    116 : ('~N1','~C2+'),
    117 : ('~N1','~C1-'),
    118 : ('~N1','~C2-'),
    122 : ('~N2','~N2'),
    123 : ('~N2','~N3'),
    124 : ('~N2','~N4'),
    125 : ('~N2','~C1+'),
    126 : ('~N2','~C2+'),
    127 : ('~N2','~C1-'),
    128 : ('~N2','~C2-'),
    133 : ('~N3','~N3'),
    134 : ('~N3','~N4'),
    135 : ('~N3','~C1+'),
    136 : ('~N3','~C2+'),
    137 : ('~N3','~C1-'),
    138 : ('~N3','~C2-'),
    144 : ('~N4','~N4'),
    145 : ('~N4','~C1+'),
    146 : ('~N4','~C2+'),
    147 : ('~N4','~C1-'),
    148 : ('~N4','~C2-'),
    157 : ('~C1+','~C1-'),
    158 : ('~C1+','~C2-'),
    167 : ('~C2+','~C1-'),
    168 : ('~C2+','~C2-'),
    201 : ('~eL+','~eL-'),
    202 : ('~eR+','~eR-'),
    203 : ('~ve','~ve'),
    204 : ('~eL+','~ve'),
    205 : ('~eL-','~ve'),
    206 : ('~T1+','~T1-'),
    207 : ('~T2+','~T2-'),
    208 : ('~T1+-','~T2-+'),
    209 : ('~vT','~vT'),
    210 : ('~T1+','~vT'),
    211 : ('~T1-','~vT'),
    212 : ('~T2+','~vT'),
    213 : ('~T2-','~vT'),
    214 : ('~mL+','~mL-'),
    215 : ('~mR+','~mR-'),
    216 : ('~vm','~vm'),
    217 : ('~mL+','~vm'),
    218 : ('~mL-','~vm'),
    249 : ('~?','~?')        # non-regcognised
}


prospino_txtpair2code = dict((tuple(sorted(list(v))),k) for k, v in prospino_code2txtpair.iteritems())


def func_prospino_txtpair2code(txttuple):
    # can insert both tuple/list, ordered/unordered, ex. funcprospino_txtpair2code_adv(['~T1-','~T1+'])
    return prospino_txtpair2code.get(tuple(sorted(list(txttuple))),-1)


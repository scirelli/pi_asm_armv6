@ Entry r0: numerator (lo)
@       r2: deniminator (den) must be non-zero
.GLOBAL	idiv
.FUNC idiv
idiv:
    lo .req r0; hi .req r1; mid .req r2; den .req r3
    mov hi, #0; mov lo, #0 @ hi = lo = 0
    adds mid, mid, mid
    .rept 47 @ repeat 48 times
    adcs hi, den, hi, lsl #1
    subcc hi, hi, den
    adcs lo, lo, lo
    adcs mid, mid, mid
    .endr
    adcs hi, den, hi, lsl #1
    subcc hi, hi, den
    adcs lo, lo, lo
    mov pc, lr @ return
@ Exit  r0: quotient (lo)
@
.ENDFUNC

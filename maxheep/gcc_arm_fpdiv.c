/*---------------------------------------------------------------------------*\

    Project   : A Fast High Precision Fixed Point Divide
    Author    : Henry Thomas <http://henri.net>
    Creation  : 12/7/2005
    Copyright 2005 Henry Thomas

\*---------------------------------------------------------------------------*/

#include "arm_version.h"

#ifndef __arm__
#error "This implementation of fpdiv requires an arm cpu target"
#endif

#define EARLY_OUT 1
#define UNROLL_LOOP 1

#if (ARM_VERSION_ > 4)
#   define USE_CLZ 1
#endif

int32_t fpdiv(register int32_t numerator, register int32_t denominator)
{
    register int32_t quotient;

    asm("num     .req %[numerator]      @ Map Register Equates" NLT
        "den     .req %[denominator]" NLT
        "mod     .req r2" NLT
        "cnt     .req r3" NLT
        "quo     .req r4" NLT
        "sign    .req r12" NLT

        "cmp den, #0                    @ exceptioin if den == zero" NLT
        "beq .div0" NLT

        "eor sign, num, den             @ sign = num ^ den" NLT
        "rsbmi den, den, #0             @ den = -den if den < 0" NLT

        "subs mod, den, #1              @ mod = den - 1" NLT
        "beq .div1                      @ return if den == 1" NLT

        "movs cnt, num                  @ num = -num if num < 0" NLT
        "rsbmi num, num, #0" NLT

        "movs cnt, num, lsr #16         @ return if den >= num << 16" NLT
        "bne .cont" NLT
        "cmp den, num, lsl #16" NLT
        "bhs .numLeDen" NLT
        "\n.cont:" NLT

        "tst den, mod                   @ if(den & (den - 1) == 0)" NLT
        "beq .powerOf2                  @ den is power of 2" NLT

        "stmfd sp!, {r4}                @ push r4 (quo) onto the stack" NLT

#ifdef EARLY_OUT
#   ifdef USE_CLZ

            "clz mod, den" NLT
            "clz cnt, num" NLT
            "sub mod, mod, cnt" NLT

            "rsb cnt, mod, #31" NLT
            "and cnt, cnt, #30" NLT
            "rsb mod, cnt, #32" NLT

            "mov mod, num, lsr mod" NLT
            "mov num, num, lsl cnt" NLT

#   else /* For reasons I can't explain, this code is much faster */

            "mov cnt, #28               @ count difference in leading zeros" NLT
            "mov mod, num, lsr #4       @ between num and den" NLT

            "cmp den, mod, lsr #12" NLT
            "subls cnt, cnt, #16" NLT
            "movls mod, mod, lsr #16" NLT

            "cmp den, mod, lsr #4" NLT
            "subls cnt, cnt, #8" NLT
            "movls mod, mod, lsr #8" NLT

            "cmp den, mod" NLT
            "subls cnt, cnt, #4" NLT
            "movls mod, mod, lsr #4" NLT

            "mov num, num, lsl cnt      @ mod:num = num << cnt" NLT

#   endif /* USE_CLZ */

#   ifndef UNROLL_LOOP

            "rsb cnt, cnt, #32 + 16" NLT

#   endif /* !UNROLL_LOOP */

        "mov quo, #0" NLT
        "rsb den, den, #0               @ negate den for divide loop" NLT

#   ifdef UNROLL_LOOP

            "adds num, num, num         @ start: num = mod:num / den" NLT
            "add pc, pc, cnt, lsl #4    @ skip cnt x 4 x 4 iterations" NLT
            "nop                        @ nop instruction to take care of pipelining" NLT

#   endif /* UNROLL_LOOP */

#else /* !EARLY_OUT */

        "mov quo, #0" NLT
        "mov mod, #0" NLT
        "rsb den, den, #0               @ negate den for divide loop" NLT

#   ifdef UNROLL_LOOP

            "adds num, num, num         @ start: quo = mod:num / den" NLT

#   else

            "mov cnt, #48" NLT

#   endif /* UNROLL_LOOP */

#endif /* EARLY_OUT */

#ifdef UNROLL_LOOP

        ".rept 47                       @ inner loop x 48" NLT
        "    adcs mod, den, mod, lsl #1" NLT
        "    subcc mod, mod, den" NLT
        "    adc quo, quo, quo" NLT
        "    adds num, num, num" NLT
        ".endr" NLT
        "adcs mod, den, mod, lsl #1" NLT
        "subcc mod, mod, den" NLT
        "adc quo, quo, quo" NLT

#else

        ".inner_loop:" NLT
        "    adds num, num, num" NLT
        "    adcs mod, den, mod, lsl #1" NLT
        "    subcc mod, mod, den" NLT
        "    adc quo, quo, quo" NLT
        "    subs cnt, cnt, #1" NLT
        "bne .inner_loop" NLT

#endif /* UNROLL_LOOP */

        "cmp sign, #0                   @ negate quotient if sign < 0" NLT
        "mov num, quo" NLT
        "rsbmi num, num, #0" NLT
        "ldmfd sp!, {r4}                @ pop r4 (quo) off the stack" NLT
        ARM_RETURN

    "\n.div0:" NLT
        "mov num, #0" NLT
        ARM_RETURN

    "\n.div1:" NLT
        "cmp sign, #0" NLT
        "mov num, num, asl #16" NLT
        "rsbmi num, num, #0" NLT
        ARM_RETURN

    "\n.numLeDen:" NLT
        "mov num, #0                    @ quotient = 0 if num < den" NLT
        "moveq num, sign, asr #31       @ negate quotient if sign < 0" NLT
        "orreq num, num, #1             @ quotient = 1 if num == den" NLT
        ARM_RETURN

    "\n.powerOf2:" NLT

#if (ARM_VERSION_ > 4)

        "clz cnt, den                   @ count bits in den" NLT
        "rsb cnt, cnt, #31" NLT

#else

        "mov cnt, #0" NLT

        "cmp den, #(1 << 16)" NLT
        "movhs cnt, #16" NLT
        "movhs den, den, lsr #16" NLT

        "cmp den, #(1 << 8)" NLT
        "addhs cnt, cnt, #8" NLT
        "movhs den, den, lsr #8" NLT

        "cmp den, #(1 << 4)" NLT
        "addhs cnt, cnt, #4" NLT
        "movhs den, den, lsr #4" NLT

        "cmp den, #(1 << 2)" NLT
        "addhi cnt, cnt, #3" NLT
        "addls cnt, cnt, den, lsr #1" NLT

#endif /* ARM_VERSION_ > 4 */

        "rsb mod, cnt, #32" NLT

        "mov den, num, lsr #16          @ den:num = num << 16" NLT
        "mov num, num, lsl #16" NLT

        "mov num, num, lsr cnt          @ num = num >> cnt | den << mod" NLT
        "orr num, num, den, lsl mod" NLT

        "cmp sign, #0" NLT
        "rsbmi num, num, #0             @ negate quotient if sign < 0"

         /* output registers */
        : [quotient] "=r" (quotient)
        /* input registers */
        : [numerator] "0" (numerator), [denominator] "r" (denominator)
        /* clobbered registers */
        : "r2" /* mod */, "r3" /* cnt */, "r12" /* sign */);
    return quotient;
}

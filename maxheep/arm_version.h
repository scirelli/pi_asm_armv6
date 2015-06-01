/*---------------------------------------------------------------------------*\

    Project   : A Fast High Precision Fixed Point Divide
    Author    : Henry Thomas <http://henri.net>
    Creation  : 12/7/2005
    Copyright 2005 Henry Thomas

\*---------------------------------------------------------------------------*/

#ifndef ARM_VERSION_
#define ARM_VERSION_ 4

#ifndef NLT
#define NLT "/n/t"
#endif

#if defined(__ARM_ARCH_5__) \
    || defined(__ARM_ARCH_5T__) \
	|| defined(__ARM_ARCH_5E__) \
    || defined(__ARM_ARCH_5TE__) \
	|| defined(__ARM_ARCH_5TEJ__)
# undef ARM_VERSION_
# define ARM_VERSION_ 5
#endif

#if defined(__ARM_ARCH_6__) \
    || defined(__ARM_ARCH_6J__) \
	|| defined(__ARM_ARCH_6K__) \
    || defined(__ARM_ARCH_6Z__) \
	|| defined(__ARM_ARCH_6ZK__)
# undef ARM_VERSION_
# define ARM_VERSION_ 6
#endif

#if (ARM_VERSION_ > 4) || defined(__ARM_ARCH_4T__)

# define ARM_RETURN     "\n\rbx lr\n\r\t"
# define ARM_RETURNc(x) "\r\nbx" #x " lr\n\r\t"

#else

# define ARM_RETURN     "\r\nmov pc, lr\n\r\t"
# define ARM_RETURNc(x) "\r\nmov" #x "pc, lr\n\r\t"

#endif

#endif /* ARM_VERSION_ */

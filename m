Message-ID: <010201c0ae49$6df089e0$0deca8c0@Ulysses>
From: "Kevin D. Kissell" <kevink@mips.com>
References: <20010314084633.A25674@nevyn.them.org> <20010314195919.A1911@bacchus.dhis.org> <20010314140529.A29525@nevyn.them.org> <20010314202058.B1911@bacchus.dhis.org> <00fc01c0acd3$c881ca80$0deca8c0@Ulysses> <20010316150423.A3529@bacchus.dhis.org>
Subject: Re: Can't build a CONFIG_CPU_NEVADA kernel
Date: Fri, 16 Mar 2001 19:46:23 +0100
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Sender: owner-linux-mips@oss.sgi.com
To: Ralf Baechle <ralf@oss.sgi.com>
Cc: linux-mips@oss.sgi.com
Message-ID: <20010316184623.iuxOHdsoYttt2TZ51xglP-ky7w4CcsA8U3yTkTlJ8yo@z>

> > > Don't think of the r8000; the kernel only uses the -mcpu=r8000 option
> > > because the Nevada CPUs have _somewhat_ similar scheduling properties
> > > to the R8000.  This of it as an independant ISA expension which can
> > > be used with an arbitrary MIPS processor - even a R3000 processor.
> > 
> > In the interests of historical accuracy and general pedantry,
> > let me point out that -mcpu=r8000 is in effect a rather klugy
> > way of saying "-mips4" to compilers that predate official
> > MIPS IV ISA support.  The R8000 was the first MIPS IV
> > CPU, followed by the R10000 and the R5000.  The "Nevada"
> > processors added three implementation specific instructions
> > to the MIPS IV ISA: MAD, MADU, and MUL (targeted multiply).
> > "Correct" usage would be to enable those three instructions
> > with a "-mcpu=nevada", or better still, "-mcpu=r5200" (for 
> > consistency), and to enable the rest of the MIPS IV ISA 
> > with "-mips4" instead of the archaic r8000 hack.
> 
> Your historic facts may be right but the GCC fact aren't.  -mcpu=xxx tell
> GCC to schedule instructions for a certain processor xxx.  This does not
> enable the full use of it's instruction set.  Back in time when I choose
> these options I choose because GCC didn't know -mcpu=r5000 but the R8000
> was supported and it was the closest fit.  Gcc 1.1.2 knows this option
> so I just changed all instances of -mcpu=r8000 into -mcpu=r5000.

As I understand it, the original intention behind -mcpu was to optimise 
instruction scheduling, but it got perverted over time to enable 
instructions as well.  In any case, the R5000 and R8000 have the 
same ISA, but the pipelines are radically different.  The R8K is 
4-way superscalar, with a 2-cycle branch penalty and branch 
prediction.  The R5K is two way supercalar (Int/FP pairs only) 
with classic MIPS branch behavior, etc.

> > Note, furthermore, that -mmad needs to be handled with care: 
> > Prior to MIPS standardizing the instruction as part of 
> > MIPS32, there were four or five subtly (or not so subltly) 
> > different definitions of integer multiply-accumulate for MIPS.  
> > Most use the same opcode, but even those can differ in side 
> > effects (is the rd field interpreted, etc.). A R4650 madd operation
> > will probably behave equivalently on a Nevada CPU, 
> > but certainly not on a Vr41xx part, for example.
> 
> Unfortunately true but there is a reason that QED's manual marks it as an
> proprietary extension ...

Yup.  The quesiton is, does gcc's -mmad option actually
select based on -mcpu or some other variable which
semantics to use, or does it assume R4650 semantics
(I had the impression that it was the R4650 that drove
the implementation of MIPS madd's into gcc - correct
me if I'm wrong).

            Regards,

            Kevin K.

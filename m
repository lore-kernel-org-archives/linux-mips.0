From: Hartvig Ekner <hartvige@mips.com>
Message-ID: <200206190951.g5J9pt620966@copfs01.mips.com>
Subject: Re: Linux and the Sony Playstation
Date: Wed, 19 Jun 2002 11:51:55 +0200 (MEST)
In-Reply-To: <002901c21775$45209190$10eca8c0@grendel> from "Kevin D. Kissell" at Jun 19, 2002 11:39:41 AM
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: owner-linux-mips@oss.sgi.com
To: "Kevin D. Kissell" <kevink@mips.com>
Cc: Hartvig Ekner <hartvige@mips.com>, user alias <linux-mips@oss.sgi.com>
Message-ID: <20020619095155.C37SbWUC16qZp0HMAeXvbbdusfPfgf6iyE8mcKTQFPY@z>

Kevin D. Kissell writes:
> 
> From: "Hartvig Ekner" <hartvige@mips.com>
> To: "user alias" <linux-mips@oss.sgi.com>
> > > From: "Kevin D. Kissell" <kevink@mips.com>
> > > To: <linux-mips@fnet.fr>, <linux-mips@oss.sgi.com>
> > > Subject: Linux and the Sony Playstation 2
> > > Date: Tue, 18 Jun 2002 15:59:57 +0200
> > > 
> > > The Sony PS2 Linux kit has been shipping for nearly
> > > a month now, and I'm frankly astonished at how little
> > > I've seen on this mailing list about it.  For better or
> > > for worse, this changes everything for MIPS/Linux.
> > > The number of MIPS/Linux users worldwide has
> > > just gone up by at least an order of magnitude,
> > > and they are on a platform running a 2.2.1-derived
> > > kernel and using gcc 2.95.2.
> > > 
> > > It's a perfectly usable platform out of the box, but
> > > Carsten has thrown "crashme" at it, and it goes down
> > > relatively quickly.  People trying to port kaffe and
> > > other programs that do double-precision float are
> > > blocked because there's no double precision on the
> > > R5900, and the Sony kernel lacks the Algorithmics
> > > emulator.
> > 
> > The few simple double-precision programs (ala hello world) I ran worked,
> > and the compiler substitutes integer code (softfloat) for any double
> > precision operation. What are the things known not to work?
> 
> You didn't disassemble the code.  The Sony gcc distribution
> is hard-wired to generate soft-float code, even if you 
> specify -mhard-float on the command line.


I did disassemble the code. It generates true FPU code for floats, and
soft-float for double. See the example below:

[hartvige@copps01 test]$ more hellof.c
int main()
{
float a,b;
a = 3.0f;
b = a + 2.0f;
printf("hello world %f\n",b);
}

gcc hellof.c, and disassembling:

0000000000400a70 <main>:
  400a70:       3c1c0fc0        lui     $gp,0xfc0
  400a74:       279c75c0        addiu   $gp,$gp,30144
  400a78:       0399e021        addu    $gp,$gp,$t9
  400a7c:       27bdffc0        addiu   $sp,$sp,-64
  400a80:       afbc0010        sw      $gp,16($sp)
  400a84:       afbf0038        sw      $ra,56($sp)
  400a88:       afbe0034        sw      $s8,52($sp)
  400a8c:       afbc0030        sw      $gp,48($sp)
  400a90:       03a0f021        move    $s8,$sp
  400a94:       3c014040        lui     $at,0x4040
  400a98:       44810000        mtc1    $at,$f0
  400a9c:       00000000        nop
  400aa0:       e7c00020        swc1    $f0,32($s8)
  400aa4:       c7c00020        lwc1    $f0,32($s8)
  400aa8:       3c014000        lui     $at,0x4000
  400aac:       44810800        mtc1    $at,$f1
  400ab0:       00000000        nop
  400ab4:       46010000        add.s   $f0,$f0,$f1
  400ab8:       e7c00024        swc1    $f0,36($s8)
  400abc:       c7cc0024        lwc1    $f12,36($s8)
  400ac0:       8f998054        lw      $t9,-32684($gp)
  400ac4:       0320f809        jalr    $t9
  400ac8:       00000000        nop
  400acc:       8fdc0010        lw      $gp,16($s8)
  400ad0:       8f848018        lw      $a0,-32744($gp)
  400ad4:       24841040        addiu   $a0,$a0,4160
  400ad8:       00403021        move    $a2,$v0
  400adc:       00603821        move    $a3,$v1
  400ae0:       8f998064        lw      $t9,-32668($gp)
  400ae4:       0320f809        jalr    $t9
  400ae8:       00000000        nop
  400aec:       8fdc0010        lw      $gp,16($s8)
  400af0:       03c0e821        move    $sp,$s8


Were you talking about double-precision only, or is there something different
in the kits?

/Hartvig

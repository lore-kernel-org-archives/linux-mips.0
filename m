Message-ID: <004201c23860$85425d10$10eca8c0@grendel>
From: "Kevin D. Kissell" <kevink@mips.com>
References: <37A3C2F21006D611995100B0D0F9B73CBFE213@tnint11.telogy.design.ti.com> <3D477DC3.6C304839@mips.com>
Subject: Re: GAS 4kc question...
Date: Wed, 31 Jul 2002 09:04:17 +0200
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-15"
Content-Transfer-Encoding: 7bit
Sender: owner-linux-mips@oss.sgi.com
To: Carsten Langgaard <carstenl@mips.com>, "Zajerko-McKee, Nick" <nmckee@telogy.com>
Cc: "Linux-Mips (E-mail)" <linux-mips@oss.sgi.com>
Message-ID: <20020731070417.z3YoxzAcKzLKaxwy_ipjXq8eXro4ZHCqJuXxE6-OUmc@z>

To try to reconcile some seemingly contradictory responses,
the multiply-accumulate and the 3-operand, or "targeted" multiply 
instruction were first supported by the IDT R4650 as a superset 
of the MIPS III ISA.  As they proved useful and popular, they
were later integrated into the MIPS32 ISA spec.  Prior to MIPS32
standardizing things, there were several variations on the multiply-accumulate
instruction mnemonics (madd, mac, etc.) and even some variants
on the encoding.  MIPS32 adopted "madd" as the standard
mnemonic, and uses the same encoding as the R4650.  I'm 
not sure what you mean by "mulu".  The origininal MIPS mnemonic
for a 2-operand multiply is "mult", and it has an unsigned counterpart
"multu".  The 3-operand multiply was standardized with the mnemonic
"mul". If an "unsigned" version of that instruction existed, it would be 
"mulu", but no such version  exists, and it's not clear to me that it would
make any sense, given that the definition of the targeted multiply is that 
the specified target GPR gets the *least significant* 32 bits of the product.

As Carsten indicates, "madd" and "mul" are enabled by -mips32
in newer assemblers, but it is also true that -m4650 will cause them
to be assembled correctly in older assemblers.  I have run madd code
generated with the 4650 option successfully on a MIPS 4Kc.

            Regards,

            Kevin K.

----- Original Message ----- 
From: "Carsten Langgaard" <carstenl@mips.com>
To: "Zajerko-McKee, Nick" <nmckee@telogy.com>
Cc: "Linux-Mips (E-mail)" <linux-mips@oss.sgi.com>
Sent: Wednesday, July 31, 2002 8:03 AM
Subject: Re: GAS 4kc question...


> I guess you mean madd and mul (not mulu).
> These instructions are MIPS32 instructions and are most likely not recognized
> by your toolchain.
> Try use the compiler option "-mips32" to verify it.
> So for now I'm afraid you need to hardcode these by hand. We are very close to
> release a MIPS32 compiler, so we don't need these hacks in the future.
> 
> /Carsten
> 
> "Zajerko-McKee, Nick" wrote:
> 
> > Hi,
> >
> > I'm trying to write some inline assembler code that needs the madd and mulu
> > op codes found on the 4KC processor.  I've tried setting the cpu to 4650,
> > but it failed to recognize the mulu instruction.  Can someone give me the
> > magic incantation?  I'm running right now GCC 2.95.3 from Montavista.  I
> > guess one way I can attack it for now is to build the op code by hand, but
> > that is quite dirty, IMHO...
> >
> >   ------------------------------------------------------------------------
> >
> >    Nick Zajerko-McKee.vcfName: Nick Zajerko-McKee.vcf
> >                          Type: VCard (text/x-vcard)
> 
> --
> _    _ ____  ___   Carsten Langgaard   Mailto:carstenl@mips.com
> |\  /|||___)(___   MIPS Denmark        Direct: +45 4486 5527
> | \/ |||    ____)  Lautrupvang 4B      Switch: +45 4486 5555
>   TECHNOLOGIES     2750 Ballerup       Fax...: +45 4486 5556
>                    Denmark             http://www.mips.com
> 
> 
> 
> 

Message-ID: <00d001c2947a$d71231d0$10eca8c0@grendel>
From: "Kevin D. Kissell" <kevink@mips.com>
References: <20021125100152.6471.qmail@mailweb33.rediffmail.com>
Subject: Re: Re: watch exception only for kseg0 addresses..?
Date: Mon, 25 Nov 2002 13:04:28 +0100
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-Path: <kevink@mips.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: atul srivastava <atulsrivastava9@rediffmail.com>, Ralf Baechle <ralf@linux-mips.org>
Cc: linux-mips@linux-mips.org
Message-ID: <20021125120428.piDSbXZwLJoGjlUbnMmor2N4aw3Rh0UytHEVoktZU30@z>

> > Beyond that there
> > are at least two different formats of watch registers implemented 
> > in actual silicon, the original R4000-style and the MIPS32/MIPS64 
> > style watch registers and the kernel's watch code only know the R4000 
> > style.
> 
> my cpu manual ( IDT RC32334) talks about two watch registers 
> CP0_IWATCH and CP0_DWATCH where it is required to just put desired 
> VIRTUAL( bits 2--31) addresses to be watched , there is no mention 
> of CP0_WATCHLO and CP0_WATCHHI .

Your CPU would appear to be neither MIPS32/MIPS64 compliant
nor R4000 backward-compatible.  The designers may have sought 
to simplify the use of watch registers in user space, apparently at the price 
of the restriction you are seeing.

> additionally i guees for userspace virtual watch register problem, 
> the hardware takes care of all , i just need to specify my virual 
> address this is what i understand from my  manual.
> 
> and one more problem i face when i try to debug a mysterious page 
> fault problem, that i get my watch exception but after page fault 
> ..hence I can't really debug , shouldn't the priority of watch 
> exceptions should be higher than atleast instruction fetch 
> exception.? or the scope of debugging by watch exception is 
> limited by design.....

Does your CPU implement EJTAG?

            Kevin K.

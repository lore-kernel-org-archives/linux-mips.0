Message-ID: <01b701c0a7f0$79260ba0$0deca8c0@Ulysses>
From: "Kevin D. Kissell" <kevink@mips.com>
References: <3AA7B13F.F918E1F8@ti.com> <20010308173003.A17217@physik.tu-cottbus.de> <20010308174044.B11107@bacchus.dhis.org>
Subject: Re: Question concerning Assembler error
Date: Thu, 8 Mar 2001 17:54:29 +0100
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Sender: owner-linux-mips@oss.sgi.com
Return-Path: <owner-linux-mips@oss.sgi.com>
To: Ralf Baechle <ralf@oss.sgi.com>, heinold@physik.tu-cottbus.de, linux-mips@oss.sgi.com
Message-ID: <20010308165429.CMpDQslFcFt8cvn0guz4QuM85M21vc4VyZt889-XvoA@z>

> > Hm sorry cant help with the assembler problem, but which machine
> > has a 4600 Prozessor and run mipsel on it?
> 
> RM200C.

Actually, It's far more likely that Jeff is working with a
MIPS 4KC or 5KC CPU core.  -mcpu=r4600 ends up
being the closest fit to the MIPS32 ISA and pipeline
among the options available for the Linux-capable
gcc compilers.

            Kevin K.

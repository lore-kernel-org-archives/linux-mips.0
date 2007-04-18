Received: from mx.mips.com ([63.167.95.198]:8592 "EHLO dns0.mips.com")
	by ftp.linux-mips.org with ESMTP id S20021950AbXDRP2d convert rfc822-to-8bit
	(ORCPT <rfc822;linux-mips@linux-mips.org>);
	Wed, 18 Apr 2007 16:28:33 +0100
Content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Subject: RE: [PATCH 3/16] Kconfig update for lemote fulong mini-PC
Date: Wed, 18 Apr 2007 08:28:16 -0700
Message-ID: <692AB3595F5D76428B34B9BEFE20BC1FC1D723@Exchange.mips.com>
In-Reply-To: <46261DE2.5040908@ict.ac.cn>
References: <11766507651736-git-send-email-tiansm@lemote.com> <11766507661317-git-send-email-tiansm@lemote.com> <11766507661726-git-send-email-tiansm@lemote.com> <11766507662638-git-send-email-tiansm@lemote.com> <20070418120620.GE3938@linux-mips.org> <46261DE2.5040908@ict.ac.cn>
From: "Uhler, Mike" <uhler@mips.com>
Return-Path: <uhler@mips.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: Fuxin Zhang <fxzhang@ict.ac.cn>, Ralf Baechle <ralf@linux-mips.org>
Cc: tiansm@lemote.com, linux-mips@linux-mips.org, Fuxin Zhang <zhangfx@lemote.com>
Message-ID: <20070418152816.X4sCuog5pNGtuAGW0XRuZHPmFtFN6I_9I0jYiLX21bE@z>

> Yes. Most 64bit MIPS processors cannot access 64bit content 
> of registers when it is in 32bit mode.

For clarity, there is no 32/64-bit mode in MIPS processors.  There is a
mode in which 64-bit OPERATIONS are enabled (that is, those instructions
which operate on the full width of the registers) - See the definition
of 64-bit Operations Enable in the MIPS64 Architecture for Programmers,
volume III.  Note that such operations are always enabled while the
processor is running in Kernel Mode.

The patch is a little short on context, but if you've got a 64-bit
kernel, I had always assumed that save/restore of context is always done
with LD/SD, not by figuring out whether a process has 64-bit operations
enabled, then doing a conditional LD/SD or LW/SW.

/gmu
---
Michael Uhler, Chief Technology Officer
MIPS Technologies, Inc.   Email: uhler AT mips.com
1225 Charleston Road      Voice:  (650)567-5025   FAX:   (650)567-5225
Mountain View, CA 94043
   

> -----Original Message-----
> From: linux-mips-bounce@linux-mips.org 
> [mailto:linux-mips-bounce@linux-mips.org] On Behalf Of Fuxin Zhang
> Sent: Wednesday, April 18, 2007 6:32 AM
> To: Ralf Baechle
> Cc: tiansm@lemote.com; linux-mips@linux-mips.org; Fuxin Zhang
> Subject: Re: [PATCH 3/16] Kconfig update for lemote fulong mini-PC
> 
> 
> >> +
> >>     
> >
> > Is there anything in implementation of this option 
> Loongson2-specific?
> >   
> Yes. Most 64bit MIPS processors cannot access 64bit content 
> of registers when it is in 32bit mode.
> 
> Loongson2 has no 32/64 mode bit in fact.
> 
> And the usage arise from Loongson2's multimedia extension, 
> which is also uniq.
> > If not then I suggest we make this option loook like:
> >
> >    bool "Save 64bit integer registers" if 
> CPU_SUPPORTS_64BIT_KERNEL && 
> > 32BIT
> >
> > Somebody else might have a use for it!
> >
> >   Ralf
> >
> >
> >
> >
> >   
> 
> 

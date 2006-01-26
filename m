Received: from 209-232-97-206.ded.pacbell.net ([209.232.97.206]:38339 "EHLO
	dns0.mips.com") by ftp.linux-mips.org with ESMTP id S8133547AbWAZPQr
	(ORCPT <rfc822;linux-mips@linux-mips.org>);
	Thu, 26 Jan 2006 15:16:47 +0000
Message-ID: <005101c6228c$6ebfb0a0$10eca8c0@grendel>
From: "Kevin D. Kissell" <kevink@mips.com>
References: <cda58cb80601250136p5ee350e6g@mail.gmail.com> <20060125124738.GA3454@linux-mips.org> <cda58cb80601250534r5f464fd1v@mail.gmail.com> <43D78725.6050300@mips.com> <20060125141424.GE3454@linux-mips.org> <cda58cb80601250632r3e8f7b9en@mail.gmail.com> <20060125150404.GF3454@linux-mips.org> <cda58cb80601251003m6ba4379w@mail.gmail.com> <43D7C050.5090607@mips.com> <cda58cb80601260702wf781e70l@mail.gmail.com>
Subject: Re: [RFC] Optimize swab operations on mips_r2 cpu
Date: Thu, 26 Jan 2006 16:23:16 +0100
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-Path: <kevink@mips.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: Franck <vagabon.xyz@gmail.com>
Cc: linux-mips@linux-mips.org
Message-ID: <20060126152316.2NknFGgA0zVl4na6TzQglQthVx9o-mbFOJUSWka555U@z>

Could you please post your mipsel-linux-gcc -v output?   It might help.
I've never tried building Linux with any of the Sc/Sd/SmartMIPS options,
so I really don't know what you could be experiencing.  One thought that
comes to mind is that the -march=4ksd option may be treated as a hint to
generate compact code (for smart cards) in a way that -march=mips32r2
is not.  I'll ask around...

        Regards,

        Kevin K.

----- Original Message ----- 
From: "Franck" <vagabon.xyz@gmail.com>
To: "Kevin D. Kissell" <kevink@mips.com>
Cc: <linux-mips@linux-mips.org>
Sent: Thursday, January 26, 2006 4:02 PM
Subject: Re: [RFC] Optimize swab operations on mips_r2 cpu


> Kevin
> 
> 2006/1/25, Kevin D. Kissell <kevink@mips.com>:
> > Not really.  As we discussed at the time, the 4KSc is a superset of
> > MIPS32 which includes some, but not all MIPS32R2 features (plus other
> > stuff), and the 4KSd is a strict superset of MIPS32R2.  So some additional
> > information is required to express the desired support.  I was just pointing
> > out, in the case of the SWAB optimizations, that there was no need to invent
> > yet another way of describing MIPS32R2.
> >
> 
> I'm trying to use CPU_MIPS32_R2 instead of CPU_4KD in order to get rid
> of the last macro. So now to compile the kernel I'm using somthing
> like:
> 
>         mipsel-linux-gcc -march=mips32r2 -Wa,-32 -Wa,-mips32r2 -msmartmips
> 
> instead of
> 
>         mipsel-linux-gcc -march=4ksd -Wa,-32 -Wa,-mips32r2 -msmartmips
> 
> Now the size of the kernel code is 33Ko bigger ! I have no idea
> why...I tried to add -mips16e option but it fails to compile...Do you
> have an idea ?
> 
> Thanks
> --
>                Franck
> 
> 

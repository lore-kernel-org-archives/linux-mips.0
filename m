Message-ID: <01e401c2e2a2$f1866010$10eca8c0@grendel>
From: "Kevin D. Kissell" <kevink@mips.com>
References: <3E651FB7.A38AFD3B@broadcom.com>
Subject: Re: [PATCH] kernelsp on 64-bit kernel
Date: Wed, 5 Mar 2003 00:08:03 +0100
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-Path: <kevink@mips.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: Kip Walker <kwalker@broadcom.com>, linux-mips@linux-mips.org
Cc: Ralf Baechle <ralf@linux-mips.org>
Message-ID: <20030304230803.-Wdy4xWeZx4aybL4nk53eToLONheZHoWvNHIGdLcGZ8@z>

> Is anyone else interested in having the 64-bit kernel *not* use the CP0
> watchpoint registers for storing the kernel stack pointer for the CPU's
> current process?
> 
> I have a couple problems with this:
>  - there are read-only bits in watchhi (according to the MIPS64 spec) so
> hoping to save and restore all high 32 bits (as currently coded) seems
> unjustified.
>  - somebody might want to actually *use* watchpoints (a JTAG debugger,
> in my case)

For whatever it's worth, I've always maintained that stealing the Watchpoint
registers in this way was a pretty questionable hack to be avoided.  Watchpoint
registers are *optional* in MIPS64 and may not even exist.  And yes, someone
might want to use them for their intended purpose some day.  However, please
note that the EJTAG breakpoint registers are completely orthogonal to the
watchpoint registers.

            Regards,

            Kevin K.

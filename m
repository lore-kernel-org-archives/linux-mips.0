Message-ID: <00ef01bf5859$6d11f410$0ceca8c0@satanas.mips.com>
From: "Kevin D. Kissell" <kevink@mips.com>
Subject: Re: Decstation 5000/150 2.3.21 Boot successs
Date: Thu, 6 Jan 2000 16:19:27 +0100
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Sender: owner-linuxmips@oss.sgi.com
Return-Path: <owner-linuxmips@oss.sgi.com>
To: Ralf Baechle <ralf@oss.sgi.com>
Cc: Florian Lohoff <flo@rfc822.org>, linux@cthulhu.engr.sgi.com
Message-ID: <20000106151927.uYhRbwDfFiWna8tlQdVfuwzbz3hOg3iqd4sPkO5n884@z>


-----Original Message-----
From: Ralf Baechle <ralf@oss.sgi.com>
To: Kevin D. Kissell <kevink@mips.com>
Cc: Florian Lohoff <flo@rfc822.org>; linux@cthulhu.engr.sgi.com
<linux@cthulhu.engr.sgi.com>
Date: Thursday, January 06, 2000 3:27 PM
Subject: Re: Decstation 5000/150 2.3.21 Boot successs


>On Thu, Jan 06, 2000 at 10:12:21AM +0100, Kevin D. Kissell wrote:
>
>> The "setting flush to zero/Unimlemented exception"
>> problem is almost certainly due to the fact that the
>> DECstation binaries were compiled for R3000-based
>> platforms with R3K-style FPUs which have 32 single-precision
>> FP regs that can also be treated pairwise as 16
>> double-precision registers.  I didn't know that the 5000 line
>> had R4000 CPUs in them, but on the basis of your reported
>> CPU revision number, that's what you've got.
>>
>> The default SGI/MIPS Linux kernel startup sets the
>> "FR" bit in the CP0.Status register, which enables
>> R4000-style FPU registers, which is to say a full
>> compliment of 32 double-precision registers...
...
>Linux _never_ changes the FR flag.  In fact it's living in the assumption
>that once the firmware hands over the control to the kernel the FR flag
>has been configured apropriately.  For a 32-bit kernel the binaries available
>out there more or less conform to the MIPS ABI which uses the 16/32
>register model, that is the kernel expects the FR flag to be cleared.

Thanks for the correction.  Note that the tweak to head.S I suggested
simply adds FR to the bits to be cleared in case they happen to be
set.   My problem evidently was, and Florian's problem probably is, that
the firmware was leaving FR set when Linux booted, and the DECstation
binaries can't handle that configuration.   What I can say with some
confidence is that those odd error messages *will* result if Linux
boots on an R4000 with FR set, and tries to execute DECstation
binaries.

>In firm assumption that due all the practical problems involved with
>a non-standard execution model (i.e. 32-bit, o32-style ELF, 32/32
>register model and 32-bit gprs) I decieded that in practice nobody will
>use this and dumped all the support for it from later 2.3 kernels.  That
>is the scheduler will no longer try to handle context switching for
>the 32/32 fpr model correctly etc.
>
>If that's desired, how about providing a syscall which allows to manipulate
>this and possibly other bits?

I very much prefer the idea of having exec() to the right thing, so
that 32/32 fpr and o32 ABI programs can be mixed and matched
as appropriate - assuming, of course, that there's sufficient information
in the binary header to do the job!  In practical terms, given that
Linux is a multiuser and multitasking system, a syscall that throws
some sort of global switch could only be safely invoked once
at boot time, and as such offers little advantage over hardwired
kernel code.

            Regards,

            Kevin K.

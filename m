Message-ID: <002f01c1ba1c$d6d7c4c0$0deca8c0@Ulysses>
From: "Kevin D. Kissell" <kevink@mips.com>
References: <3C6C6ACF.CAD2FFC@mvista.com> <20020215031118.B21011@dea.linux-mips.net> <20020214232030.A3601@mvista.com> <20020215003037.A3670@mvista.com> <002b01c1b607$6afbd5c0$10eca8c0@grendel> <20020219140514.C25739@mvista.com> <00af01c1b9a2$c0d6d5f0$10eca8c0@grendel> <20020219171238.E25739@mvista.com> <20020220140917.C15588@dea.linux-mips.net>
Subject: Re: FPU emulator unsafe for SMP?
Date: Wed, 20 Feb 2002 15:42:33 +0100
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Sender: owner-linux-mips@oss.sgi.com
To: Ralf Baechle <ralf@oss.sgi.com>, Jun Sun <jsun@mvista.com>
Cc: linux-mips@oss.sgi.com
Message-ID: <20020220144233.qFRW_PD7_pSdkl8srbioKqwz-DU2tsCbb8OewuBeT4A@z>

Ralf wrote:
> On Tue, Feb 19, 2002 at 05:12:38PM -0800, Jun Sun wrote:
> 
> > > It's gotta be done.  I mean, the last I heard (which was a long
> > > time ago) mips64 Linux was keeping the CPU node number in
> > > a watchpoint register (or something equally unwholesome)
> > 
> > It seems that people are getting smarter by putting cpu id to
> > context register.  In fact isn't this part of new MIPS
> > standard?
> 
> The context register is actually intended to be used for indexing a flat
> 4mb array of pagetables on a 32-bit processor.  It's a bit ill-defined
> on R4000-class processors as it assumes a size of 8 bytes per pte, so
> cannot be used in the Linux/MIPS kernel without shifting bits around.

I think what Jun Sun is alluding to is the fact that MIPS
has announced that the next revision of the MIPS privileged
resource architecture will support "variable geometry" MMU
features that will, among other things, allow for the Context
register to be configured to provide for smaller PTEs and
non-flat page table organizations.  It was announced and 
described at Microprocessor Forum last year.  The spec 
has been stable for a long time now, but I don't know 
if it's yet public.

            Regards,

            Kevin K.

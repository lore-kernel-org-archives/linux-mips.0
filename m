Message-ID: <007901c120d6$c0f29ca0$0deca8c0@Ulysses>
From: "Kevin D. Kissell" <kevink@mips.com>
References: <54045BFDAD47D5118A850002A5095CC30AC570@exchange1.cam.pace.co.uk> <007001c120d4$22a24520$0deca8c0@Ulysses>
Subject: Re: RM5231A Cause Register Values
Date: Thu, 9 Aug 2001 15:25:25 +0200
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Sender: owner-linux-mips@oss.sgi.com
To: "Kevin D. Kissell" <kevink@mips.com>, Phil Thompson <Phil.Thompson@pace.co.uk>, linux-mips@oss.sgi.com
Message-ID: <20010809132525.UgKJQhJfCLnSvzvMGPtsfmuTOqGelDlilQQv8kIGJmY@z>

Oh, yeah, and the fact that you're seeing no other bits
set in the Cause register is indicative of it being a
"spurious" interrupt, which was presumably raised
while you were doing another interrupt service which
coincidentally cleared the cause.   That's consistent
with your report of seeing it under heavy interrupt
load. You should be able to just return from interrupt.

            Kevin K.

----- Original Message -----
From: "Kevin D. Kissell" <kevink@mips.com>
To: "Phil Thompson" <Phil.Thompson@pace.co.uk>; <linux-mips@oss.sgi.com>
Sent: Thursday, August 09, 2001 3:06 PM
Subject: Re: RM5231A Cause Register Values


> That bit should be the "IV" bit on the R52xx, which is actually
> a control bit, not a status indication.  The set value implies
> that interrupt exceptions are being vectored to offet 0x200
> instead of 0x180.  It should not be changing on its own!
>
>             Kevin K.
>
> ----- Original Message -----
> From: "Phil Thompson" <Phil.Thompson@pace.co.uk>
> To: <linux-mips@oss.sgi.com>
> Sent: Thursday, August 09, 2001 2:39 PM
> Subject: RM5231A Cause Register Values
>
>
> > In my low level assembler interrupt handler I'm detecting a Cause
register
> > value of 0x00800000. According to "See MIPS Run", the bit that is set
> should
> > be zero - but I haven't been able to find any RM5231A documentation that
> > defines this bit as anything else.  Any ideas?
> >
> > BTW, the exception is raised under fairly heavy network traffic and in
> > either disable_irq_nosync() or ei_start_xmit(). The latter is in the
> network
> > card driver and itself contains a call to disable_irq_nosync(). I don't
> > believe (although I may be wrong) that this was happening under the old
> > style interrupt code.
> >
> > Thanks,
> > Phil
>

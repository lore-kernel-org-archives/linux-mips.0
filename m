Received: from dns0.mips.com ([63.167.95.198]:42187 "EHLO dns0.mips.com")
	by ftp.linux-mips.org with ESMTP id S20031417AbXJ0SNl (ORCPT
	<rfc822;linux-mips@linux-mips.org>); Sat, 27 Oct 2007 19:13:41 +0100
Message-ID: <003801c818c4$1cbe0150$8603a8c0@Ulysses>
From: "Kevin D. Kissell" <KevinK@mips.com>
References: <20071027221105.2329b0e6.tnishioka@mvista.com>
Subject: Re: About the changes in co_timer_ack() function of time.c.
Date: Sat, 27 Oct 2007 11:06:34 -0700
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-Path: <KevinK@mips.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: tnishioka <tnishioka@mvista.com>, linux-mips@linux-mips.org
Message-ID: <20071027180634.rOWvYjuJXi6utSdD3RH52stXia_Sr-XAHXD3n1Tt8hY@z>

The difference is that, in the case where we are *way* behind in interrupt
processing, such that the Count value has gone beyond the to the next tick 
interrupt value, the 2.6.10 code will only try to catch up by a single inteval,
which may result in having to wait 4 billion cycles for the Count to wrap.
The 2.6.23.1 version (a) repeats until the programmed Compare value is
ahead of Count, and (b)  resamples the count register value each time 
through the loop, which is important if other interrupts may be enabled
while c0_timer_ack() is running, which  I could imagine that making a material
difference in the presnece of "interrupt storms" from I/O devices.

But there's still a race.  The only way to get it 100% right is to structure
it as a "do {} while" loop, with the test *after* the programming of compare.
I've been submitting patches to this effect since 2000.  See
http://www.linux-mips.org/archives/linux-mips/2000-01/msg00072.html
It's deja-vu all over again.

If I wanted to be pendantic, I would argue that the 2.6.23 is still vulnerable
to the Count register passing the Compare target between the "if" and the
write_c0_compare(), and that it would be more airtight to code it more
like:
            expirelo = read_c0_count();
            do {
                expirelo += cycles_per_jiffy;
                write_c0_compare(expirelo);
            } while (((read_c0_count()) - expirelo < 0x7fffffff);


It may well be that the initial value of expirelo should be derived
from read_c0_compare() and not read_c0_count().  That would
preserve synchronization of clock ticks against external wall-clock time,
though the removal of the "slop" would mean that there would be
slighly more interrupt service events per unit of real time.

But I gave up tilting at these windmills a long, long time ago... ;o)

            Regards,

            Kevin K.

----- Original Message ----- 
From: "tnishioka" <tnishioka@mvista.com>
To: <linux-mips@linux-mips.org>
Sent: Saturday, October 27, 2007 6:11 AM
Subject: About the changes in co_timer_ack() function of time.c.


> 
> Hi all,
> 
> I DO know you guys must be very busy always, so I am sorry to disturb you.
> I please ask you to let me know the reason why the changes made in co_timer_ack()
> function on Mips kernel v2.6.23.1.
> Because I got a problem on kernel v2.6.10 that the timer interrupt had ignored rarely
> and it causes no updates for "jiffies" for a while (approx. 4min on my board).
> And I found the change - a part of your excellent works - on v2.6.23.1
> for co_timer_ack() function in time.c.
> 
> v2.6.10 kernel:
>                 /* Check to see if we have missed any timer interrupts.  */
>                 count = read_c0_count();
>                 if ((count - expirelo) < 0x7fffffff) {
>                         /* missed_timer_count++; */
>                         expirelo = count + cycles_per_jiffy;
>                         write_c0_compare(expirelo);
>                 }
> 
> v2.6.23.1 kernel:
>                 /* Check to see if we have missed any timer interrupts.  */
>                 while (((count = read_c0_count()) - expirelo) < 0x7fffffff) {
>                         /* missed_timer_count++; */
>                         expirelo = count + cycles_per_jiffy;
>                         write_c0_compare(expirelo);
>                 }
> 
> So, I plase ask you a couple of my questions -
> 1) What kind of phenomena did this change cause ?
> 2) What is the defect that this part of codes in v2.6.10 kernel has ?
> Please let me know.
> 
> Thanks,
> 
> Best regards,
> tnishioka
> 
> 

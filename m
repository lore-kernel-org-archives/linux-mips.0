Date: Sat, 24 Nov 2001 11:44:40 +0000 (GMT)
From: Dave Airlie <airlied@csn.ul.ie>
Subject: Re: advice on dz.c
In-Reply-To: <20011123162710.D1048@holomorphy.com>
Message-ID: <Pine.LNX.4.32.0111241140030.16093-100000@skynet>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: owner-linux-mips@oss.sgi.com
To: William Lee Irwin III <wli@holomorphy.com>
Cc: linux-mips@oss.sgi.com
Message-ID: <20011124114440.L6B7v1O7njHsHbxJh7e_Q7Y8PxUf0DuwsHj4KbUJ5z4@z>


This is unusual I've just taken a run down through a diff of 1.17 and 1.22
from the MIPS CVS tree and I can't see anything that could cause breakage
that has been changed... I'd try commentined out the DZ_DEBUG stuff.. this
isn't meant to be called... unless someone wants to specifically debug
their dz.c on a decstation.... otherwise it should be switched off..

Granted to code doesn't look like it would compile with it off..

Dave.

On Fri, 23 Nov 2001, William Lee Irwin III wrote:

> startup() in the 2.4.14 dz.c appears to either not terminate or to
> bring down the kernel on a DecStation 5000/200. The 2.4.5 dz.c when
> put it in its place appears to work properly, modulo some strangeness
> in terminal emulation at runtime.
>
> Unfortunately, attempts to isolate what difference creates the problem
> failed to reveal the true cause of this. The kernel appears to die
> immediately after restore_flags(). This appears unusual to me as the
> changes are largely cosmetic.
>
> I also tried extending the extent of the code over which interrupts
> are disabled, to no avail. After extending it to what apparently was
> the entire extent of the driver's ->open code the kernel died somewhere
> between enabling interrupts again and the printk immediately after
> the return to tty_open(). It did not appear that the driver was
> re-entered at this point, as printk's for the other entry points
> failed to trigger.
>
>
> I am interested in suggestions as to what code changes I should make
> in order to bring this driver into a more robust state so that I myself
> can repair the code for use on one of my own personal machines.
>
>
> Thanks,
> Bill
>

-- 
David Airlie, Software Engineer
http://www.skynet.ie/~airlied / airlied@skynet.ie
pam_smb / Linux DecStation / Linux VAX / ILUG person

From: Kanoj Sarcar <kanoj@google.engr.sgi.com>
Message-ID: <200104111800.LAA23131@google.engr.sgi.com>
Subject: Re: CVS Update@oss.sgi.com: linux
Date: Wed, 11 Apr 2001 11:00:15 -0700 (PDT)
In-Reply-To: <20010411093556.B1337@bacchus.dhis.org> from "Ralf Baechle" at Apr 11, 2001 09:35:56 AM
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: owner-linux-mips@oss.sgi.com
To: Ralf Baechle <ralf@oss.sgi.com>
Cc: Kanoj Sarcar <kanoj@oss.sgi.com>, linux-origin@oss.sgi.com, linux-mips@oss.sgi.com
Message-ID: <20010411180015.dFC6-G_hTkCVORsEd99AHm0-XAmT7ddkvwJIwXDHVIs@z>

> 
> On Tue, Apr 10, 2001 at 03:42:48PM -0700, Kanoj Sarcar wrote:
> 
> > CVSROOT:	/home/pub/cvs
> > Module name:	linux
> > Changes by:	kanoj@oss.sgi.com	01/04/10 15:42:47
> > 
> > Modified files:
> > 	drivers/char   : serial.c 
> > 
> > Log message:
> > 	Fix the IP27 serial driver after the 2.4.3 merge. This is what you
> > 	need in /etc/inittab: "7:2345:respawn:/sbin/getty ttyS0 DT9600".
> > 	mingetty can also probably be made to work.
> 
> Mingetty starts ok but it's impossible to enter something.  This is caused
> by CREAD being cleared on the tty.  I don't know why this happens; it
> started in 2.4.3.
> 
>   Ralf
> 

receive_chars() was updated to look at ignore_mask ... if CREAD is not
set, around the time of opening via ioctls etc, it will not take inputs.
I haven't figured the details out, but I believe it is more of a *getty
config issue than anything else. 

Kanoj

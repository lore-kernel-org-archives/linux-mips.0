Message-ID: <20030309072432.19644.qmail@web41511.mail.yahoo.com>
Date: Sat, 8 Mar 2003 23:24:32 -0800 (PST)
From: Tinga Shilo <tingashilo@yahoo.com>
Subject: Re: static variables access and gp
In-Reply-To: <20030306094034.A26071@mvista.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-Path: <tingashilo@yahoo.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: Jun Sun <jsun@mvista.com>
Cc: linux-mips@linux-mips.org
Message-ID: <20030309072432.noEKvJW9biC7yrMTGpgVqoHo21Y1iISeIflhY0mgLuA@z>

Thx. Got it.
Any other solution to speed up the access to this
variable ? It's location never changes from kernel
init to shutdown if I haven't made that clear.

--- Jun Sun <jsun@mvista.com> wrote:
> On Wed, Mar 05, 2003 at 11:30:17PM -0800, Tinga
> Shilo wrote:
> > Hi,
> > I am implementing a kernel mechanism which is 
> > very performance oriented. Along my long critical
> > path,
> > there is a static variable that needs to be
> accessed
> > quite a few times. This variable is a structure
> which
> > is approximately 60 bytes big.
> > In there any way I can "convince" my kernel
> (compiled
> > with gcc) to access this variable using gp ?
> > Is gp usually used for this purpose in mips-linux
> ?
> > Can it be ?
> >
> 
> No.  gp is used by kernel to hold current process in
> 2.4
> and current thread in 2.5.  Don't mess with it
> unless
> you are absolutely sure what you are doing.
> 
> Jun


__________________________________________________
Do you Yahoo!?
Yahoo! Tax Center - forms, calculators, tips, more
http://taxes.yahoo.com/

Date: Mon, 31 Mar 2003 16:37:12 -0800 (PST)
From: Muthukumar Ratty <muthu@iqmail.net>
Subject: Re: mips5kc - cpu registers
In-Reply-To: <009401c2f7aa$0137f2a0$10eca8c0@grendel>
Message-ID: <Pine.LNX.4.33.0303311634180.16351-100000@Muruga.localdomain>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-Path: <muthu@iqmail.net>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: "Kevin D. Kissell" <kevink@mips.com>
Cc: Amit.Lubovsky@infineon.com, linux-mips@linux-mips.org
Message-ID: <20030401003712.-lrknx4nlT-AcHwaeG-TV5AVQ3jDbXWNLqMfnSU6ZCA@z>


> In general, gcc (and most other compilers)
> will do this for you automatically if you enable
> any reasonable level of optimization.  There
> is no need to designate the variable as "FAST",
> one simply needs to avoid having it be global,
> static, or volatile.

just to add to that... you shouldnt have referred to the address of the
variable. Even if you do, say &tmp, and never assigned it to any ptr,
gcc will not use register for that var.







>
> ----- Original Message -----
> From: <Amit.Lubovsky@infineon.com>
> To: <linux-mips@linux-mips.org>
> Sent: Monday, March 31, 2003 6:45 PM
> Subject: mips5kc - cpu registers
>
>
> > Hi,
> > is there a possibility to use cpu registers in the code (temporarily)
> > instead of allocating
> > automatic variables something like:
> > func a()
> > {
> > FAST int, i, tmp;
> > tmp = ...
> > ...
> > }
> >
> > as in vxWorks ?
> >
> > Thanks,
> > Amit.
> >
> >
>

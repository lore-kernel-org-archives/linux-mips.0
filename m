Date: Mon, 8 Jul 2002 01:06:40 -0700 (PDT)
From: Muthukumar Ratty <muthu5@sbcglobal.net>
Subject: Re: Problem with sizeof?
In-Reply-To: <3D293FEF.40C04FD2@multitech.co.in>
Message-ID: <Pine.LNX.4.33.0207080100100.30691-100000@Muruga.localdomain>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: owner-linux-mips@oss.sgi.com
To: Venkatesh M R <venkatesh@multitech.co.in>
Cc: linux-mips@oss.sgi.com
Message-ID: <20020708080640.1-ejZWzg0eeKd4BNROsd0eLsIoSjBrjHOBkqeZt8yrs@z>

> I am  not sure, but can this be memory allignment problem ?
> you can check this by adding one more (dummy ) element of __u32 length (MIPS
> should print 40 insted of 44 and pc shuld print 40 as expected )

You are right. when I add a __u32 dummy  to the tc_stats then it still
prints the size as 40. Is it get padded at the end? My main concern is,
is this a normal behavior or do I need to upgrade my MIPS build
environment?
Thanks a lot,
Muthu.

>
> if  it works then you can get rid of the above problem by changing the
> compilar settings.
>
> Regards,
> venkatesh M R
>
>
>
>
> Muthukumar Ratty wrote:
>
> > Hi,
> > In my MIPS system sizeof(struct tc_stats) returns 40 but it returns 36 in
> > i386 PC.
> >
> > tc_stats is defined in include/linux/pkt_sched.c as
> > struct tc_stats
> > {
> >         __u64   bytes;                  /* NUmber of enqueues bytes */
> >         __u32   packets;                /* Number of enqueued packets   */
> >         __u32   drops;                  /* Packets dropped because of lack
> > of resources */
> >         __u32   overlimits;             /* Number of throttle events when
> > this
> >                                          * flow goes out of allocated
> > bandwidth*/
> >         __u32   bps;                    /* Current flow byte rate */
> >         __u32   pps;                    /* Current flow packet rate */
> >         __u32   qlen;
> >         __u32   backlog;
> > #ifdef __KERNEL__
> >         spinlock_t *lock;
> > #endif
> > };
> > I printed the offsets of individual fields and they are same in i386 and
> > MIPS. If the "spinlock_t" is defined then this may be the case but I
> > am compiling an application, so it shouldnt be there? Right now I
> > think the problem could be with the "sizeof" operator.
> > Could someone please let me know if this is the case or I am doing
> > something wrong. Also any solution.
> >
> > The versions are
> > kernel : 2.4.3
> > gcc    : gcc version 3.1
> > binutils : 2.11.93
> > glibc : 2.2.5
> >
> > Thanks,
> > Muthu.
>

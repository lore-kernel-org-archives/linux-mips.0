Date: Mon, 8 Jul 2002 00:12:28 -0700 (PDT)
From: Muthukumar Ratty <muthu5@sbcglobal.net>
Subject: Problem with sizeof?
Message-ID: <Pine.LNX.4.33.0207072331170.29856-100000@Muruga.localdomain>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: owner-linux-mips@oss.sgi.com
To: linux-mips@oss.sgi.com
Message-ID: <20020708071228.kPw4_y5fPcgJWOF_nPPZQVsOs39es65MuFK4rVFZaoQ@z>



Hi,
In my MIPS system sizeof(struct tc_stats) returns 40 but it returns 36 in
i386 PC.

tc_stats is defined in include/linux/pkt_sched.c as
struct tc_stats
{
        __u64   bytes;                  /* NUmber of enqueues bytes */
        __u32   packets;                /* Number of enqueued packets   */
        __u32   drops;                  /* Packets dropped because of lack
of resources */
        __u32   overlimits;             /* Number of throttle events when
this
					 * flow goes out of allocated
bandwidth*/
        __u32   bps;                    /* Current flow byte rate */
        __u32   pps;                    /* Current flow packet rate */
        __u32   qlen;
        __u32   backlog;
#ifdef __KERNEL__
        spinlock_t *lock;
#endif
};
I printed the offsets of individual fields and they are same in i386 and
MIPS. If the "spinlock_t" is defined then this may be the case but I
am compiling an application, so it shouldnt be there? Right now I
think the problem could be with the "sizeof" operator.
Could someone please let me know if this is the case or I am doing
something wrong. Also any solution.

The versions are
kernel : 2.4.3
gcc    : gcc version 3.1
binutils : 2.11.93
glibc : 2.2.5

Thanks,
Muthu.

Date: Thu, 23 Sep 1999 01:29:02 -0600
From: sparker@taz.cs.utah.edu (Steven G. Parker)
Message-ID: <9909230129.ZM763626@taz.cs.utah.edu>
In-Reply-To: Rory Hunter <roryh@dcs.ed.ac.uk>
        "Re: oddness" (Sep 23,  8:16am)
References: <37E95D52.AC2CE967@dcs.ed.ac.uk>  <37E96210.64A50BBF@csd.sgi.com>
	<37E9D3C8.F665545A@dcs.ed.ac.uk>
Subject: Re: oddness
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Sender: owner-linux@cthulhu.engr.sgi.com
To: Rory Hunter <roryh@dcs.ed.ac.uk>
Cc: "linux@cthulhu.engr.sgi.com" <linux@cthulhu.engr.sgi.com>
Message-ID: <19990923072902.T3zaEpCSMHfgsA4y3YgdMKVUnGlZJC3CD-ITtLqot0k@z>


From the df man page:
     The proc filesystem (normally mounted under /proc) is not printed by
     default, but can be explicitly specified.  This filesystem consumes no
     actual disk space, but is an interface to the virtual space of running
     processes.  The total and free blocks reported represent the total
     virtual memory (real memory plus swap space) present and the amount
     currently free, respectively.


You will see /proc if you use GNU df.  Otherwise, you have to explicitly
ask for it (df /prof).

If you use IRIX df /proc, you will see that the Type is proc - a
virtual filesystem.

If you want to independently verify it - use prtvtoc to look at
how your disk is partitioned.  You will probably not see a /proc
paritition.

Steve Parker

On Sep 23,  8:16am, Rory Hunter wrote:
> Subject: Re: oddness
> Hi,
>
> I know the proc is virtual, but it puzzled me that 'df' should list it
> when linux doesn't... if I can confirm that the partition itself is
> virtual then I'll happliy ignore it.
>
> Cheers,
>
> Rory Hunter
>-- End of excerpt from Rory Hunter

Message-ID: <00ee01c21b77$18522510$10eca8c0@grendel>
From: "Kevin D. Kissell" <kevink@mips.com>
References: <Pine.GSO.3.96.1020624133501.22509K-100000@delta.ds2.pg.gda.pl>
Subject: Re: sys_syscall patch.
Date: Mon, 24 Jun 2002 14:02:49 +0200
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Sender: owner-linux-mips@oss.sgi.com
To: "Maciej W. Rozycki" <macro@ds2.pg.gda.pl>, Carsten Langgaard <carstenl@mips.com>
Cc: Ralf Baechle <ralf@oss.sgi.com>, linux-mips@oss.sgi.com
Message-ID: <20020624120249.eQwgJs4_pvMPh9Va31KWAq9erzuHmQ3K3EUTqIQP6gI@z>

From: "Maciej W. Rozycki" <macro@ds2.pg.gda.pl>
> On Mon, 24 Jun 2002, Carsten Langgaard wrote:
> 
> > > What programs btw are using syscall()?  To be honest I don't recall one ...
> > 
> > /sbin/rpc.lockd.
> > It use syscall() to indirectly call the 'sys_nfsservctl' syscall, why it
> > doesn't do the syscall directly is beyond me.

I can only speculate that at the time it was written, there was not
a universally respected library binding to get to the direct syscall.

>  Hmm, shouldn't syscall() be a library wrapper?  I think we should kill
> sys_syscall(). 

While I agree that rpc.lockd should directly invoke the desired
system call if possible, having an indirect system call mechanism
is something that has proved useful to me in the past on other
Unices, and I would rather see it fixed than discarded.

            Kevin K.

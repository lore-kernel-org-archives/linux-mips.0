Date: Tue, 11 Dec 2001 09:34:52 +1000 (EST)
From: Ben Elliston <bje@redhat.com>
Subject: Re: PATCH: Handle Linux/mips (Re: Why is byteorder removed from
 /proc/cpuinfo?)
In-Reply-To: <20011210092104.A29953@nevyn.them.org>
Message-ID: <Pine.LNX.4.33.0112110933570.17417-100000@hypatia.brisbane.redhat.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: owner-linux-mips@oss.sgi.com
To: Daniel Jacobowitz <dan@debian.org>
Cc: "H . J . Lu" <hjl@lucon.org>, Ralf Baechle <ralf@oss.sgi.com>, linux-mips@oss.sgi.com
Message-ID: <20011210233452.9GxVANzB1YM7-P2lATmEB89ZDIoCPjvx8VEaPM1WQNw@z>

> > Of course, this needs some refinement.  ;-) Perhaps we need to run
> > through $(CC_FOR_BUILD) -E or somesuch; cpp is no good, as it won't
> > know all of the magic '*MIPS*' #defines.

> HJ's patch didn't compile anything; it ran code through
> $(CC_FOR_BUILD) -E :)

I must admit, I missed that.  But I definitely noticed that it created 
temporary files, which are more trouble than they're worth.  The number of 
people running ./configure as root is frightening.

Ben

Subject: Re: Designing hardware to join PCI to large local memory
Date: Fri, 4 Jan 2002 16:51:27 +0000 (GMT)
In-Reply-To: <200201041634.QAA19027@mudchute.algor.co.uk> from "Dominic Sweetman" at Jan 04, 2002 04:34:49 PM
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <E16MXZ1-0004da-00@the-village.bc.nu>
From: Alan Cox <alan@lxorguk.ukuu.org.uk>
Sender: owner-linux-mips@oss.sgi.com
To: Dominic Sweetman <dom@algor.co.uk>
Cc: linux-mips <linux-mips@oss.sgi.com>, rick@algor.co.uk, nigel@algor.co.uk, john@algor.co.uk
Message-ID: <20020104165127.WxTcPV9KqPkK24uJvVMC8az5tTGex9eArSVoKc22Unw@z>

> or less) can handle much larger memories - we would like it to go on
> past 4Gbytes.  So now there aren't enough addresses on PCI to map all
> the memory.

Good PCI devices can support DAC and can access 64bits on a 32bit bus at
a tiny penalty.

> We (more specifically Chris) have looked at the kernel sources, and
> concluded that schemes of both types have been attempted - though the
> sources don't, of course, pass judgement on how well it worked.
> 
> Those of you with experience: which would you recommend?  And if (2),
> can you point us to descriptions of good hardware facilities you've
> met or even imagined?

On big X86 setups bounce buffers really do hurt I/O performance. The
real answer is either DAC aware hardware for performance critical stuff
or some kind of mapping hardware, which requires much more complex toys
than a random cheap pci bridge.

Alan

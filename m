Subject: Re: MIPS, i8259 and spurious interrupts.
Date: Tue, 26 Feb 2002 11:10:38 +0000 (GMT)
In-Reply-To: <15483.26654.874273.652089@gladsmuir.algor.co.uk> from "Dominic Sweetman" at Feb 26, 2002 10:49:02 AM
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <E16ffVG-0000IW-00@the-village.bc.nu>
From: Alan Cox <alan@lxorguk.ukuu.org.uk>
Sender: owner-linux-mips@oss.sgi.com
To: Dominic Sweetman <dom@algor.co.uk>
Cc: Scott A McConnell <samcconn@cotw.com>, linux-mips@oss.sgi.com
Message-ID: <20020226111038.zNBIzDlwls6WTacYtLriynPjLkP3uen6OtE9wYUn9Ss@z>

> Then 8259s are ugly things which have some very CPU-specific
> interactions with x86 CPUs.  In a non-x86 context you need to
> initialise them in particular ways.  
 
Like with a soldering iron 8)

In paticular if you are getting hangs at the point where you allow an IRQ
to come in check the level/edge behaviour and see if in fact you are taking
a continuous stream of interrupts jamming the CPU in irq handling

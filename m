Date: Sun, 16 May 2004 17:21:13 +0200
From: Johannes Stezenbach <js@convergence.de>
Subject: Re: IRQ problem on cobalt / 2.6.6
Message-ID: <20040516152113.GA9390@convergence.de>
References: <20040513183059.GA25743@getyour.pawsoff.org> <40A478B0.3070005@bitbox.co.uk> <20040516113622.GA14049@getyour.pawsoff.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20040516113622.GA14049@getyour.pawsoff.org>
Return-Path: <js@convergence.de>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: Kieran Fulke <kieran@pawsoff.org>
Cc: linux-mips@linux-mips.org
Message-ID: <20040516152113.Zvj3ep0ODSBWz4Vkrhy2GlS1PsDBhu1H2tNeOIpEl-k@z>

On Sun, May 16, 2004 at 12:36:22PM +0100, Kieran Fulke wrote:
> On Fri, May 14, 2004 at 08:43:44AM +0100, Peter Horton wrote:
> 
> > Have you tried any other hardware in the slot, PCI network card perhaps ?
> > 
> > P.
> 
> yeah. adding cards like a tulip network card, linksys wmp11 wireless card. even a 
> wintv pci (analogue) card all work ;
...
> it just seems to be the DVB card that the pci code doesnt like, for some reason ..
> 
> all ideas warmly received ;)

Let me add some information from your posts to linux-dvb and from
the driver source.

I would appreciate it if someone could look it over (full source
is in linux/drivers/media/common/saa7146_core.c). The driver is
known to work on a variety of platforms, including one TX49 based
development system (last tested a few months back, though).

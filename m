Message-ID: <066201c160d5$eb51ed40$3501010a@ltc.com>
From: "Bradley D. LaRonde" <brad@ltc.com>
References: <20011026210746.A20395@dev1.ltc.com> <3BDDACD2.7121F905@mvista.com> <04c801c160b0$1d62f660$3501010a@ltc.com> <3BDDDA7A.329F827D@mvista.com>
Subject: Re: [Linux-mips-kernel]Re: PATCH: pci_auto bridge support
Date: Mon, 29 Oct 2001 19:00:43 -0500
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Sender: owner-linux-mips@oss.sgi.com
To: Jun Sun <jsun@mvista.com>
Cc: linux-mips@oss.sgi.com, linux-mips-kernel@lists.sourceforge.net
Message-ID: <20011030000043.7WULMjfqrrfGznhSb2-zoUyofzY_eEhxifT8wnpPGic@z>

----- Original Message -----
From: "Jun Sun" <jsun@mvista.com>
To: "Bradley D. LaRonde" <brad@ltc.com>
Cc: <linux-mips@oss.sgi.com>; <linux-mips-kernel@lists.sourceforge.net>
Sent: Monday, October 29, 2001 5:38 PM
Subject: [Linux-mips-kernel]Re: PATCH: pci_auto bridge support


> "Bradley D. LaRonde" wrote:
> >
> > I considered that, but since only this small chuck of run-once surrogate
> > bios autoconfig code needs to know, I figured better keep it separate.
> >
>
> I would vote to put it inside the hose structure:
>
> . It makes a workaround look like a real fix. :-)
>
> . In other implementations of pci_auto, hose is the private sys data of a
pci
> dev. Having a bus number inside is very useful (e.g., pci_ops can tell
whether
> it is type0 of type1 configuration based on the bus number rather than a
shaky
> NULL parent bus pointer).  In the future, all pci_auto should be combined
into
> the pci driver.  So that is probably the right direction to go.
>
> I think hose may evolve to be the data structure that represents the
topology
> of PCI buses.  It should have more uses in the future (e.g., the standard
IRQ
> routing across PCI-PCI bridges).

Isn't the bus topology already adequately represented in the pci_dev and
pci_channel structures?

I look at the pci autoconfig stuff as a bios replacement.  The fact that we
can use some of the same structures and functions to help us implement it is
a bonus, but not a mandate to mess with the existing model.

Isn't Linux already handling PCI-PCI bridges and multiple PCI channles fine
already, or has our autoconfig code exposed some existing non-arch-specific
weakness?

Regards,
Brad

Date: Thu, 11 Jul 2002 23:51:10 -0300 (BRT)
From: Marcelo Tosatti <marcelo@conectiva.com.br>
Subject: Re: [2.4 PATCH] pcnet32.c - tx underflow error
In-Reply-To: <E17SRFB-00087H-00@the-village.bc.nu>
Message-ID: <Pine.LNX.4.44.0207112350440.21590-100000@freak.distro.conectiva>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: owner-linux-mips@oss.sgi.com
To: Alan Cox <alan@lxorguk.ukuu.org.uk>
Cc: Jun Sun <jsun@mvista.com>, linux-mips@oss.sgi.com, Ralf Baechle <ralf@oss.sgi.com>, Jeff Garzik <jgarzik@mandrakesoft.com>
Message-ID: <20020712025110.QhmMK_EDG4KXyXfiKPYuRy3JvPiXKDF_byz-It-5Eo4@z>



On Thu, 11 Jul 2002, Alan Cox wrote:

> > This patch fixes a tx underflow error for 79c973 chip.  It essentially delay
> > the transmission until the whole packet is received into the on-chip sdram.
> >
> > The patch is already accepted by Marcelo for the 2.4 tree, I think.
>
> Which slows the stuff down for people with real computers. Please apply
> some kind of heuristic to this - eg switch to delaying if you exceed
> 50 failures in a 60 second period.

I haven't applied it yet.

I'll let it come to me throught Jeff Garzik after the issues are resolved.

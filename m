From: Alan Cox <alan@bagpuss.swansea.linux.org.uk>
Message-ID: <200107292126.f6TLQ7m01578@bagpuss.swansea.linux.org.uk>
Subject: Re: [long] Lance on DS5k/200
Date: Sun, 29 Jul 2001 17:26:06 -0400 (EDT)
In-Reply-To: <20010731004556.C19713@lug-owl.de> from "Jan-Benedict Glaw" at Jul 31, 2001 12:45:56 AM
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: owner-linux-mips@oss.sgi.com
To: Jan-Benedict Glaw <jbglaw@lug-owl.de>
Cc: "Maciej W. Rozycki" <macro@ds2.pg.gda.pl>, Dave Airlie <airlied@csn.ul.ie>, SGI MIPS list <linux-mips@oss.sgi.com>, Debian MIPS list <debian-mips@lists.debian.org>, engel@unix-ag.org
Message-ID: <20010729212606.CCWS7iXS5qVaVtP44gPqa8AE85HfU_xJ9sfPyYNZCYU@z>

> >  Z8530 is on my to-do list.  Our driver really sucks: neither DMA (the I/O
> > ASIC again) nor sychronous mode, just basic asynchronous support.  I'm
> > going to look at LANCE one day, too, but it's lower on the list.
> 
> You you facing towards all those Z8530 implementation or only to
> "ours"?

All the 8530 sync support is in my Z85230 driver. Its written so
someone can add async support to it.

Subject: Re: [2.4 PATCH] pcnet32.c - tx underflow error
Date: Thu, 11 Jul 2002 00:51:37 +0100 (BST)
In-Reply-To: <3D2CAD78.9070609@mvista.com> from "Jun Sun" at Jul 10, 2002 02:56:08 PM
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <E17SRFB-00087H-00@the-village.bc.nu>
From: Alan Cox <alan@lxorguk.ukuu.org.uk>
Sender: owner-linux-mips@oss.sgi.com
To: Jun Sun <jsun@mvista.com>
Cc: linux-mips@oss.sgi.com, Ralf Baechle <ralf@oss.sgi.com>, marcelo@conectiva.com.br
Message-ID: <20020710235137.mUYjUFCk1m0f59twFn6rpavizmJSil0sqNNRf4Q2b_E@z>

> This patch fixes a tx underflow error for 79c973 chip.  It essentially delay 
> the transmission until the whole packet is received into the on-chip sdram.
> 
> The patch is already accepted by Marcelo for the 2.4 tree, I think.

Which slows the stuff down for people with real computers. Please apply
some kind of heuristic to this - eg switch to delaying if you exceed
50 failures in a 60 second period.

Alan

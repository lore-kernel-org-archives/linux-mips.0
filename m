From: "Joseph Chiu" <joseph@omnilux.net>
Subject: Wired TLB entry?
Date: Mon, 16 Jun 2003 16:49:29 -0700
Message-ID: <BPEELMGAINDCONKDGDNCCEFBDMAA.joseph@omnilux.net>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="GB2312"
Content-Transfer-Encoding: 7bit
In-Reply-To: <20030616093215Z8225220-1272+2626@linux-mips.org>
Return-Path: <joseph@omnilux.net>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: linux-mips@linux-mips.org
Message-ID: <20030616234929.lAXMktxAakAsvOBSDOo6eqt2Jl_k41zGGiLO_IVW5cY@z>

Hi,
Is there a (proper) way to add a page entry in the TLB it's always valid?
Specifically, accesses to memory-mapped hardware (PCMCIA) causes the kernel
to oops under heavy interrupt loading.
It seems to me that the page entry in the TLB is getting flushed out under
the activity; and when the ioremap'd memory region is accesses, the
exception handling for the missing translation does not run.

I'm afraid my two days of googling hasn't turned up the right information.
I think I just don't know the right terminology and I hope someone can at
least point me in the right direction.
Thanks.
Joseph
(I am running 2.4.18)

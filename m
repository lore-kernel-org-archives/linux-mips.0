Date: Wed, 18 Jul 2001 21:09:42 -0700 (PDT)
From: Chris Vandomelen <chrisv@b0rked.dhs.org>
Subject: Patches to support 48M IBM Workpad z50?
Message-ID: <Pine.LNX.4.31.0107182100140.9246-100000@b0rked.dhs.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: owner-linux-mips@oss.sgi.com
To: linux-mips@oss.sgi.com, linux-mips-kernel@lists.sourceforge.net
Message-ID: <20010719040942.oK1Lj73WvYtEmNgct8ss6i9NnWzraVo-4t9FPP5AaaU@z>

Since I can't seem to find any information about this anywhere else, I
figured this would be the appropriate place to ask.

I'm using a moderately hacked 2.4.0-test9 kernel from the linux-vr
repository (the only complete kernel, excluding NetBSD, that I've found
which runs on CE devices at the moment), and it doesn't want to recognize
all 48M of RAM in the device, only the 1st 16. The memory is mapped as
such:

0M  - 16M:	On-board memory
16M - 32M:	Unmapped region
32M - 64M:	Memory expansion card

When the first 16M is checked, the memory immediately after that is found
to be non-existant.

Does anyone have a patch (other than the hack I tossed together to turn
the 32M-64M chunk into an MTD device) that would be useful to work past
the memory hole?

TIA

Chris

From: "Matthew Dharm" <mdharm@momenco.com>
Subject: RE: Help with OOPSes, anyone?
Date: Mon, 28 Jan 2002 15:31:49 -0800
Message-ID: <NEBBLJGMNKKEEMNLHGAIAEBJCFAA.mdharm@momenco.com>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
In-Reply-To: <Pine.LNX.3.96.1020127163608.6344C-100000@wakko.deltatee.com>
Sender: owner-linux-mips@oss.sgi.com
To: linux-mips@oss.sgi.com
Message-ID: <20020128233149.KylUJ05YYXskRHQ-I5FoqJWqjxeepOrUcykNlsyI3XE@z>

Well, here's the latest test results...

The 2.4.0 kernel from MontaVista seems to work just fine.  Of course,
it doesn't have support for the full range of interrupts, but that's a
separate matter.  But it doesn't crash under big compiles.

2.4.17 with CONFIG_MIPS_UNCACHED crashes.  It takes longer, but that
may just be a function of it running so much slower.  The BogoMIPS
drops by a factor of 100.  Ouch.

So it doesn't look like a cache problem after all.  And it does
suggest that something introduced between 2.4.0 and .17 is what broke
things.  But what that is, I have no idea.

I'm going to try Jason's modified cache code just in case, but I doubt
that will change anything.  We'll have to see, tho.

Does anyone have any other suggestions to try?  I'm starting to wonder
if perhaps the PROM isn't setting up the SDRAM properly, but that
conflicts with the working 2.4.0 kernel -- the PROM is the same in
both cases, so I would expect a PROM error to affect both versions.

I'm running out of ideas here... anyone?

Matt

--
Matthew D. Dharm                            Senior Software Designer
Momentum Computer Inc.                      1815 Aston Ave.  Suite 107
(760) 431-8663 X-115                        Carlsbad, CA 92008-7310
Momentum Works For You                      www.momenco.com

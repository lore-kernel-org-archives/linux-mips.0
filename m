Received: from newman.mips.com (ns-dmz [206.31.31.225])
	by mx2.mips.com (8.12.5/8.12.5) with ESMTP id h4KIwkUe016036
	for <linux-mips@linux-mips.org>; Tue, 20 May 2003 11:58:46 -0700 (PDT)
Message-ID: <025401c31f03$0e993370$10eca8c0@grendel>
From: "Kevin D. Kissell" <kevink@mips.com>
References: <1053455551.996c4860yaelgilad@myrealbox.com>
Subject: Re: lwl-lwr
Date: Tue, 20 May 2003 21:07:26 +0200
MIME-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-Path: <kevink@mips.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: Gilad Benjamini <yaelgilad@myrealbox.com>, linux-mips@linux-mips.org
Message-ID: <20030520190726.XPAa9vzS90XudYvfXkMxaAIuO3KCG5MvkUF15wkHKDU@z>

> About two months ago there was a discussion
> here about disabling lwl-lwr.
> 
> Can someone shed some light on why the discussion
> emerged ?
> 
> Is this a performance issue, a processor which 
> doesn't support it, or something else ?
> 
> If this is a performance issue, I'll be happy
> to hear more details.

I don't remember the discussion in question, but it's a question
which comes up from time to time, due to the existence of 
MIPS-like CPUs which lack the (patented) lwl/lwr mechanism
for dealing with unaligned data.  The Lexra cores, for example.

There's really no such thing as "disabling" lwl/lwr.  They are part 
of the base MIPS instruction set.  If one wants to live without them, 
one can either rig a compiler to emit multi-instruction sequences instead 
of lwr/lwl to do the appropriate shifts and masks (which is slower on all 
targets), or you can rig the OS to emulate them, and hope that the processors 
lacking support will take clean reserved instruction traps, where the function 
can be emulated (which is "free" for code running  on CPUs with lwl/lwr, 
but *really* slow for the guys doing emulation).

            Kevin K.

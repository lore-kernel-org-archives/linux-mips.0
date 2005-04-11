Message-ID: <007101c53ed7$44a71ae0$10eca8c0@grendel>
From: "Kevin D. Kissell" <kevink@mips.com>
References: <42553E49.7080004@timesys.com> <4256991C.4020601@timesys.com> <20050408161357.GB19166@linux-mips.org> <4256B524.2080509@timesys.com> <425AD440.5050600@timesys.com>
Subject: Re: another 4kc machine check.
Date: Mon, 11 Apr 2005 22:42:57 +0200
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-Path: <kevink@mips.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: Greg Weeks <greg.weeks@timesys.com>, Ralf Baechle <ralf@linux-mips.org>
Cc: linux-mips@linux-mips.org
Message-ID: <20050411204257.n_MNAgqdn9FfPjnl-vo2bJyl6nWPAsr-X3Y2XBhLOMo@z>

One further comment:


> This patch appears to fix my machine check problem on the 4kc. The 4kc 
> shouldn't need an ssnop here, but this appears to fix it.


The 4Kc shouldn't need an ssnop/ehb for the purposes of a *load*, but
if the exception was on an instruction fetch, the documentation is reasonably
clear that there's a hazard of 3 cycles before the new entry can be used for
a fetch - which is what ERET will do in the case of a instruction fetch miss.

            Regards,

            Kevin K.

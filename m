From: "Martin C. Barlow" <mips@martin.barlow.name>
Subject: RE: hwclock and df seg fault
Date: Sun, 21 Mar 2004 03:16:14 +1100
Message-ID: <000001c40e96$adbdb1f0$6500a8c0@colombia>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
In-Reply-To: <20040320122225.GK25832@rembrandt.csv.ica.uni-stuttgart.de>
Return-Path: <mips@martin.barlow.name>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: 'Thiemo Seufer' <ica2_ts@csv.ica.uni-stuttgart.de>
Cc: linux-mips@linux-mips.org
Message-ID: <20040320161614.zRDQjFpXSoPZKl2JVG7i1VKJH244LUsOVNr64kAM4-Q@z>

Thiemo

With PREEMP turned off, the hwclock command works again. Looks like the
new scheduler may have a little problem.
The df problem is still there. This may be just a user space
mis-configuration error. I'll see if I can find the problem.
Let me know if you need any dumps.

marty

-----Original Message-----
From: Thiemo Seufer [mailto:ica2_ts@csv.ica.uni-stuttgart.de] 
Sent: Saturday, 20 March 2004 11:22 PM
To: Martin C. Barlow
Cc: linux-mips@linux-mips.org
Subject: Re: hwclock and df seg fault


Martin C. Barlow wrote:
[snip]
> Barcelona:/var/log# hwclock
> Mar 21 19:11:20 Barcelona kernel: bad: scheduling while atomic!
[snip]
> Mar 21 19:11:20 Barcelona kernel: note: hwclock[369] exited with 
> preempt_count 2

So this was with CONFIG_PREEMPT, I guess. Does it happen also without
that?


Thiemo

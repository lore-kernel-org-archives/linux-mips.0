Date: Thu, 29 Apr 2004 16:49:45 -0400 (EDT)
From: Nicolas Pitre <nico@cam.org>
Subject: Re: CONFIG_XIP_ROM vs. CONFIG_XIP_KERNEL
In-Reply-To: <40915265.2050906@am.sony.com>
Message-ID: <Pine.LNX.4.44.0404291644170.30657-100000@xanadu.home>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-Path: <nico@cam.org>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: Tim Bird <tim.bird@am.sony.com>
Cc: linux kernel <linux-kernel@vger.kernel.org>, linux-arm-kernel@lists.arm.linux.org.uk, linux-mips@linux-mips.org, linux-sh-ctl@m17n.org, CE Linux Developers List <celinux-dev@tree.celinuxforum.org>
Message-ID: <20040429204945.UB_tXsUxhBOOhxsD-3EwCFAOFA71fyUd6TX4bA0KMTo@z>

On Thu, 29 Apr 2004, Tim Bird wrote:

> I'm looking at some sources for kernel Execute-in-place (XIP).
> 
> I see references to CONFIG_XIP_ROM and CONFIG_XIP_KERNEL,
> in different architecture branches of the same kernel
> source tree.
> 
> Is this difference merely the result of inconsistent
> usage, or is there a functional difference between
> these two options?

It's the result of me deciding CONFIG_XIP_ROM wasn't totally appropriate ...  

> I can imagine that CONFIG_XIP_ROM is intended only to
> handle XIP in ROM, and that CONFIG_XIP_KERNEL possibly
> handles additional cases like XIP in flash.  However,
> before jumping to that conclusion I thought I would
> ask if there is some intention behind the different
> config names.

... so I renamed it to CONFIG_XIP_KERNEL.  Especially since there is also 
XIPable user space which also can be stored in ROM (or flash).  So please 
disregard CONFIG_XIP_ROM and use CONFIG_XIP_KERNEL.  Whether ROM or Flash is 
used is rather irrelevant to the code this option is linked to.


Nicolas

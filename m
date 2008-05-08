Received: from zone0.gcu-squad.org ([212.85.147.21]:11592 "EHLO
	services.gcu-squad.org") by ftp.linux-mips.org with ESMTP
	id S20025578AbYEHI70 convert rfc822-to-8bit (ORCPT
	<rfc822;linux-mips@linux-mips.org>); Thu, 8 May 2008 09:59:26 +0100
Date: Thu, 8 May 2008 10:59:05 +0200
From: Jean Delvare <khali@linux-fr.org>
Subject: Re: [RFC][PATCH 2/4] RTC: SWARM I2C board initialization
Message-ID: <20080508105905.3209c659@hyperion.delvare>
In-Reply-To: <Pine.LNX.4.55.0805072145040.25644@cliff.in.clinika.pl>
References: <Pine.LNX.4.55.0805070031410.16173@cliff.in.clinika.pl>
	<20080507085953.2c08b854@hyperion.delvare>
	<Pine.LNX.4.55.0805072145040.25644@cliff.in.clinika.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8BIT
Return-Path: <khali@linux-fr.org>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: "Maciej W. Rozycki" <macro@linux-mips.org>
Cc: Ralf Baechle <ralf@linux-mips.org>, Alessandro Zummo <a.zummo@towertech.it>, Thomas Gleixner <tglx@linutronix.de>, Andrew Morton <akpm@linux-foundation.org>, rtc-linux@googlegroups.com, i2c@lm-sensors.org, linux-mips@linux-mips.org, linux-kernel@vger.kernel.org
Message-ID: <20080508085905.OEdFJ5LSKILI9rGIlr5A_Uu0ESs7D4QIg4zptyjJzYE@z>

Hi Maciej,

On Wed, 7 May 2008 22:13:23 +0100 (BST), Maciej W. Rozycki wrote:
> Hi Jean,
> 
> > Minor corrections which would ideally belong to a separate patch
> > (there's a whole lot more cleanups that could be done in that driver,
> > BTW...)
> 
>  Not suprising, as usually with most pieces of code for the SWARM and the 
> SiByte SOC.  That can be done gradually, but mixing a driver overhaul with 
> functional changes usually only results in confusion later on.

I fully agree.

> > I don't think that the minor changes below are enough for you to claim
> > copyright on that driver.
> 
>  Well, I decide whether or not to add one based on how important changes
> are from the piece's of code point of view.  In this case the change is
> essential for new-style client drivers to work at all, which I think is
> more important than e.g. a lot of cosmetical changes throughout would be.  
> But I do not insist on keeping it -- if you think I misjudged on this
> occasion, I see no problem with discarding it.

If you had to add a missing semicolon to a source file to get it to
build again, it would be an "essential" change (without it nothing
works) but still, you can't claim you added any intellectual value to
the source file. So, no copyright. The copyright is about how much
value you add, not how important the change is in the big picture.

> > Why do you double the space and the end of comments? Never seen that
> > before, and I can't see the idea.
> 
>  This is mostly habitual -- this is what the GNU Coding Standard specifies
> for comments and which is enforced for GNU software which I have dealt a
> lot with.

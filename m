Message-ID: <41581D75.3090706@embeddedalley.com>
Date: Mon, 27 Sep 2004 07:02:29 -0700
From: Pete Popov <ppopov@embeddedalley.com>
MIME-Version: 1.0
Subject: Re: 2.6 kernel work for XXS1500
References: <20040927085510.GD10739@curie-int.orbis-terrarum.net>
In-Reply-To: <20040927085510.GD10739@curie-int.orbis-terrarum.net>
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
Return-Path: <ppopov@embeddedalley.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: "Robin H. Johnson" <robbat2@gentoo.org>
Cc: linux-mips@linux-mips.org
Message-ID: <20040927140229.bOUBVTBDwjyH4uHl3R-QWBRTjHFdJA5GtSHvE7MtgY0@z>

Hi Robin,

Robin H. Johnson wrote:

>This is a general announcement of some work being done to update XXS1500
>support to a 2.6 kernel level. Testers welcome.
>
>This isn't ready for CVS inclusion yet, still needs more testing and
>validation, but to stop the hordes of people emailing me about it (Hi
>Marcel), here it is being publicly announced:
>http://dev.gentoo.org/~robbat2/xxs1500/linux-xxs1500-20040927.patch-dangerous.gz
>Applies against latest CVS.
>
>Contains:
>- Kconfig stuff for the BCM5222 Dual PHY.
>- XXS1500 PCI IRQ stuff
>- MTD access to the onboard flash (Pete's code)
>- Kconfig stuff for MTD flash
>- drivers/pcmcia/au1000_generic.c: cleanup debug code
>  
>
I've updated the pcmcia driver but haven't pushed the patch in yet. I 
cleaned up the debug code but I'll take a look at what you've done too.

The rest of the core 2.6 update is on its way, including the 36bit 
support, zImage, all the drivers, etc.

Pete

>- drivers/pcmcia/au1000_xxs1500.c: port to 2.6
>- Move include/asm-mips/xxs1500.h to include/asm-mips/mach-xxs1500/xxs1500.h
>
>No warranty on it, I don't trust my PCMCIA code entirely yet.
>
From the original codebase:
>a) au_writel((au_readl(GPIO2_PINSTATE) & ~(1<<14))|(1<<30), GPIO2_OUTPUT);
>b) au_writel((au_readl(GPIO2_PINSTATE) | (1<<14))|(1<<30), GPIO2_OUTPUT);
>
>The 1<<14 indicates a specific location to set, and the 1<<30 says to
>enable output on that location.
>In arch/mips/au1000/xxs1500/board_setup.c, snippet a is commented as
>'turn off power'.
>In drivers/pcmcia/au1000_xxs1500.c, snippet a is commented as 'turn on
>power', and snippet b is commented as 'turn off power'.
>
>Your guess is as good as mine as to which does what.
>
>I've replaced them with two macros:
>XXS1500_GPIO2_PCMCIA_POWER_ON
>XXS1500_GPIO2_PCMCIA_POWER_OFF
>
>Due to the number of times they occur.
>
>  
>

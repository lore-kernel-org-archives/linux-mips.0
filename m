Received: from mx2.suse.de ([195.135.220.15]:45757 "EHLO mx2.suse.de")
	by ftp.linux-mips.org with ESMTP id S20021792AbXEWWlg (ORCPT
	<rfc822;linux-mips@linux-mips.org>); Wed, 23 May 2007 23:41:36 +0100
From: Andreas Schwab <schwab@suse.de>
Subject: Re: [PATCH] m68k: Enable arbitary speed tty support
References: <20070523174446.37abfa7a@the-village.bc.nu>
	<Pine.LNX.4.64.0705232117260.10610@anakin>
	<20070523205645.07b03581@the-village.bc.nu>
Date: Thu, 24 May 2007 00:40:46 +0200
In-Reply-To: <20070523205645.07b03581@the-village.bc.nu> (Alan Cox's message
	of "Wed\, 23 May 2007 20\:56\:45 +0100")
Message-ID: <je7iqzf9jl.fsf@sykes.suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Return-Path: <schwab@suse.de>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: Alan Cox <alan@lxorguk.ukuu.org.uk>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, Roman Zippel <zippel@linux-m68k.org>, Linux Kernel Development <linux-kernel@vger.kernel.org>, akpm@osdl.org, rmk@arm.linux.kernel.org, spyro@f2s.com, starvik@axis.com, ysato@users.sourceforge.jp, "Luck, Tony" <tony.luck@intel.com>, takata@linux-m32r.org, chris@zankel.net, uclinux-v850@lsi.nec.co.jp, kyle@parisc-linux.org, linux-mips@linux-mips.org
Message-ID: <20070523224046.Wtoj62y5Sg5sWZ2l_GRoxosooU3XxjmDHyxLKfD8IQU@z>

Alan Cox <alan@lxorguk.ukuu.org.uk> writes:

> ddiff -u --new-file --recursive --exclude-from /usr/src/exclude linux.vanilla-2.6.22-rc1-mm1/include/asm-arm/termbits.h linux-2.6.22-rc1-mm1/include/asm-arm/termbits.h
> --- linux.vanilla-2.6.22-rc1-mm1/include/asm-arm/termbits.h	2007-04-30 10:48:14.000000000 +0100
> +++ linux-2.6.22-rc1-mm1/include/asm-arm/termbits.h	2007-05-23 20:23:25.000000000 +0100
> @@ -15,6 +15,17 @@
>  	cc_t c_cc[NCCS];		/* control characters */
>  };
>  
> +struct termios_2 {

s/_//

Andreas.

-- 
Andreas Schwab, SuSE Labs, schwab@suse.de
SuSE Linux Products GmbH, Maxfeldstraße 5, 90409 Nürnberg, Germany
PGP key fingerprint = 58CA 54C7 6D53 942B 1756  01D3 44D5 214B 8276 4ED5
"And now for something completely different."

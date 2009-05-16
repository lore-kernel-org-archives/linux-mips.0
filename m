Received: from rv-out-0708.google.com ([209.85.198.243]:22623 "EHLO
	rv-out-0708.google.com" rhost-flags-OK-OK-OK-OK) by ftp.linux-mips.org
	with ESMTP id S20023540AbZEPBPw (ORCPT
	<rfc822;linux-mips@linux-mips.org>); Sat, 16 May 2009 02:15:52 +0100
Subject: Re: [PATCH 23/30] loongson: CS5536 MFGPT as system clock source
 support
From: Wu Zhangjin <wuzhangjin@gmail.com>
Reply-To: wuzhangjin@gmail.com
In-Reply-To: <1f1b08da0905151739v6bc2e5f6t57cb8e06cdda2673@mail.gmail.com>
References: <1242426182.10164.168.camel@falcon>
	 <1f1b08da0905151739v6bc2e5f6t57cb8e06cdda2673@mail.gmail.com>
Content-Type: text/plain
Date: Sat, 16 May 2009 09:15:41 +0800
Message-ID: <1242436541.10164.194.camel@falcon>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-Path: <wuzhangjin@gmail.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: john stultz <johnstul@us.ibm.com>
Cc: linux-mips@linux-mips.org, Ralf Baechle <ralf@linux-mips.org>, linux-kernel@vger.kernel.org, Arnaud Patard <apatard@mandriva.com>, loongson-dev@googlegroups.com, zhangfx@lemote.com, yanh@lemote.com, Philippe Vachon <philippe@cowpig.ca>, Zhang Le <r0bertz@gentoo.org>, Erwan Lerale <erwan@thiscow.com>
Message-ID: <20090516011541.dWFM9_xa79Dld6bqx9BU922EFDmZqudBAuexAq8dv7U@z>

On Fri, 2009-05-15 at 17:39 -0700, john stultz wrote:
> On Fri, May 15, 2009 at 3:23 PM, Wu Zhangjin <wuzhangjin@gmail.com> wrote:
> > +static struct clocksource clocksource_mfgpt = {
> > +    .name = "mfgpt",
> > +    .rating = 1200,
> 
> Minor nit. Please read the comment over the struct clocksource
> definition in include/linux/clocksource.h for a guide to setting the
> rating value for your clocksource.
> 

as the comment describes, just like the 8253 Timer, the precision of
cs5536 mfgpt Timer is not good, the rating of it should be in the range
of 100-199? Functional for real use, but not desired?

thanks!
Wu Zhangjin

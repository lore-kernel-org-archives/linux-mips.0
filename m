Received: from yw-out-1718.google.com ([74.125.46.156]:11967 "EHLO
	yw-out-1718.google.com" rhost-flags-OK-OK-OK-OK) by ftp.linux-mips.org
	with ESMTP id S20022859AbZEPAjp convert rfc822-to-8bit (ORCPT
	<rfc822;linux-mips@linux-mips.org>); Sat, 16 May 2009 01:39:45 +0100
MIME-Version: 1.0
In-Reply-To: <1242426182.10164.168.camel@falcon>
References: <1242426182.10164.168.camel@falcon>
Date: Fri, 15 May 2009 17:39:43 -0700
Message-ID: <1f1b08da0905151739v6bc2e5f6t57cb8e06cdda2673@mail.gmail.com>
Subject: Re: [PATCH 23/30] loongson: CS5536 MFGPT as system clock source
	support
From: john stultz <johnstul@us.ibm.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8BIT
Return-Path: <johnstul.lkml@gmail.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: wuzhangjin@gmail.com
Cc: linux-mips@linux-mips.org, Ralf Baechle <ralf@linux-mips.org>, linux-kernel@vger.kernel.org, Arnaud Patard <apatard@mandriva.com>, loongson-dev@googlegroups.com, zhangfx@lemote.com, yanh@lemote.com, Philippe Vachon <philippe@cowpig.ca>, Zhang Le <r0bertz@gentoo.org>, Erwan Lerale <erwan@thiscow.com>
Message-ID: <20090516003943.PPebaxWdJ9Ra1RhBrN-V1Bue1fcU09_1CPBgoXECXTs@z>

On Fri, May 15, 2009 at 3:23 PM, Wu Zhangjin <wuzhangjin@gmail.com> wrote:
> +static struct clocksource clocksource_mfgpt = {
> +       .name = "mfgpt",
> +       .rating = 1200,

Minor nit. Please read the comment over the struct clocksource
definition in include/linux/clocksource.h for a guide to setting the
rating value for your clocksource.

thanks
-john

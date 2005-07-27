Received: from dlep31.itg.ti.com ([157.170.139.161])
	by go4.ext.ti.com (8.13.1/8.13.1) with ESMTP id j6R8j9PF025001
	for <linux-mips@linux-mips.org>; Wed, 27 Jul 2005 03:45:09 -0500 (CDT)
Received: from dlep90.itg.ti.com (localhost [127.0.0.1])
	by dlep31.itg.ti.com (8.12.11/8.12.11) with ESMTP id j6R8j9Xg008402
	for <linux-mips@linux-mips.org>; Wed, 27 Jul 2005 03:45:09 -0500 (CDT)
Received: from dbde01.ent.ti.com (localhost [127.0.0.1])
	by dlep90.itg.ti.com (8.12.11/8.12.11) with ESMTP id j6R8j5i6012666
	for <linux-mips@linux-mips.org>; Wed, 27 Jul 2005 03:45:08 -0500 (CDT)
Content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Subject: xtime drift issue
Date: Wed, 27 Jul 2005 14:15:05 +0530
Message-ID: <CBD77117272E1249BFDC21E33D555FDC0601A7@dbde01.ent.ti.com>
From: "Nori, Soma Sekhar" <nsekhar@ti.com>
Return-Path: <nsekhar@ti.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: linux-mips@linux-mips.org
Message-ID: <20050727084505.EG44WR6SyItJWynnTVGdoBgKojaicDJ1JfMuuglJvnY@z>


Hi All,

I am running linux 2.6.10 (kernel.org) on my MIPS 4kec board.

On bootup, I use "hwclock -s" to sync the system time to the RTC.
Thereafter, the RTC keeps pace, but "date" starts losing time pretty
rapidly (~13 seconds per minute).

There is no interrupt from my RTC and hence updating xtime in RTC
ISR is not possible.

Is it normal for date to lose time at such a rapid pace?
If yes, what is the prefered way to keep pace (without using NTP)?

Thanks,
Sekhar Nori.

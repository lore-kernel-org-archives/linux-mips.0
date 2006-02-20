Received: from 209-232-97-206.ded.pacbell.net ([209.232.97.206]:46297 "EHLO
	dns0.mips.com") by ftp.linux-mips.org with ESMTP id S8133764AbWBTOan
	(ORCPT <rfc822;linux-mips@linux-mips.org>);
	Mon, 20 Feb 2006 14:30:43 +0000
Message-ID: <001d01c6362b$8af89b80$10eca8c0@grendel>
From: "Kevin D. Kissell" <kevink@mips.com>
References: <7E000E7F06B05C49BDBB769ADAF44D0773A636@NT-SJCA-0750.brcm.ad.broadcom.com> <43F9B168.6090105@rtschenk.de> <43F9C58E.4020606@mips.com>
Subject: Re: Tracking down exception in sched.c
Date: Mon, 20 Feb 2006 15:40:05 +0100
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-Path: <kevink@mips.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: "Kevin D. Kissell" <kevink@mips.com>, Rojhalat Ibrahim <imr@rtschenk.de>
Cc: Mark E Mason <mark.e.mason@broadcom.com>, linux-mips@linux-mips.org
Message-ID: <20060220144005.4g4aht81Y2tNZrcZkdJRH0LiSS__jYqziibOIj5pRzs@z>

>... if your phys_cpu_present_map
> (which is by default what gets used in MIPS as cpu_possible_map
> for the purposes of sched.c) is being properly initialized and
> maintained, the behavior of the two loops should be the same.
> Have you double-checked that?  Secondary CPUs turn generally
> set their bits in that mask in prom_build_cpu_map().

Correction.  I misremembered this.  prom_build_cpu_map()
is called only by the primary/boot CPU, prior to SMP initialization.
It's still the place where phys_cpu_present gets set up, but it
can't be set up by the secondaries.

            Regards,

            Kevin K.

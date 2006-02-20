Received: from 209-232-97-206.ded.pacbell.net ([209.232.97.206]:45273 "EHLO
	dns0.mips.com") by ftp.linux-mips.org with ESMTP id S8133764AbWBTO0e
	(ORCPT <rfc822;linux-mips@linux-mips.org>);
	Mon, 20 Feb 2006 14:26:34 +0000
Message-ID: <001501c6362a$f82d1bf0$10eca8c0@grendel>
From: "Kevin D. Kissell" <kevink@mips.com>
References: <7E000E7F06B05C49BDBB769ADAF44D0773A636@NT-SJCA-0750.brcm.ad.broadcom.com> <43F9B168.6090105@rtschenk.de> <20060220133527.GA10598@linux-mips.org>
Subject: Re: Tracking down exception in sched.c
Date: Mon, 20 Feb 2006 15:35:58 +0100
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-Path: <kevink@mips.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: Ralf Baechle <ralf@linux-mips.org>, Rojhalat Ibrahim <imr@rtschenk.de>
Cc: Mark E Mason <mark.e.mason@broadcom.com>, linux-mips@linux-mips.org
Message-ID: <20060220143558.EoMu1V9B7vtwNijQxe5eLUIDlhH1F-6Mrf0UMOWtttM@z>

> > Any other suggestions, how to fix this?
> 
> Almost certainly wrong - like almost any loop iterating over 0..NR_CPUS.
> I'm looking into this now.  Part of what is blowing up is this piece of
> legacy code
> 
>   #define cpu_possible_map        phys_cpu_present_map
> 
> in include/asm-mips/smp.h.  Time to clean that and I fear it's not going
> to be pretty ...

I don't think anything's necessarily broken there except for a lack of 
documentation. That #define will presumably go away once hot-plug support 
is fully in, but the fact that the boot code sets up a phys_cpu_present_map 
is perfectly reasonable, and equating that to cpu_possible_map for the purposes 
of sched.c is simple and efficient.  Whatever name it has, if the platform code 
doesn't correctly initialize and maintain the map, Bad Things will clearly happen. 
I'm not sure how we can actually prevent this.  It pretty much has to be
platform-specific code that determines whether a given CPU is present
in a hardware configuration.

            Regards,

            Kevin K.

Message-ID: <00fb01c284e6$5b7bf4f0$10eca8c0@grendel>
From: "Kevin D. Kissell" <kevink@mips.com>
References: <3DC7CB8B.E2C1D4E5@mips.com> <20021105163806.A24996@bacchus.dhis.org>
Subject: Re: Prefetches in memcpy
Date: Tue, 5 Nov 2002 17:13:48 +0100
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-Path: <kevink@mips.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: Ralf Baechle <ralf@uni-koblenz.de>, Carsten Langgaard <carstenl@mips.com>
Cc: linux-mips@linux-mips.org
Message-ID: <20021105161348.haq7BWCCeHX17NQcrqo938bLjXuTrOWYiirA8yncF8g@z>

From: "Ralf Baechle" <ralf@uni-koblenz.de>
> So I think the fix will have to be:
> 
>  - Avoid prefetching beyond the end of the copy area in memcpy and memmove.
>  - Introduce a second variant of memcpy that never does prefetching.  This
>    one will be safe to use in KSEG1 / uncached XKPHYS also and will be used
>    for memcpy_fromio, memcpy_toio and friends.

Assuming we had a version that prefetched exactly to the end
of the source memory block and no further, why would we need
the second variant?

            Kevin K.

From: "Bryan Althouse" <bryan.althouse@3phoenix.com>
Subject: RE: custom ide driver causes "Badness in smp_call_function"
Date: Fri, 26 Aug 2005 12:36:26 -0400
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
In-Reply-To: <20050826162832.GB2712@linux-mips.org>
Message-ID: <20050826163050Z8224979-3678+7593@linux-mips.org>
Return-Path: <bryan.althouse@3phoenix.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: 'Ralf Baechle' <ralf@linux-mips.org>
Cc: linux-mips@linux-mips.org
Message-ID: <20050826163626.lNeeH_yMN7W7bcKQo8T_zHyh1uDZvC1ekEt8tt40Nn4@z>

I still get the SMP badness when hwif->irq is set to 0 in my driver.

Bryan

-----Original Message-----
From: Ralf Baechle [mailto:ralf@linux-mips.org] 
Sent: Friday, August 26, 2005 12:29 PM
To: Bryan Althouse
Cc: linux-mips@linux-mips.org
Subject: Re: custom ide driver causes "Badness in smp_call_function"

On Fri, Aug 26, 2005 at 10:58:40AM -0400, Bryan Althouse wrote:

> The patch doesn't seem to make any difference. :(

To clarify, the patch wasn't meant to resolve your interrupt problems but
the SMP cacheflush issues only.

  Ralf

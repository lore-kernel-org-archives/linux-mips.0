Message-ID: <200301132012.h0DKCS631737@uhler-linux.mips.com>
Reply-To: uhler@mips.com
Subject: Re: unaligned load in branch delay slot 
In-reply-to: Your message of "Mon, 13 Jan 2003 19:04:36 +0100."
             <Pine.GSO.4.21.0301131901500.21279-100000@vervain.sonytel.be>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Mon, 13 Jan 2003 12:12:28 -0800
From: "Mike Uhler" <uhler@mips.com>
Return-Path: <uhler@mips.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Mike Uhler <uhler@mips.com>, Linux/MIPS Development <linux-mips@linux-mips.org>uhler@mips.com
Message-ID: <20030113201228.fTPR02LzQRjZOx4f6hzGoQ0KubnnQgPfxSOkMoGZZXU@z>


> 
> Thanks!
> 
> The following patch (against linux-mips-2.4.x CVS) cures my crash.
> 
> I don't know on which CPUs this may happen (need #ifdef CONFIG_CPU_VR41XX?),
> nor whether all branch and jump instructions are affected (I included
> everything that starts with a `b' or `j').

Since all MIPS jumps are unconditional, one can never have a non-taken
jump, so you can eliminate those from the patch.

/gmu

-- 

  =*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=
  Michael Uhler, VP, Systems, Architecture, and Software Products 
  MIPS Technologies, Inc.   Email: uhler@mips.com   Pager: uhler_p@mips.com
  1225 Charleston Road      Voice:  (650)567-5025   FAX:   (650)567-5225
  Mountain View, CA 94043   Mobile: (650)868-6870   Admin: (650)567-5085

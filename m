Received: from rembrandt.csv.ica.uni-stuttgart.de ([129.69.118.42] ident=mail)
	by iris1.csv.ica.uni-stuttgart.de with esmtp
	id 1B0X7i-00036J-00
	for <linux-mips@linux-mips.org>; Tue, 09 Mar 2004 03:37:38 +0100
Received: from ica2_ts by rembrandt.csv.ica.uni-stuttgart.de with local (Exim 3.35 #1 (Debian))
	id 1B0X7i-0000h8-00
	for <linux-mips@linux-mips.org>; Tue, 09 Mar 2004 03:37:38 +0100
Date: Tue, 9 Mar 2004 03:37:37 +0100
Subject: Re: 2.4 kernels + >=binutils-2.14.90.0.8
Message-ID: <20040309023737.GJ16163@rembrandt.csv.ica.uni-stuttgart.de>
References: <404D0132.3020202@gentoo.org> <20040308234450.GF16163@rembrandt.csv.ica.uni-stuttgart.de> <404D0A18.6050802@gentoo.org> <20040309003447.GH16163@rembrandt.csv.ica.uni-stuttgart.de> <404D1909.1020005@gentoo.org> <20040309013841.GI16163@rembrandt.csv.ica.uni-stuttgart.de> <404D28B1.4010608@gentoo.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <404D28B1.4010608@gentoo.org>
From: Thiemo Seufer <ica2_ts@csv.ica.uni-stuttgart.de>
Return-Path: <ica2_ts@csv.ica.uni-stuttgart.de>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: linux-mips@linux-mips.org
Message-ID: <20040309023737.V_v2EffzwKkyzOzdzkghjJ598ywuBES3Ro4f0-MvYh8@z>

Kumba wrote:
> Thiemo Seufer wrote:
> 
> >It looks like that pax patch makes the difference.
> >
> >Speculation:
> >With this large alignment, the load would overwrite the exception
> >handlers at 0x80000000 if the firmware wouldn't recognize this area
> >as already in use. Reducing the alignment to 4k may improve things.
> >
> >Btw, an empty segment with no section assigned looks like a bug to me.
> >
> >Btw2, converting the non-writable segment into a writeable one
> >doesn't look like an improvement (but doesn't matter much).
> 
> Well, I re-generated my cross-compiler w/o the patch, doesn't seem to 
> have affected much.
> 
> I'll strip the remaining patches out, and see what the outcome is 
> (although the remaining patches have been in gentoo's binutils since 
> 2.13.* and haven't had issues).
[snip]
>   Type           Offset   VirtAddr   PhysAddr   FileSiz MemSiz  Flg Align
>   REGINFO        0x1573c0 0x881573c0 0x881573c0 0x00018 0x00018 R   0x4
>   LOAD           0x000000 0x88000000 0x88000000 0x16d000 0x194400 RWE 0x10000

Well, then the effects I wrote about were not caused by that patch
but by a broken linker. Re-doing the final link with the old linker
should be enough to prove that.

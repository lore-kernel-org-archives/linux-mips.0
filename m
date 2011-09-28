Received: from ausxippc101.us.dell.com ([143.166.85.207]:31109 "EHLO
        ausxippc101.us.dell.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S1492107Ab1I1PO1 convert rfc822-to-8bit
        (ORCPT <rfc822;linux-mips@linux-mips.org>);
        Wed, 28 Sep 2011 17:14:27 +0200
From: <Paul_Koning@Dell.com>
Date: Wed, 28 Sep 2011 10:11:40 -0500
Subject: RE: $ta0 .. $ta3 registers in O32 on MIPS
Message-ID: <09787EF419216C41A903FD14EE5506DD030987ABAE@AUSX7MCPC103.AMER.DELL.COM>
References: <20110928123305.GA1971@linux-mips.org>
In-Reply-To: <20110928123305.GA1971@linux-mips.org>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
MIME-Version: 1.0
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
Return-Path: <linux-mips-bounce@linux-mips.org>
To: ralf@linux-mips.org, binutils@sourceware.org, linux-mips@linux-mips.org, dvdkhlng@gmx.de
Message-ID: <20110928151140.SNmVnlXXVRsE2KAQUw7_tR3UpXtXUEc3c-VrfIfHMlw@z>

>The register names $ta0 .. $ta3 were added by SGI for N32 / N64 code.
>Because these reference $8 .. $11 just like $t0 .. $t3 in the O32 ABI their availability in O32 as well appears dangerous, if not a bug:
>
>$ cat s.s 
>	addu	$ta0, $ta0
>$ mips-linux-as -o s.o s.s
>$ file s.o
>s.o: ELF 32-bit MSB relocatable, MIPS, MIPS-I version 1 (SYSV), not stripped $
>
>I was expecting an error message and I'm wondering, was this intentional?

I would say so.  I call this a feature.  It makes it easier to write assembly code that assembles without change in both O32 and N32/N64.  Consider a function that has 4 or fewer arguments, but needs a pile of scratch registers.  It can use ta0-ta3 as four scratch registers, which is correct in all the ABIs.

	paul

Received: from mx.mips.com ([63.167.95.198]:30908 "EHLO dns0.mips.com")
	by ftp.linux-mips.org with ESMTP id S20029005AbXKMW5d (ORCPT
	<rfc822;linux-mips@linux-mips.org>); Tue, 13 Nov 2007 22:57:33 +0000
Message-ID: <02c801c82647$7b0619b0$10eca8c0@grendel>
From: "Kevin D. Kissell" <kevink@mips.com>
References: <473957B6.3030202@avtrex.com> <18233.36645.232058.964652@zebedee.pink> <20071113121036.GA6582@linux-mips.org> <cda58cb80711130514x16356ea3x4069616c9ee3caac@mail.gmail.com> <019e01c82602$f5463bf0$10eca8c0@grendel> <20071113150820.GB6582@linux-mips.org>
Subject: Re: Cannot unwind through MIPS signal frames withICACHE_REFILLS_WORKAROUND_WAR
Date: Tue, 13 Nov 2007 23:49:38 +0100
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-Path: <kevink@mips.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: Ralf Baechle <ralf@linux-mips.org>
Cc: Franck Bui-Huu <vagabon.xyz@gmail.com>, Andrew Haley <aph-gcc@littlepinkcloud.com>, David Daney <ddaney@avtrex.com>, linux-mips@linux-mips.org, Richard Sandiford <rsandifo@nildram.co.uk>, gcc@gcc.gnu.org
Message-ID: <20071113224938.qHPvd5r0LRRZgsa_5LYzQ3gLc-_mvXhUN_yQnl7Mus4@z>

> > True, though it should perhaps be noted that currently it's only on 4KSc/Sd
> > systems (which I know you work on) where it's even possible for the stack
> > *not* to have exec permissions, since the classical MIPS MMU gives
> > execute permission to any page that is readable.
> 
> Disabling PROT_EXEC on a mapping tells the kernel it doesn't need to take
> care of I-cache coherency.  So it's somewhat beneficial even in absence of
> a protection bit in the actual TLB hardware.

That depends on just what the consequences of I-cache incoherence might be.
Without help from the MMU, the kernel cannot *know* that a given location
isn't in the I-cache, because a program can always compute a pointer-to-function
to an arbitrary address and dereference it successfully so long as the location
is readable.  If it's only the user who does this that will suffer as a result of
I-cache incoherence, one can argue that it serves him right.  But if it can screw
up the execution of the kernel, or other user processes, I think we have to 
assume the worst.

> Some of these performance optimizations are impossible because the kernel
> can't have definate knowledge that certain addresses have never entered the
> I-cache.

Sad but true.

            Regards,

            Kevin K.

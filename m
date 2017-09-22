Received: from pio-pvt-msa3.bahnhof.se ([79.136.2.42]:57892 "EHLO
        pio-pvt-msa3.bahnhof.se" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S23990406AbdIVQiJx80n7 (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Fri, 22 Sep 2017 18:38:09 +0200
Date: Fri, 22 Sep 2017 18:37:54 +0200
From: Fredrik Noring <noring@nocrew.org>
Subject: Re: [PATCH v2] MIPS: Add basic R5900 support
Message-ID: <20170922163753.GA2415@localhost.localdomain>
References: <20170911151737.GA2265@localhost.localdomain>
 <alpine.DEB.2.00.1709141423180.16752@tp.orcam.me.uk>
 <20170916133423.GB32582@localhost.localdomain>
 <alpine.DEB.2.00.1709171001160.16752@tp.orcam.me.uk>
 <20170920140715.GA9255@localhost.localdomain>
 <alpine.DEB.2.00.1709201604400.16752@tp.orcam.me.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.00.1709201604400.16752@tp.orcam.me.uk>
Return-Path: <noring@nocrew.org>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: "Maciej W. Rozycki" <macro@imgtec.com>
Cc: linux-mips@linux-mips.org
Message-ID: <20170922163754.ffqtWX89Tva3MvEfGTf89rbq_Cik41DLma9eLJgpOFk@z>

Hi Maciej,

>  The operation is only defined for bits 63:0 AFAICS.  IIUC bits 127:64 
> remain unchanged (which is why I think that at the initial stage of R5900 
> support they have to be explicitly set to a fixed value on a context 
> switch, to prevent leaking information), but I have no means to verify it.
> 
>  In the interim to fix the value of bits 127:64 while keeping disruption 
> to existing code at the minimum you could AFAICT use a sequence like:
> 
> 	pcpyld	$1, $0, $1
> 	pcpyld	$2, $0, $2
> #	...
> 	pcpyld	$31, $0, $31
> 
> in RESTORE_SOME, preferably via an auxiliary macro.  Once we have switched 
> to saving/restoring full 128-bit registers, possibly with SQ/LQ, we can 
> remove this temporary measure.

Sounds reasonable!

>  This would verify whether the original contents of $17 were a properly 
> sign-extended 32-bit value.  Although for predictable operation I would 
> advise to use:
> 
> 	sll	k1, $17, 0
> 	sw	k1, PT_R17(sp)
> 	lw	k1, PT_R17(sp)
> 	tne	k1, $17, 12
> 
> or simply:
> 
> 	sll	k1, $17, 0
> 	tne	k1, $17, 12
> 	sw	$17, PT_R17(sp)

There is a slight complication: the trap appears to be taken before the
console is ready, hence nothing is displayed. Is there a practical way
to postpone or recover from a trap? The issue becomes somewhat involved
since the trap needs to save/restore registers for itself to recover,
and so might evoke boundless recursion.

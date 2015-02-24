Received: (from localhost user: 'macro', uid#1010) by eddie.linux-mips.org
        with ESMTP id S27006887AbbBXCd4iSPFm (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Tue, 24 Feb 2015 03:33:56 +0100
Date: Tue, 24 Feb 2015 02:33:56 +0000 (GMT)
From: "Maciej W. Rozycki" <macro@linux-mips.org>
Subject: Re: [PATCH V2 1/3] MIPS: Fix cache flushing for swap pages with
 non-DMA I/O.
In-Reply-To: <54EBD023.8090706@imgtec.com>
Message-ID: <alpine.LFD.2.11.1502240224500.17311@eddie.linux-mips.org>
References: <1424362664-30303-1-git-send-email-Steven.Hill@imgtec.com> <1424362664-30303-2-git-send-email-Steven.Hill@imgtec.com> <CAJiQ=7DMBznB5Ths0sAZORf2hgSQRuBoPF-7HGHhcHn0EajnWg@mail.gmail.com> <54EBCC38.7000702@imgtec.com>
 <54EBD023.8090706@imgtec.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-Path: <macro@linux-mips.org>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Zenon Fortuna <zenon.fortuna@imgtec.com>
Cc: Leonid Yegoshin <Leonid.Yegoshin@imgtec.com>, "Steven J. Hill" <Steven.Hill@imgtec.com>, IMG - MIPS Linux Kernel developers <IMG-MIPSLinuxKerneldevelopers@imgtec.com>, Linux MIPS Mailing List <linux-mips@linux-mips.org>
Message-ID: <20150224023356.S8LcvS3Ro4Sda9yoKfijho0fYnRI-KxaZr9OwzfzCU8@z>

On Mon, 23 Feb 2015, Zenon Fortuna wrote:

> Does the current system-call "cacheflush(2)" works with the newer kernels?
> As the "man cacheflush" tells, it was supposed to work only on MIPS based
> systems.

 It absolutely has to work, on the MIPS target GCC emits code invoking it 
to synchronise trampolines built at the run time on the stack (used for 
calling nested functions, a C language extension borrowed from Pascal, 
etc.), before passing execution there.  Verification of this syscall is 
probably implicitly covered by the GCC test suite already.

  Maciej

Received: from mailapp01.imgtec.com ([195.59.15.196]:24723 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27007145AbbBXV6HR4ESo (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Tue, 24 Feb 2015 22:58:07 +0100
Message-ID: <54ECF3E6.9080606@imgtec.com>
Date: Tue, 24 Feb 2015 13:57:58 -0800
From: Leonid Yegoshin <Leonid.Yegoshin@imgtec.com>
MIME-Version: 1.0
Subject: Re: [PATCH V2 1/3] MIPS: Fix cache flushing for swap pages with non-DMA
 I/O.
References: <1424362664-30303-1-git-send-email-Steven.Hill@imgtec.com> <1424362664-30303-2-git-send-email-Steven.Hill@imgtec.com> <CAJiQ=7DMBznB5Ths0sAZORf2hgSQRuBoPF-7HGHhcHn0EajnWg@mail.gmail.com> <54EBCC38.7000702@imgtec.com> <54EBD023.8090706@imgtec.com> <alpine.LFD.2.11.1502240224500.17311@eddie.linux-mips.org> <54ECE7CE.4040407@imgtec.com> <alpine.LFD.2.11.1502242140220.17311@eddie.linux-mips.org>
In-Reply-To: <alpine.LFD.2.11.1502242140220.17311@eddie.linux-mips.org>
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
Return-Path: <Leonid.Yegoshin@imgtec.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: "Maciej W. Rozycki" <macro@linux-mips.org>
Cc: Zenon Fortuna <zenon.fortuna@imgtec.com>, "Steven J. Hill" <Steven.Hill@imgtec.com>, IMG - MIPS Linux Kernel developers <IMG-MIPSLinuxKerneldevelopers@imgtec.com>, Linux MIPS Mailing List <linux-mips@linux-mips.org>
Message-ID: <20150224215758.AyMooDXbSIRzIeC2VV0i9t_YR1lPV0IokwXuwe9i2wQ@z>

On 02/24/2015 01:51 PM, Maciej W. Rozycki wrote:
> On Tue, 24 Feb 2015, Leonid Yegoshin wrote:
>
>>>    It absolutely has to work, on the MIPS target GCC emits code invoking it
>>> to synchronise trampolines built at the run time on the stack (used for
>>> calling nested functions, a C language extension borrowed from Pascal,
>>> etc.), before passing execution there.  Verification of this syscall is
>>> probably implicitly covered by the GCC test suite already.
>>>
>>>     Maciej
>> cacheflush() syscall traps into kernel and it executes I and D caches
>> flushing.
>>
>> However, it's implementation in 'master' branch from Linus tree is wrong: if
>> you call it in multicore environment for size > L1 cache size then it does it
>> incorrectly: doesn't call IPI for index cacheops.
>>
>> The correct way is ... sorry, can't find it in LMO...
>   Hmm, on SMP using hit operations for cacheflush(2) that rely on the
> hardware cache coherency protocol should be cheaper up to at least the
> size of the cache times the number of processors.  To say nothing of the
> the overhead of sending and receiving IPIs.
>
>   For simplicity perhaps on SMP we should just always use hit operations
> regardless of the size requested.

High performance folks may not like doing a lot of stuff for 8MB VMA 
release instead of flushing 64KB.

Especially taking into account TLB exceptions and postprocessing in 
fixup_exception() for swapped-out/not-yet-loaded-ELF blocks.

- Leonid.


> It's not like using cacheflush(2) for
> large blocks is that common.  And GCC trampolines consist of a couple of
> instructions only, they'll never hit the problem.
>
>    Maciej

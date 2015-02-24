Received: from mail-ie0-f176.google.com ([209.85.223.176]:44240 "EHLO
        mail-ie0-f176.google.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S27006911AbbBXX6XGXG1b (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Wed, 25 Feb 2015 00:58:23 +0100
Message-ID: <54ED1017.305@gmail.com>
Date: Tue, 24 Feb 2015 15:58:15 -0800
From: David Daney <ddaney.cavm@gmail.com>
MIME-Version: 1.0
Subject: Re: [PATCH V2 1/3] MIPS: Fix cache flushing for swap pages with non-DMA
 I/O.
References: <1424362664-30303-1-git-send-email-Steven.Hill@imgtec.com> <1424362664-30303-2-git-send-email-Steven.Hill@imgtec.com> <CAJiQ=7DMBznB5Ths0sAZORf2hgSQRuBoPF-7HGHhcHn0EajnWg@mail.gmail.com> <54EBCC38.7000702@imgtec.com> <54EBD023.8090706@imgtec.com> <alpine.LFD.2.11.1502240224500.17311@eddie.linux-mips.org> <54ECE7CE.4040407@imgtec.com> <alpine.LFD.2.11.1502242140220.17311@eddie.linux-mips.org> <54ECF3E6.9080606@imgtec.com> <alpine.LFD.2.11.1502242235160.17311@eddie.linux-mips.org> <54ED01F5.8040409@gmail.com> <54ED06F4.8020607@imgtec.com>
In-Reply-To: <54ED06F4.8020607@imgtec.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 8bit
Return-Path: <ddaney.cavm@gmail.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Leonid Yegoshin <Leonid.Yegoshin@imgtec.com>
Cc: "Maciej W. Rozycki" <macro@linux-mips.org>, Zenon Fortuna <zenon.fortuna@imgtec.com>, "Steven J. Hill" <Steven.Hill@imgtec.com>, IMG - MIPS Linux Kernel developers <IMG-MIPSLinuxKerneldevelopers@imgtec.com>, Linux MIPS Mailing List <linux-mips@linux-mips.org>
Message-ID: <20150224235815.3jleww2hKpwK0Kzrtu05hvlBgBcbtPfDmUu_9Kg11rI@z>

On 02/24/2015 03:19 PM, Leonid Yegoshin wrote:
> On 02/24/2015 02:57 PM, David Daney wrote:
>> On 02/24/2015 02:50 PM, Maciej W. Rozycki wrote:
>>> On Tue, 24 Feb 2015, Leonid Yegoshin wrote:
>>>
>>>>>    For simplicity perhaps on SMP we should just always use hit
>>>>> operations
>>>>> regardless of the size requested.
>>>>
>>>> High performance folks may not like doing a lot of stuff for 8MB VMA
>>>> release
>>>> instead of flushing 64KB.
>>>
>>>   What kind of a use case is that, what does it do?
>>>
>>>> Especially taking into account TLB exceptions and postprocessing in
>>>> fixup_exception() for swapped-out/not-yet-loaded-ELF blocks.
>>>
>>>   The normal use for cacheflush(2) I know of is for self-modifying or
>>> other
>>> run-time-generated code, to synchronise caches after a block of machine
>>> code has been patched in -- SYNCI can also be used for that purpose
>>> these
>>> days,
>>
>> SYNCI is only useful in non-SMP kernels.
> Yes, until MIPS R6. I pressed hard on Arch team to change vague words in
> SYNCI description and now (MIPS R6) it has words requiring execution on
> all cores:
>
>> "SYNCI globalization:
>> Release 6: SYNCI globalization (as described below) is required:
>> compliant implementations must globalize SYNCI.
>> Portable software can rely on this behavior, and use SYNCI rather than
>> expensive “instruction cache shootdown”
>> using inter-processor interrupts."

Wow.  I guess implementing -msynci wasn't a complete waste of time after 
all.

In any event, it is irrelevant with respect to the semantics of 
cacheflush(2), which still must be properly implemented.

David Daney
